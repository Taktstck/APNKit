//
//  APNObjectResponseDescriptor.h
//  APNKit
//
//  Created by Norikazu on 2015/08/22.
//  Copyright © 2015年 Norikazu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>
#import "APNObjectMapping.h"

@interface APNObjectResponseDescriptor : NSObject

// Error
+ (RKResponseDescriptor *)errorDescriptor;

// Member
+ (RKResponseDescriptor *)signupDescriptor;
+ (RKResponseDescriptor *)loginDescriptor;
+ (RKResponseDescriptor *)logoutDescriptor;
+ (RKResponseDescriptor *)forgatPasswordDescriptor;


// Account
+ (RKResponseDescriptor *)accountShow;
+ (RKResponseDescriptor *)accountVerifyCredentialDescriptor;
+ (RKResponseDescriptor *)accountUpdateProfileDescriptor;
+ (RKResponseDescriptor *)accountUpdateProfileImageDescriptor;
+ (RKResponseDescriptor *)accountUpdateProfileBackgroundImageDescriptor;
+ (RKResponseDescriptor *)accountOpenDescriptor;
+ (RKResponseDescriptor *)accountSuspendDescriptor;

// Tags
+ (RKResponseDescriptor *)tagsSearchDescriptor;

// Community
+ (RKResponseDescriptor *)communitiesNearby;
+ (RKResponseDescriptor *)communitiesHot;
+ (RKResponseDescriptor *)communitiesShow;
+ (RKResponseDescriptor *)communitiesUserTimeline;
+ (RKResponseDescriptor *)communitiesFavoriteTimeline;
+ (RKResponseDescriptor *)communitiesJoinTimeline;
+ (RKResponseDescriptor *)communitiesViewTimeline;
+ (RKResponseDescriptor *)communitiesCreate;
+ (RKResponseDescriptor *)communitiesUpdate;
+ (RKResponseDescriptor *)communitiesUpdateImage;
+ (RKResponseDescriptor *)communitiesDestroy;
+ (RKResponseDescriptor *)communitiesOpen;
+ (RKResponseDescriptor *)communitiesSuspend;
+ (RKResponseDescriptor *)communitiesClose;
+ (RKResponseDescriptor *)communitiesFavoriteCreate;
+ (RKResponseDescriptor *)communitiesFavoriteDestroy;
+ (RKResponseDescriptor *)communitiesParticipantCreate;
+ (RKResponseDescriptor *)communitiesParticipantExit;


// Board
+ (RKResponseDescriptor *)boardsCommunityTimeline;
+ (RKResponseDescriptor *)boardsUserTimeline;
+ (RKResponseDescriptor *)boardsFavoriteTimeline;
+ (RKResponseDescriptor *)boardsCreate;
+ (RKResponseDescriptor *)boardsDestroy;
+ (RKResponseDescriptor *)boardsSuspend;
+ (RKResponseDescriptor *)boardsFavoriteCreate;
+ (RKResponseDescriptor *)boardsFavoriteDestroy;

// Comments
+ (RKResponseDescriptor *)commentsTimeline;
+ (RKResponseDescriptor *)commentsCreate;
+ (RKResponseDescriptor *)commentsDestroy;
+ (RKResponseDescriptor *)commentsSuspend;

// Seach
//+ (RKResponseDescriptor *)keywordSearch;

@end
