//
//  APNServerMessage.h
//  APNKit
//
//  Created by Norikazu on 2015/08/22.
//  Copyright © 2015年 Norikazu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class APNError;
@interface APNServerMessage : NSObject

@property (nullable, nonatomic, retain) NSArray <NSString *>*messages;
@property (nullable, nonatomic, retain) NSArray <APNError *>*errors;

@end

NS_ASSUME_NONNULL_END