//
//  APNImageLoader.h
//  APNKit
//
//  Created by Norikazu on 2015/08/19.
//  Copyright © 2015年 Norikazu. All rights reserved.
//

@import UIKit;
#import <RestKit/RestKit.h>
#import "APNObject.h"


typedef NS_ENUM(NSInteger, APNImageSize) {
    APNImageSizeOriginal,
    APNImageSizeThumbnail,
    APNImageSizeSmall,
    APNImageSizeMedium,
    APNImageSizeLarge
};

@protocol APNImageLoaderDelegate;
@interface APNImageLoader : NSObject

@property (nonatomic, copy) NSString *baseURL;
@property (nonatomic, weak) id <APNImageLoaderDelegate> delegate;

+ (APNImageLoader *)sharedInstance;

- (void)getImageAtPath:(NSString *)path completionHandler:(void (^)(NSData *data, UIImage *image, NSError *error))completion;
- (void)getImageAtPath:(NSString *)path cache:(BOOL)cache completionHandler:(void (^)(NSURLResponse *response, NSData *data, UIImage *image, NSError *error))completion;
- (void)getImageAtPath:(NSString *)path cache:(BOOL)cache success:(void (^)(NSURLResponse *response, NSData *data, UIImage *image))success failure:(void (^)(NSError *))failure;

@end


@interface APNImageLoader (APNImage)

- (void)getImageForImage:(APNImage *)image size:(APNImageSize)size completionHandler:(void (^)(NSData *data, UIImage *image, NSError *error))completion;

@end


@protocol APNImageLoaderDelegate <NSObject>

- (NSString *)pathForSize:(APNImageSize)size image:(APNImage *)image;
- (NSCache *)cacheForSize:(APNImageSize)size;

@end