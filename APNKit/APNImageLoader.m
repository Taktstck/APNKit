//
//  APNImageLoader.m
//  APNKit
//
//  Created by Norikazu on 2015/08/19.
//  Copyright © 2015年 Norikazu. All rights reserved.
//

#import "APNImageLoader.h"

@interface APNImageLoader ()


@end

@implementation APNImageLoader
{
    NSOperationQueue *_networkQueue;
    NSCache *_imageCache;
    NSCache *_thumbnaillCache;
    NSCache *_requestingUrls;
}
static APNImageLoader *_sharedInstance = nil;

+ (APNImageLoader *)sharedInstance
{
    @synchronized(self) {
        if (!_sharedInstance) {
            _sharedInstance = [APNImageLoader new];
        }
    }
    return _sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _networkQueue = [NSOperationQueue new];
        
        _requestingUrls = [NSCache new];
        _requestingUrls.countLimit = 20;
        
        _imageCache = [NSCache new];
        _imageCache.countLimit = 40;

        _thumbnaillCache = [NSCache new];
        _thumbnaillCache.countLimit = 100;
    }
    return self;
}

- (void)getImageAtPath:(NSString *)path completionHandler:(void (^)(NSData *, UIImage *, NSError *))completion
{
    UIImage *image = (UIImage *)[_imageCache objectForKey:path];
    if (image) {
        completion(nil, image, nil);
        return;
    } else {
        return [self _getImageAtPath:path completionHandler:completion];
    }
}

- (void)_getImageAtPath:(NSString *)path completionHandler:(void (^)(NSData *, UIImage *, NSError *))completion
{
    if ([_requestingUrls objectForKey:path]) {
        return;
    }
    
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:path] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:20];
    NSCache *__imageCache = _imageCache;
    NSCache *__requestingUrls = _requestingUrls;
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        [__requestingUrls removeObjectForKey:path];
        UIImage *image = nil;
        
        if (data) {
            image = [UIImage imageWithData:data];
            if (image) {
                [__imageCache setObject:image forKey:path];
            }
        }
        
        completion(data, image, error);
    }] resume];
}

- (void)getImageAtPath:(NSString *)path cache:(BOOL)cache completionHandler:(void (^)(NSURLResponse *, NSData *, UIImage *, NSError *))completion
{
    if (cache) {
        UIImage *image = (UIImage *)[_imageCache objectForKey:path];
        if (image) {
            completion(nil, nil, image, nil);
            return;
        } else {
            [self _getImageAtPath:path cache:cache completionHandler:completion];
        }
    } else {
        [self _getImageAtPath:path cache:cache completionHandler:completion];
    }
}

- (void)_getImageAtPath:(NSString *)path cache:(BOOL)cache completionHandler:(void (^)(NSURLResponse *, NSData *, UIImage *, NSError *))completion
{
    if ([_requestingUrls objectForKey:path]) {
        return;
    }
    
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:path] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:20];
    NSCache *__imageCache = _imageCache;
    NSCache *__requestingUrls = _requestingUrls;
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        [__requestingUrls removeObjectForKey:path];
        UIImage *image = nil;
        
        if (data) {
            image = [UIImage imageWithData:data];
            if (image) {
                [__imageCache setObject:image forKey:path];
            }
        }
        
        completion(response, data, image, error);

    }] resume];
}

- (void)getImageAtPath:(NSString *)path cache:(BOOL)cache success:(void (^)(NSURLResponse *, NSData *, UIImage *))success failure:(void (^)(NSError *))failure
{
    UIImage *image = (UIImage *)[_imageCache objectForKey:path];
    if (image) {
        success(nil, nil, image);
        return;
    } else {
        return [self _getImageAtPath:path cache:cache success:success failure:failure];
    }
}

- (void)_getImageAtPath:(NSString *)path cache:(BOOL)cache success:(void (^)(NSURLResponse *, NSData *, UIImage *))success failure:(void (^)(NSError *))failure
{
    if ([_requestingUrls objectForKey:path]) {
        return;
    }
    
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:path] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:20];
    NSCache *__imageCache = _imageCache;
    NSCache *__requestingUrls = _requestingUrls;
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        [__requestingUrls removeObjectForKey:path];
        
        if (error) {
            failure(error);
            return ;
        }
        
        if (data) {
            UIImage *image = [UIImage imageWithData:data];
            if (image) {
                [__imageCache setObject:image forKey:path];
            }
            success(response, data, image);
        }
    }] resume];
}

@end


@implementation APNImageLoader (APNImage)

- (NSCache *)imageCacheForSize:(APNImageSize)size
{
    switch (size) {
        case APNImageSizeThumbnail:
        case APNImageSizeSmall:
            return _thumbnaillCache;
            break;
            
        case APNImageSizeMedium:
        case APNImageSizeLarge:
        case APNImageSizeOriginal:
        default:
            return _imageCache;
            break;
    }
}

- (void)getImageForImage:(APNImage *)image size:(APNImageSize)size completionHandler:(void (^)(NSData *, UIImage *, NSError *))completion
{
    /*
    NSString *baseURL = [[RKObjectManager sharedManager].baseURL description];
    NSString *path;
    
    switch (size) {
            
        case APNImageSizeThumbnail:
            path = [NSString stringWithFormat:@"%@/1/media/image/%@?size=thumbnail",baseURL,image.id];
            break;
            
        case APNImageSizeSmall:
            path = [NSString stringWithFormat:@"%@/1/media/image/%@?size=small",baseURL,image.id];
            break;
            
        case APNImageSizeMedium:
            path = [NSString stringWithFormat:@"%@/1/media/image/%@?size=medium",baseURL,image.id];
            break;
            
        case APNImageSizeLarge:
            path = [NSString stringWithFormat:@"%@/1/media/image/%@?size=large",baseURL,image.id];
            break;
            
        case APNImageSizeOriginal:
        default:
            path = [NSString stringWithFormat:@"%@/1/media/image/%@",baseURL,image.id];
            break;
    }
     */
    NSString *path = nil;
    if ([self.delegate respondsToSelector:@selector(pathForSize:)]) {
        path = [self.delegate pathForSize:size];
    }
    path = [NSString stringWithFormat:@"%@%@", self.baseURL, path];
    if ([_requestingUrls objectForKey:path]) {
        return;
    }

    UIImage *cachedImage = (UIImage *)[[self imageCacheForSize:size] objectForKey:path];
    if (cachedImage) {
        completion(nil, cachedImage, nil);
    } else {
        NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:path] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:20];
        __weak NSCache *__imageCache = [self imageCacheForSize:size];
        __weak NSCache *__requestingUrls = _requestingUrls;
        
        [[[NSURLSession sharedSession] dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            [__requestingUrls removeObjectForKey:path];
            UIImage *image = nil;
            
            if (data) {
                image = [UIImage imageWithData:data];
                if (image) {
                    [__imageCache setObject:image forKey:path];
                }
            }
            
            completion(data, image, error);
        }] resume];
    }
}

@end

