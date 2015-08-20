//
//  APNImageLoader.h
//  APNKit
//
//  Created by Norikazu on 2015/08/19.
//  Copyright © 2015年 Norikazu. All rights reserved.
//

@import UIKit;

@interface APNImageLoader : NSObject

- (void)getImageAtPath:(NSString *)path completionHandler:(void (^)(NSData *, UIImage *, NSError *))completion;
- (void)getImageAtPath:(NSString *)path cache:(BOOL)cache completionHandler:(void (^)(NSURLResponse *, NSData *, UIImage *, NSError *))completion;
- (void)getImageAtPath:(NSString *)path cache:(BOOL)cache success:(void (^)(NSURLResponse *, NSData *, UIImage *))success failure:(void (^)(NSError *))failure;

@end
