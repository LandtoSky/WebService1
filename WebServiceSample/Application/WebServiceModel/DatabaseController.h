//
//  DatabaseController.h
//  Heaters1
//
//  Created by Alex on 12/27/15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "Reachability.h"
#import "SHAlertHelper.h"

#define SERVER_BASE_URL           @"http://www.new.miracle-meet.com/services/api/"
//#define SERVER_BASE_URL           @"http://www.new.miracle-meet.com/services/api/test/"

#define SERVER_BASE_USER_URL      @"Users/"
#define SERVER_BASE_HELPER_URL    @"Helpers/"
#define SERVER_COMECHAT_BASE_URL  @"http://www.new.miracle-meet.com/cometchat/"

#define LOGIN                     @"login/1/"
#define REGISTER_EMAIL            @"registerEmail/2/"

#define DOO_TEST @"http://52.11.23.86/api/test.php"
#define KAMIWAZA_TEST @"http://172.16.1.214:8080/kamiwaza/api/test"

#define DOO_GET_RECENT_POST @"http://52.11.23.86/api/get_recent_posts.php"


typedef void (^SuccessBlock)(id json);
typedef void (^FailureBlock)(id json);

@interface DatabaseController : AFHTTPRequestOperationManager
{

}

+ (DatabaseController *)sharedManager;

//-(void)userLogIn:(NSString *)email byPassword:(NSString *)password byLatitude:(NSString *)latitude byLongitude:(NSString *)longitude byDeviceId:(NSString *)device_id onSuccess:(SuccessBlock)completionBlock onFailure:(FailureBlock)failureBlock;
//-(void)registerEmail:(NSString *)userID byEmail:(NSString *)email byPassword:(NSString *)password byLatitude:(NSString *)latitude byLongitude:(NSString *)longitude byDeviceId:(NSString *)device_id onSuccess:(SuccessBlock)completionBlock onFailure:(FailureBlock)failureBlock;
-(void)test:(NSDictionary*)params  onSuccess:(SuccessBlock)completionBlock onFailure:(FailureBlock)failureBlock;

-(void)POST:(NSString *)url
 parameters:(NSMutableDictionary*)parameters
      onSuccess:(SuccessBlock)completionBlock
  onFailure:(FailureBlock)failureBlock;

-(void)POST:(NSString *)url
  parameters:(NSMutableDictionary*)parameters
      vImage:(NSData*)vImage
   onSuccess:(SuccessBlock)completionBlock
   onFailure:(FailureBlock)failureBlock;
- (void)GET:(NSString *)url
parameters:(NSMutableDictionary*)parameters
onSuccess:(SuccessBlock)completionBlock
  onFailure:(FailureBlock)failureBlock;

@end