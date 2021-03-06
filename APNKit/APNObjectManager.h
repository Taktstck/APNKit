//
//  APNObjectManager.h
//  APNKit
//
//  Created by Norikazu on 2015/08/22.
//  Copyright © 2015年 Norikazu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>
#import "APNObject.h"
#import "APNImageLoader.h"
#import "APNObjectResponseDescriptor.h"

@interface APNObjectManager : NSObject


@property (nonatomic) APNImageLoader *imageLoader;
@property (nonatomic, copy) NSString *imageBaseURL;

@property NSCache *smallImageSizeCache;
@property NSCache *middleImageSizeCache;
@property NSCache *largeImageSizeCache;

+ (APNObjectManager *)sharedManager;

@end

@interface APNObjectManager (APNImageLoader) <APNImageLoaderDelegate>

- (void)getImageForImage:(APNImage *)image size:(APNImageSize)size completionHandler:(void (^)(NSData *data, UIImage *image, NSError *error))completion;

@end

@interface APNObjectManager (APNObjectDescriptor)

- (void)setupAllDescriptor;

@end