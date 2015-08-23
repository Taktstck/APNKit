//
//  APNObjectMapping.m
//  APNKit
//
//  Created by Norikazu on 2015/08/19.
//  Copyright © 2015年 Norikazu. All rights reserved.
//

#import "APNObjectMapping.h"

@implementation APNObjectMapping

+ (RKObjectMapping *)errorMapping
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[APNError class]];
    [mapping addAttributeMappingsFromArray:@[
                                             @"code",
                                             @"message"
                                             ]];
    
    
    return mapping;
}

+ (RKObjectMapping *)accountMapping
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[APNAccount class]];
    [mapping addAttributeMappingsFromArray:@[
                                             @"gender",
                                             @"birthday",
                                             @"name",
                                             @"screen_name",
                                             @"profile",
                                             @"location",
                                             @"age_enabled",
                                             @"geo_enabled",
                                             @"protected"
                                             ]];
    
    [mapping addPropertyMappingsFromArray:@[
                                            [RKRelationshipMapping relationshipMappingFromKeyPath:@"profile_background_image" toKeyPath:@"profile_background_image" withMapping:[APNObjectMapping imageMapping]],
                                            [RKRelationshipMapping relationshipMappingFromKeyPath:@"profile_image" toKeyPath:@"profile_image" withMapping:[APNObjectMapping imageMapping]]
                                            ]];
    
    return mapping;
}

+ (RKObjectMapping *)userMapping
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[APNUser class]];
    [mapping addAttributeMappingsFromArray:@[
                                             @"gender",
                                             @"birthday",
                                             @"name",
                                             @"screen_name",
                                             @"profile",
                                             @"location",
                                             @"age_enabled",
                                             @"geo_enabled",
                                             @"protected"
                                             ]];
    [mapping addPropertyMappingsFromArray:@[
                                            [RKRelationshipMapping relationshipMappingFromKeyPath:@"profile_background_image" toKeyPath:@"profile_background_image" withMapping:[APNObjectMapping imageMapping]],
                                            [RKRelationshipMapping relationshipMappingFromKeyPath:@"profile_image" toKeyPath:@"profile_image" withMapping:[APNObjectMapping imageMapping]]
                                            ]];
    return mapping;
}


+ (RKObjectMapping *)communityMapping
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[APNCommunity class]];
    [mapping addAttributeMappingsFromArray:@[
                                             @"id",
                                             @"name",
                                             @"created_at",
                                             @"updated_at",
                                             @"favorite_count",
                                             @"permission",
                                             @"effective_area",
                                             @"overview"
                                             ]];
    
    [mapping addPropertyMappingsFromArray:@[
                                            [RKRelationshipMapping relationshipMappingFromKeyPath:@"owners" toKeyPath:@"owners" withMapping:[APNObjectMapping userMapping]],
                                            [RKRelationshipMapping relationshipMappingFromKeyPath:@"placemark" toKeyPath:@"placemark" withMapping:[APNObjectMapping placemarkMapping]],
                                            [RKRelationshipMapping relationshipMappingFromKeyPath:@"main_image" toKeyPath:@"main_image" withMapping:[APNObjectMapping imageMapping]],
                                            [RKRelationshipMapping relationshipMappingFromKeyPath:@"good_images" toKeyPath:@"good_images" withMapping:[APNObjectMapping imageMapping]],
                                            [RKRelationshipMapping relationshipMappingFromKeyPath:@"geo" toKeyPath:@"geo" withMapping:[APNObjectMapping geoMapping]]
                                            ]];
    return mapping;

}


+ (RKObjectMapping *)boardMapping
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[APNBoard class]];
    [mapping addAttributeMappingsFromArray:@[
                                             @"id",
                                             @"text",
                                             @"created_at",
                                             @"favorite_count"
                                             ]];
    
    [mapping addPropertyMappingsFromArray:@[
                                            [RKRelationshipMapping relationshipMappingFromKeyPath:@"owner" toKeyPath:@"owner" withMapping:[APNObjectMapping userMapping]],
                                            [RKRelationshipMapping relationshipMappingFromKeyPath:@"community" toKeyPath:@"community" withMapping:[APNObjectMapping communityMapping]],
                                            [RKRelationshipMapping relationshipMappingFromKeyPath:@"images" toKeyPath:@"images" withMapping:[APNObjectMapping imageMapping]],
                                            [RKRelationshipMapping relationshipMappingFromKeyPath:@"geo" toKeyPath:@"geo" withMapping:[APNObjectMapping geoMapping]]
                                            ]];
    return mapping;

}


