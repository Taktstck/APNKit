//
//  APNAccount.h
//  APNKit
//
//  Created by Norikazu on 2015/08/19.
//  Copyright © 2015年 Norikazu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class APNImage, APNGEO;

@interface APNAccount : NSObject <NSCoding>

@property (nonatomic) NSString *gender;
@property (nonatomic) NSDate *birthday;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *screen_name;
@property (nonatomic) NSString *url;
@property (nonatomic) NSString *profile;
@property (nonatomic) NSString *location;
@property (nonatomic) APNImage *profile_image;
@property (nonatomic) APNImage *profile_background_image;
@property (nonatomic) BOOL geo_enabled;
@property (nonatomic) BOOL age_enabled;
@property (nonatomic) BOOL protected;
@property (nonatomic) APNGEO *geo;


@end
