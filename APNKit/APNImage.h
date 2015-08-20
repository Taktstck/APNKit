//
//  APNImage.h
//  APNKit
//
//  Created by Norikazu on 2015/08/19.
//  Copyright © 2015年 Norikazu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class APNGEO, APNUser;

@interface APNImage : NSObject

@property (nonatomic) NSString *id;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *encoding;
@property (nonatomic) NSString *mimetype;
@property (nonatomic) NSData *data;
@property (nonatomic) APNGEO *geo;
@property (nonatomic) APNUser *owner;
@property (nonatomic) NSString *dominant_color;
@property (nonatomic) NSNumber *favorite_count;

@end
