//
//  APNObjectManager.m
//  APNKit
//
//  Created by Norikazu on 2015/08/22.
//  Copyright © 2015年 Norikazu. All rights reserved.
//

#import "APNObjectManager.h"

@implementation APNObjectManager
{
    NSCache *_smallImageSizeCache;
    NSCache *_middleImageSizeCache;
    NSCache *_largeImageSizeCache;
}

@dynamic smallImageSizeCache;
@dynamic middleImageSizeCache;
@dynamic largeImageSizeCache;

static APNObjectManager *sharedManager = nil;

+ (APNObjectManager *)sharedManager;
{
    @synchronized(self) {
        if (!sharedManager) {
            sharedManager = [APNObjectManager new];
        }
    }
    return sharedManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _imageLoader = [APNImageLoader new];
        _imageLoader.delegate = self;
    }
    return self;
}

- (void)setImageBaseURL:(NSString *)imageBaseURL
{
    self.imageLoader.baseURL = imageBaseURL;
}


- (NSCache *)smallImageSizeCache
{
    if (_smallImageSizeCache) {
        return _smallImageSizeCache;
    }
    
    _smallImageSizeCache = [NSCache new];
    _smallImageSizeCache.countLimit = 100;
    return _smallImageSizeCache;
}

- (NSCache *)middleImageSizeCache
{
    if (_middleImageSizeCache) {
        return _middleImageSizeCache;
    }
    
    _middleImageSizeCache = [NSCache new];
    _middleImageSizeCache.countLimit = 50;
    return _middleImageSizeCache;
}

- (NSCache *)largeImageSizeCache
{
    if (_largeImageSizeCache) {
        return _largeImageSizeCache;
    }
    
    _largeImageSizeCache = [NSCache new];
    _largeImageSizeCache.countLimit = 30;
    return _largeImageSizeCache;
}


@end


@implementation APNObjectManager (APNImageLoader)

- (NSCache *)cacheForSize:(APNImageSize)size
{
    NSCache *cache;
    switch (size) {
        case APNImageSizeLarge:
        case APNImageSizeOriginal:
            cache = [self largeImageSizeCache];
            break;
        case APNImageSizeSmall:
        case APNImageSizeThumbnail:
            cache = [self smallImageSizeCache];
            break;
        case APNImageSizeMedium:
        default:
            cache = [self middleImageSizeCache];
            break;
    }
    return cache;
}

- (NSString *)pathForSize:(APNImageSize)size image:(APNImage *)image
{
    NSString *path;
    switch (size) {
        case APNImageSizeThumbnail:
            path = [NSString stringWithFormat:@"/1/media/image/%@?size=thumbnail",image.id];
            break;
            
        case APNImageSizeSmall:
            path = [NSString stringWithFormat:@"/1/media/image/%@?size=small",image.id];
            break;
            
        case APNImageSizeMedium:
            path = [NSString stringWithFormat:@"/1/media/image/%@?size=medium",image.id];
            break;
            
        case APNImageSizeLarge:
            path = [NSString stringWithFormat:@"/1/media/image/%@?size=large",image.id];
            break;
            
        case APNImageSizeOriginal:
        default:
            path = [NSString stringWithFormat:@"/1/media/image/%@",image.id];
            break;
    }
    return path;
}

- (void)getImageForImage:(APNImage *)image size:(APNImageSize)size completionHandler:(void (^)(NSData *data, UIImage *image, NSError *error))completion
{
    [self.imageLoader getImageForImage:image size:size completionHandler:completion];
}

@end

@implementation APNObjectManager (APNObjectDescriptor)

- (void)setupAllDescriptor
{
    
    [[RKObjectManager sharedManager] addResponseDescriptorsFromArray:@[
                                                                       
    // Error
    [APNObjectResponseDescriptor errorDescriptor],
    
    // Member
    [APNObjectResponseDescriptor signupDescriptor],
    [APNObjectResponseDescriptor loginDescriptor],
    [APNObjectResponseDescriptor logoutDescriptor],
    [APNObjectResponseDescriptor forgatPasswordDescriptor],
    
    
    // Account
    [APNObjectResponseDescriptor accountShow],
    [APNObjectResponseDescriptor accountVerifyCredentialDescriptor],
    [APNObjectResponseDescriptor accountUpdateProfileDescriptor],
    [APNObjectResponseDescriptor accountUpdateProfileImageDescriptor],
    [APNObjectResponseDescriptor accountUpdateProfileBackgroundImageDescriptor],
    [APNObjectResponseDescriptor accountOpenDescriptor],
    [APNObjectResponseDescriptor accountSuspendDescriptor],
    
    // Tags
    [APNObjectResponseDescriptor tagsSearchDescriptor],
    
    // Community
    [APNObjectResponseDescriptor communitiesNearby],
    [APNObjectResponseDescriptor communitiesHot],
    [APNObjectResponseDescriptor communitiesShow],
    [APNObjectResponseDescriptor communitiesUserTimeline],
    [APNObjectResponseDescriptor communitiesFavoriteTimeline],
    [APNObjectResponseDescriptor communitiesJoinTimeline],
    [APNObjectResponseDescriptor communitiesViewTimeline],
    [APNObjectResponseDescriptor communitiesCreate],
    [APNObjectResponseDescriptor communitiesUpdate],
    [APNObjectResponseDescriptor communitiesUpdateImage],
    [APNObjectResponseDescriptor communitiesDestroy],
    [APNObjectResponseDescriptor communitiesOpen],
    [APNObjectResponseDescriptor communitiesSuspend],
    [APNObjectResponseDescriptor communitiesClose],
    [APNObjectResponseDescriptor communitiesFavoriteCreate],
    [APNObjectResponseDescriptor communitiesFavoriteDestroy],
    [APNObjectResponseDescriptor communitiesParticipantCreate],
    [APNObjectResponseDescriptor communitiesParticipantExit],
    
    
    // Board
    [APNObjectResponseDescriptor boardsCommunityTimeline],
    [APNObjectResponseDescriptor boardsUserTimeline],
    [APNObjectResponseDescriptor boardsFavoriteTimeline],
    [APNObjectResponseDescriptor boardsCreate],
    [APNObjectResponseDescriptor boardsDestroy],
    [APNObjectResponseDescriptor boardsSuspend],
    [APNObjectResponseDescriptor boardsFavoriteCreate],
    [APNObjectResponseDescriptor boardsFavoriteDestroy],
    
    // Comments
    [APNObjectResponseDescriptor commentsTimeline],
    [APNObjectResponseDescriptor commentsCreate],
    [APNObjectResponseDescriptor commentsDestroy],
    [APNObjectResponseDescriptor commentsSuspend]
    ]];
}

@end