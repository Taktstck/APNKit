//
//  APNAccount.m
//  APNKit
//
//  Created by Norikazu on 2015/08/19.
//  Copyright © 2015年 Norikazu. All rights reserved.
//

#import "APNAccount.h"

@implementation APNAccount

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        self.gender = [aDecoder decodeObjectForKey:@"gender"];
        self.birthday = [aDecoder decodeObjectForKey:@"birthday"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.screen_name = [aDecoder decodeObjectForKey:@"screen_name"];
        self.url = [aDecoder decodeObjectForKey:@"url"];
        self.profile = [aDecoder decodeObjectForKey:@"profile"];
        self.location = [aDecoder decodeObjectForKey:@"location"];
        self.geo_enabled = [aDecoder decodeObjectForKey:@"geo_enabled"];
        self.age_enabled = [aDecoder decodeObjectForKey:@"age_enabled"];
        self.protected = [aDecoder decodeObjectForKey:@"protected"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.gender forKey:@"gender"];
    [aCoder encodeObject:self.birthday forKey:@"birthday"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.screen_name forKey:@"screen_name"];
    [aCoder encodeObject:self.url forKey:@"url"];
    [aCoder encodeObject:self.profile forKey:@"profile"];
    [aCoder encodeObject:self.location forKey:@"location"];
    [aCoder encodeBool:self.geo_enabled forKey:@"geo_enabled"];
    [aCoder encodeBool:self.age_enabled forKey:@"age_enabled"];
    [aCoder encodeBool:self.protected forKey:@"protected"];
}

@end
