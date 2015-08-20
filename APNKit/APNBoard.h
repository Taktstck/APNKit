//
//  APNBoard.h
//  APNKit
//
//  Created by Norikazu on 2015/08/19.
//  Copyright © 2015年 Norikazu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class APNUser, APNImage, APNGEO, APNCommunity;

@interface APNBoard : NSObject

@property (nonatomic) NSString *id;
@property (nonatomic) APNUser *owner;
@property (nonatomic) NSString *text;
@property (nonatomic) NSArray <APNImage *>*images;
@property (nonatomic) APNGEO *geo;
@property (nonatomic) NSDate *created_at;
@property (nonatomic) APNCommunity *community;
@property (nonatomic) NSNumber *favorite_count;


@end
