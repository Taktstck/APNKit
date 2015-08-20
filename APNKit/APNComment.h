//
//  APNComment.h
//  APNKit
//
//  Created by Norikazu on 2015/08/20.
//  Copyright © 2015年 Norikazu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class APNUser, APNBoard, APNCommunity;

@interface APNComment : NSObject

@property (nonatomic) NSDate *created_at;
@property (nonatomic) APNUser *owner;
@property (nonatomic) APNBoard *board;
@property (nonatomic) APNCommunity *community;
@property (nonatomic) NSString *text;

@end
