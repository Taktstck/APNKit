//
//  APNCommunity.h
//  APNKit
//
//  Created by Norikazu on 2015/08/19.
//  Copyright © 2015年 Norikazu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class APNImage, APNGEO, APNUser, APNPlacemark;

@interface APNCommunity : NSObject

@property (nonatomic) NSString *id;
@property (nonatomic) NSString *name;
@property (nonatomic) APNPlacemark *placemark;
@property (nonatomic) APNGEO *geo;
@property (nonatomic) APNImage *main_image;
@property (nonatomic) NSArray <APNUser *>*owners;
@property (nonatomic) NSDate *created_at;
@property (nonatomic) NSDate *updated_at;
@property (nonatomic) NSNumber *favorite_count;
@property (nonatomic) NSString *permission;
@property (nonatomic) NSArray <APNImage *>*good_images;
@property (nonatomic) NSNumber *effective_area;
@property (nonatomic) NSString *overview;


@end
