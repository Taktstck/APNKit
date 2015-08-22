//
//  APNImageLoader.m
//  APNKit
//
//  Created by Norikazu on 2015/08/19.
//  Copyright © 2015年 Norikazu. All rights reserved.
//

#import "APNImageLoader.h"

@interface APNImageLoader ()

@property (readonly) NSOperationQueue *networkQueue;
@property (readonly) NSCache *imageCache;
@property (readonly) NSCache *thumbnaillCache;
@property (readonly) NSCache *requestingUrls;

@end

@implementation APNImageLoader
{
    NSOperationQueue *_networkQueue;
    NSCache *_imageCache;
    NSCache *_thumbnaillCache;
    NSCache *_requestingUrls;
}

@dynamic networkQueue, imageCache, thumbnaillCache, requestingUrls;

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
        
    }
    return self;
}

- (NSOperationQueue *)networkQueue
{
    @synchronized(self) {
        if (_networkQueue) {
            return _networkQueue;
        }
        _networkQueue = [NSOperationQueue new];
        return _networkQueue;
    }
}

- (NSCache *)imageCache
{
    if (_imageCache) {
        return _imageCache;
    }
    
    _imageCache = [NSCache new];
    _imageCache.countLimit = 40;
    
    return _imageCache;
}

- (NSCache *)thumbnaillCache
{
    if (_thumbnaillCache) {
        return _thumbnaillCache;
    }
    _thumbnaillCache = [NSCache new];
    _thumbnaillCache.countLimit = 100;
    return _thumbnaillCache;
}

- (NSCache *)requestingUrls
{
    if (_requestingUrls) {
        return _requestingUrls;
    }
    _requestingUrls = [NSCache new];
    _requestingUrls.countLimit = 20;
    return _requestingUrls;
}

- (void)getImageAtPath:(NSString *)path completionHandler:(void (^)(NSData *, UIImage *, NSError *))completion
{
    UIImage *image = (UIImage *)[self.imageCache objectForKey:path];
    if (image) {
        completion(nil, image, nil);
        return;
    } else {
        return [self _getImageAtPath:path completionHandler:completion];
    }
}

- (void)_getImageAtPath:(NSString *)path completionHandler:(void (^)(NSData *, UIImage *, NSError *))completion
{
    if ([self.requestingUrls objectForKey:path]) {
        return;
    }
    
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:path] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:20];
    NSCache *__imageCache = self.imageCache;
    NSCache *__requestingUrls = self.requestingUrls;
    
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
        UIImage *image = (UIImage *)[self.imageCache objectForKey:path];
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
    if ([self.requestingUrls objectForKey:path]) {
        return;
    }
    
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:path] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:20];
    NSCache *__imageCache = self.imageCache;
    NSCache *__requestingUrls = self.requestingUrls;
    
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
    UIImage *image = (UIImage *)[self.imageCache objectForKey:path];
    if (image) {
        success(nil, nil, image);
        return;
    } else {
        return [self _getImageAtPath:path cache:cache success:success failure:failure];
    }
}

- (void)_getImageAtPath:(NSString *)path cache:(BOOL)cache success:(void (^)(NSURLResponse *, NSData *, UIImage *))success failure:(void (^)(NSError *))failure
{
    if ([self.requestingUrls objectForKey:path]) {
        return;
    }
    
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:path] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:20];
    NSCache *__imageCache = self.imageCache;
    NSCache *__requestingUrls = self.requestingUrls;
    
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
    
    NSString *path = nil;
    if ([self.delegate respondsToSelector:@selector(pathForSize:image:)]) {
        path = [self.delegate pathForSize:size image:image];
    }
    path = [NSString stringWithFormat:@"%@%@", self.baseURL, path];
    if ([self.requestingUrls objectForKey:path]) {
        return;
    }

    UIImage *cachedImage = (UIImage *)[[self imageCacheForSize:size] objectForKey:path];
    if (cachedImage) {
        completion(nil, cachedImage, nil);
    } else {
        NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:path] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:20];
        __weak NSCache *__imageCache = [self imageCacheForSize:size];
        __weak NSCache *__requestingUrls = self.requestingUrls;
        
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

