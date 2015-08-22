//
//  APNErrorHandler.m
//  APNKit
//
//  Created by Norikazu on 2015/08/22.
//  Copyright © 2015年 Norikazu. All rights reserved.
//

#import "APNErrorHandler.h"

#define ERROR_COULD_NOT_CONNECT_TO_SERVER   0
#define ERROR_BAD_REQUEST                   400
#define ERROR_UNAUTHORIZED                  401
#define ERROR_PAYMENT_REQUIRED              402
#define ERROR_FORBIDDEN                     403
#define ERROR_NOT_FOUND                     404
#define ERROR_METHOD_NOT_ALLOWED            405
#define ERROR_NOT_ACCEPTABLE                406
#define ERROR_PROXY_AUTHENTICATION          407
#define ERROR_REQUEST_TIMEOUT               408
#define ERROR_CONFLICT                      409
#define ERROR_GONE                          410
#define ERROR_LENGTH_REQUIRED               411
#define ERROR_PRECONDITION_FAILED           412
#define ERROR_REQUEST_ENTITY_LARGE          413
#define ERROR_URI_TOO_LARGE                 414
#define ERROR_UNSUPPORTED_MEDIA_TYPE        415
#define ERROR_REQUESTED_RANGE_UNSATISFIED   416
#define ERROR_EXPECTATION_FAILED            417
#define ERROR_TEAPOT                        418
#define ERROR_ENHANCE_YOUR_CALM             420
#define ERROR_UNPROCESSABLE_ENTITY          422
#define ERROR_LOCKED                        423
#define ERROR_FAILED_DEPENDENCY             424
#define ERROR_UNORDERED_COLLECTION          425
#define ERROR_UPGRADE_REQUIRED              426
#define ERROR_PRECONDITION_REQUIRED         428
#define ERROR_TOO_MANY_REQUESTS             429
#define ERROR_METHOD_FAILURE                430
#define ERROR_HEADER_FIELDS_TOO_LARGE       431
#define ERROR_UNAVAILABLE_FOR_LEGAL_REASONS 451
#define ERROR_FAR_FROM_THE_PLACE            432
#define ERROR_NOT_AUTHENTICATE_YOU          433
#define ERROR_PAGE_NOT_FOUND                434
#define ERROR_IMAGE_SIZE_OVER_LIMIT         435
#define ERROR_FORBIDDEN_WORD_INCLUDE        436
#define ERROR_ADDRESS_OR_USER_EXIST         437
#define ERROR_OVER_RATE_LIMIT               438
#define ERROR_INVALID_OR_EXPIRED_TOKEN      439
#define ERROR_ACCOUNT_SUSPENDED             440
#define ERROR_OVER_CAPACITY                 441
#define ERROR_STATUS_DUPLICATE              442
#define ERROR_BAD_AUTHENTICATION_DATA       443
#define ERROR_VERIFY_LOGIN                  444
#define ERROR_INTERNAL_SERVER_ERROR         500



@implementation APNErrorHandler

+ (void)error:(NSError *)error handler:(void (^)(APNErrorType errorType, NSArray <APNError *>*errors))completion
{
    NSError *err = nil;
    NSDictionary *errorDict = [NSJSONSerialization JSONObjectWithData:[[[error userInfo] valueForKey:NSLocalizedRecoverySuggestionErrorKey] dataUsingEncoding:NSUTF8StringEncoding] options:0 error:&err];
    
    NSLog(@"error %@", errorDict);
    completion(APNErrorTypeAuthentication, @[]);
}

@end
