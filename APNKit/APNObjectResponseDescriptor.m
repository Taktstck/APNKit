//
//  APNObjectResponseDescriptor.m
//  APNKit
//
//  Created by Norikazu on 2015/08/22.
//  Copyright © 2015年 Norikazu. All rights reserved.
//

#import "APNObjectResponseDescriptor.h"

@implementation APNObjectResponseDescriptor


+ (RKResponseDescriptor *)errorDescriptor
{
    RKObjectMapping *errorMapping = [RKObjectMapping mappingForClass:[RKErrorMessage class]];
    NSIndexSet *statusCodes = RKStatusCodeIndexSetForClass(RKStatusCodeClassClientError);
    return [RKResponseDescriptor responseDescriptorWithMapping:errorMapping method:RKRequestMethodAny pathPattern:nil keyPath:nil
                                                               statusCodes:statusCodes];
}

// Member
+ (RKResponseDescriptor *)loginDescriptor
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping accountMapping]
                                                        method:RKRequestMethodPOST
                                                   pathPattern:@"/login"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)signupDescriptor
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping accountMapping]
                                                        method:RKRequestMethodPOST
                                                   pathPattern:@"/signup"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)logoutDescriptor
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping accountMapping]
                                                        method:RKRequestMethodGET
                                                   pathPattern:@"/logout"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)forgatPasswordDescriptor
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping serverMessageMapping]
                                                        method:RKRequestMethodPOST
                                                   pathPattern:@"/password/verify"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}



// Account
+ (RKResponseDescriptor *)accountShow
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping userMapping]
                                                        method:RKRequestMethodGET
                                                   pathPattern:@"/1/account/show"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)accountVerifyCredentialDescriptor
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping accountMapping]
                                                        method:RKRequestMethodGET
                                                   pathPattern:@"/1/account/verify_credentials"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}


+ (RKResponseDescriptor *)accountUpdateProfileDescriptor
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping accountMapping]
                                                        method:RKRequestMethodPOST
                                                   pathPattern:@"/1/account/update_profile"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)accountUpdateProfileImageDescriptor
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping accountMapping]
                                                        method:RKRequestMethodPOST
                                                   pathPattern:@"/1/account/update_profile_image"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)accountUpdateProfileBackgroundImageDescriptor
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping accountMapping]
                                                        method:RKRequestMethodPOST
                                                   pathPattern:@"/1/account/update_profile_background_image"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)accountOpenDescriptor
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping accountMapping]
                                                        method:RKRequestMethodPOST
                                                   pathPattern:@"/1/account/open/:id"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)accountSuspendDescriptor
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping accountMapping]
                                                        method:RKRequestMethodPOST
                                                   pathPattern:@"/1/account/suspend/:id"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

// Tags

+ (RKResponseDescriptor *)tagsSearchDescriptor
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping accountMapping]
                                                        method:RKRequestMethodGET
                                                   pathPattern:@"/1/tags/search"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

