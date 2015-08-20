//
//  APNPlacemark.h
//  APNKit
//
//  Created by Norikazu on 2015/08/20.
//  Copyright © 2015年 Norikazu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface APNPlacemark : NSObject

@property (nullable, nonatomic, retain) NSString *administrativeArea;
@property (nullable, nonatomic, retain) NSString *areasOfInterest;
@property (nullable, nonatomic, retain) NSString *country;
@property (nullable, nonatomic, retain) NSString *inlandWater;
@property (nullable, nonatomic, retain) NSString *isoCountryCode;
@property (nullable, nonatomic, retain) NSString *locality;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *ocean;
@property (nullable, nonatomic, retain) NSString *postalCode;
@property (nullable, nonatomic, retain) NSString *subAdministrativeArea;
@property (nullable, nonatomic, retain) NSString *subLocality;
@property (nullable, nonatomic, retain) NSString *subThoroughfare;
@property (nullable, nonatomic, retain) NSString *thoroughfare;

@end

NS_ASSUME_NONNULL_END