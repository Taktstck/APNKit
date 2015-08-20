//
//  APNError.h
//  APNKit
//
//  Created by Norikazu on 2015/08/20.
//  Copyright © 2015年 Norikazu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APNError : NSObject

@property (nonatomic) NSNumber *code;
@property (nonatomic) NSString *message;

@end
