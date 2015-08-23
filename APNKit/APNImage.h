//
//  APNImage.h
//  APNKit
//
//  Created by Norikazu on 2015/08/19.
//  Copyright © 2015年 Norikazu. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@class APNGEO, APNUser;

@interface APNImage : NSObject

@property (nullable, nonatomic, retain) NSString *id;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *encoding;
@property (nullable, nonatomic, retain) NSString *mimetype;
@property (nullable, nonatomic, retain) APNGEO *geo;
@property (nullable, nonatomic, retain) APNUser *owner;
@property (nullable, nonatomic, retain) NSString *dominant_color;
@property (nullable, nonatomic, retain) NSNumber *favorite_count;

/*
// size
@property (nullable, nonatomic, retain) NSData *extraLarge;
@property (nullable, nonatomic, retain) NSData *large;
@property (nullable, nonatomic, retain) NSData *medium;
@property (nullable, nonatomic, retain) NSData *original;
@property (nullable, nonatomic, retain) NSData *small;
@property (nullable, nonatomic, retain) NSData *thumbnail;
*/
@end

NS_ASSUME_NONNULL_END