//
//  APNObjectMapping.h
//  APNKit
//
//  Created by Norikazu on 2015/08/19.
//  Copyright © 2015年 Norikazu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>
#import "APNObject.h"

@interface APNObjectMapping : NSObject

+ (RKObjectMapping *)accountMapping;
+ (RKObjectMapping *)userMapping;
+ (RKObjectMapping *)communityMapping;
+ (RKObjectMapping *)boardMapping;
+ (RKObjectMapping *)geoMapping;
+ (RKObjectMapping *)placemarkMapping;
+ (RKObjectMapping *)imageMapping;
+ (RKObjectMapping *)tagMapping;
+ (RKObjectMapping *)commentMapping;

@end
