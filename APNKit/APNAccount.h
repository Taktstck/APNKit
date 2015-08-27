//
//  APNAccount.h
//  APNKit
//
//  Created by Norikazu on 2015/08/19.
//  Copyright © 2015年 Norikazu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class APNImage, APNGEO;

@interface APNAccount : NSObject <NSCoding>

@property (nullable, nonatomic, retain) NSString *id;
@property (nullable, nonatomic, retain) NSString *gender;
@property (nullable, nonatomic, retain) NSDate *birthday;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *screen_name;
@property (nullable, nonatomic, retain) NSString *url;
@property (nullable, nonatomic, retain) NSString *profile;
@property (nullable, nonatomic, retain) NSString *location;
@property (nullable, nonatomic, retain) APNImage *profile_image;
@property (nullable, nonatomic, retain) APNImage *profile_background_image;
@property (nonatomic) BOOL geo_enabled;
@property (nonatomic) BOOL age_enabled;
@property (nonatomic) BOOL protected;
@property (nullable, nonatomic, retain) APNGEO *geo;

@end

NS_ASSUME_NONNULL_END