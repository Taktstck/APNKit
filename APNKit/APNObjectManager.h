//
//  APNObjectManager.h
//  APNKit
//
//  Created by Norikazu on 2015/08/22.
//  Copyright © 2015年 Norikazu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APNObject.h"
#import "APNImageLoader.h"

@interface APNObjectManager : NSObject


@property (nonatomic) APNImageLoader *imageLoader;
@property NSCache *smallImageSizeCache;
@property NSCache *middleImageSizeCache;
@property NSCache *largeImageSizeCache;

+ (APNObjectManager *)sharedManager;

@end

@interface APNObjectManager (APNImageLoader) <APNImageLoaderDelegate>

- (void)getImageForImage:(APNImage *)image size:(APNImageSize)size completionHandler:(void (^)(NSData *data, UIImage *image, NSError *error))completion;

@end