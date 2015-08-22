//
//  APNErrorHandler.h
//  APNKit
//
//  Created by Norikazu on 2015/08/22.
//  Copyright © 2015年 Norikazu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APNError.h"

typedef NS_ENUM(NSInteger, APNErrorType) {
    APNErrorTypeAuthentication = 0,
    APNErrorTypeServer,
    APNErrorTypeNetwork,
    APNErrorTypeClient,
    APNErrorTypeUnknown
};


@protocol APNErrorHandlerDelegate;
@interface APNErrorHandler : NSObject

@property (nonatomic, weak) id <APNErrorHandlerDelegate> accountManager;
@property (nonatomic, weak) id <APNErrorHandlerDelegate> delegate;

+ (void)error:(NSError *)error handler:(void (^)(APNErrorType, NSArray <APNError *>*))completion;

@end


@protocol APNErrorHandlerDelegate <NSObject>

@optional
- (void)errorHandlingWithErrorCode:(NSString *)errorCode errorMessage:(NSString *)errorMessage;

@required
- (void)errorHandlingDone;

@end