// Community
+ (RKResponseDescriptor *)communitiesNearby
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping communityMapping]
                                                        method:RKRequestMethodGET
                                                   pathPattern:@"/1/communities/nearby"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)communitiesHot
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping communityMapping]
                                                        method:RKRequestMethodGET
                                                   pathPattern:@"/1/communities/hot"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)communitiesShow
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping communityMapping]
                                                        method:RKRequestMethodGET
                                                   pathPattern:@"/1/communities/show/:id"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)communitiesUserTimeline
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping communityMapping]
                                                        method:RKRequestMethodGET
                                                   pathPattern:@"/1/communities/user_timeline"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)communitiesFavoriteTimeline
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping communityMapping]
                                                        method:RKRequestMethodGET
                                                   pathPattern:@"/1/communities/favorite_timeline"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)communitiesJoinTimeline
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping communityMapping]
                                                        method:RKRequestMethodGET
                                                   pathPattern:@"/1/communities/join_timeline"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)communitiesViewTimeline
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping communityMapping]
                                                        method:RKRequestMethodGET
                                                   pathPattern:@"/1/communities/view_timeline"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)communitiesCreate
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping communityMapping]
                                                        method:RKRequestMethodPOST
                                                   pathPattern:@"/1/communities/create"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)communitiesUpdate
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping communityMapping]
                                                        method:RKRequestMethodPOST
                                                   pathPattern:@"/1/communities/update/:id"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)communitiesUpdateImage
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping communityMapping]
                                                        method:RKRequestMethodPOST
                                                   pathPattern:@"/1/communities/update_image/:id"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)communitiesDestroy
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping communityMapping]
                                                        method:RKRequestMethodPOST
                                                   pathPattern:@"/1/communities/destroy/:id"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)communitiesOpen
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping communityMapping]
                                                        method:RKRequestMethodPOST
                                                   pathPattern:@"/1/communities/open/:id"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)communitiesSuspend
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping communityMapping]
                                                        method:RKRequestMethodPOST
                                                   pathPattern:@"/1/communities/suspned/:id"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)communitiesClose
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping communityMapping]
                                                        method:RKRequestMethodPOST
                                                   pathPattern:@"/1/communities/close/:id"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)communitiesFavoriteCreate
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping communityMapping]
                                                        method:RKRequestMethodPOST
                                                   pathPattern:@"/1/communities/favorite/create"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)communitiesFavoriteDestroy
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping communityMapping]
                                                        method:RKRequestMethodPOST
                                                   pathPattern:@"/1/communities/favorite/destroy"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)communitiesParticipantCreate
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping communityMapping]
                                                        method:RKRequestMethodPOST
                                                   pathPattern:@"/1/communities/participant/create"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)communitiesParticipantExit
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping communityMapping]
                                                        method:RKRequestMethodPOST
                                                   pathPattern:@"/1/communities/participant/exit"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}


// Board
+ (RKResponseDescriptor *)boardsCommunityTimeline
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping boardMapping]
                                                        method:RKRequestMethodGET
                                                   pathPattern:@"/1/boards/community_timeline"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)boardsUserTimeline
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping boardMapping]
                                                        method:RKRequestMethodGET
                                                   pathPattern:@"/1/boards/user_timeline"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)boardsFavoriteTimeline
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping boardMapping]
                                                        method:RKRequestMethodGET
                                                   pathPattern:@"/1/boards/favorite_timeline"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)boardsCreate
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping boardMapping]
                                                        method:RKRequestMethodPOST
                                                   pathPattern:@"/1/boards/create"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)boardsDestroy
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping boardMapping]
                                                        method:RKRequestMethodPOST
                                                   pathPattern:@"/1/boards/destroy"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)boardsSuspend
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping boardMapping]
                                                        method:RKRequestMethodPOST
                                                   pathPattern:@"/1/boards/suspend"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)boardsFavoriteCreate
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping boardMapping]
                                                        method:RKRequestMethodPOST
                                                   pathPattern:@"/1/boards/favorite/create"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}
+ (RKResponseDescriptor *)boardsFavoriteDestroy
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping boardMapping]
                                                        method:RKRequestMethodPOST
                                                   pathPattern:@"/1/boards/favorite/destroy"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

// Comments
+ (RKResponseDescriptor *)commentsTimeline
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping commentMapping]
                                                        method:RKRequestMethodGET
                                                   pathPattern:@"/1/comments/timeline"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)commentsCreate
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping commentMapping]
                                                        method:RKRequestMethodPOST
                                                   pathPattern:@"/1/comments/create"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)commentsDestroy
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping commentMapping]
                                                        method:RKRequestMethodPOST
                                                   pathPattern:@"/1/comments/destroy"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

+ (RKResponseDescriptor *)commentsSuspend
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping commentMapping]
                                                        method:RKRequestMethodPOST
                                                   pathPattern:@"/1/comments/suspend"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}

// Seach
+ (RKResponseDescriptor *)keywordSearch
{
    return [RKResponseDescriptor responseDescriptorWithMapping:[APNObjectMapping commentMapping]
                                                        method:RKRequestMethodPOST
                                                   pathPattern:@"/1/comments/suspend"
                                                       keyPath:nil
                                                   statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
}


@end