+ (RKObjectMapping *)geoMapping
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[APNGEO class]];
    [mapping addAttributeMappingsFromArray:@[
                                             @"type",
                                             @"coordinates"
                                             ]];
    
    return mapping;

}


+ (RKObjectMapping *)placemarkMapping
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[APNPlacemark class]];
    [mapping addAttributeMappingsFromArray:@[
                                             @"administrativeArea",
                                             @"areasOfInterest",
                                             @"country",
                                             @"inlandWater",
                                             @"isoCountryCode",
                                             @"locality",
                                             @"name",
                                             @"ocean",
                                             @"postalCode",
                                             @"subAdministrativeArea",
                                             @"subLocality",
                                             @"subThoroughfare",
                                             @"thoroughfare"
                                             ]];
    return mapping;

}


+ (RKObjectMapping *)imageMapping
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[APNImage class]];
    [mapping addAttributeMappingsFromArray:@[
                                             @"id",
                                             @"name",
                                             @"encoding",
                                             @"mimetype",
                                             @"dominant_color",
                                             @"favorite_count"
                                             ]];
    
    
    RKObjectMapping *ownerMapping = [RKObjectMapping mappingForClass:[APNUser class]];
    [ownerMapping addAttributeMappingsFromArray:@[
                                             @"gender",
                                             @"birthday",
                                             @"name",
                                             @"screen_name",
                                             @"profile",
                                             @"location",
                                             @"age_enabled",
                                             @"geo_enabled",
                                             @"protected"
                                             ]];
    [ownerMapping addPropertyMappingsFromArray:@[
                                            [RKRelationshipMapping relationshipMappingFromKeyPath:@"profile_background_image" toKeyPath:@"profile_background_image" withMapping:mapping],
                                            [RKRelationshipMapping relationshipMappingFromKeyPath:@"profile_image" toKeyPath:@"profile_image" withMapping:mapping]
                                            ]];
    
    [mapping addPropertyMappingsFromArray:@[
                                            [RKRelationshipMapping relationshipMappingFromKeyPath:@"owner" toKeyPath:@"owner" withMapping:ownerMapping],
                                            [RKRelationshipMapping relationshipMappingFromKeyPath:@"geo" toKeyPath:@"geo" withMapping:[APNObjectMapping geoMapping]]
                                            ]];
    return mapping;

}


+ (RKObjectMapping *)tagMapping
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[APNPlacemark class]];
    [mapping addAttributeMappingsFromArray:@[
                                             @"id",
                                             @"count",
                                             @"title",
                                             @"type"
                                             ]];
    return mapping;
}

+ (RKObjectMapping *)commentMapping
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[APNPlacemark class]];
    [mapping addAttributeMappingsFromArray:@[
                                             @"id",
                                             @"created_at",
                                             @"text"
                                             ]];
    [mapping addPropertyMappingsFromArray:@[
                                            [RKRelationshipMapping relationshipMappingFromKeyPath:@"owner" toKeyPath:@"owner" withMapping:[APNObjectMapping userMapping]],
                                            [RKRelationshipMapping relationshipMappingFromKeyPath:@"community" toKeyPath:@"community" withMapping:[APNObjectMapping communityMapping]],
                                            [RKRelationshipMapping relationshipMappingFromKeyPath:@"board" toKeyPath:@"board" withMapping:[APNObjectMapping boardMapping]]
                                            ]];
    return mapping;
}

// FIXME
+ (RKObjectMapping *)serverMessageMapping
{
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[APNPlacemark class]];
    [mapping addAttributeMappingsFromArray:@[
                                             @"errors",
                                             @"created_at",
                                             @"text"
                                             ]];
    return mapping;
}


@end
