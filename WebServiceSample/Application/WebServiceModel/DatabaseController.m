//
//  DatabaseController.m
//  Heaters1
//
//  Created by Alex on 12/27/15.
//  Copyright © 2015 Alex. All rights reserved.
//

#import "DatabaseController.h"
#import "AppDelegate.h"

@implementation DatabaseController
+ (DatabaseController *)sharedManager {
    static DatabaseController *sharedManager = nil;
    static dispatch_once_t onceToken=0;
    dispatch_once(&onceToken, ^{
        sharedManager = [DatabaseController manager];
        [sharedManager setRequestSerializer:[AFJSONRequestSerializer serializer]];
        [sharedManager.requestSerializer setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
        [sharedManager.requestSerializer setValue:@"123456789" forHTTPHeaderField:@"api-key"];
        [sharedManager setResponseSerializer:[AFHTTPResponseSerializer serializer]];
        
        
        
    });
    return sharedManager;
}

#pragma mark - User APIs
/*
-(void)userLogIn:(NSString *)email byPassword:(NSString *)password byLatitude:(NSString *)latitude byLongitude:(NSString *)longitude byDeviceId:(NSString *)device_id onSuccess:(SuccessBlock)completionBlock onFailure:(FailureBlock)failureBlock{
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithDictionary:@{@"email":email, @"password":password, @"latitude":latitude, @"longitude":longitude, @"device_id":device_id
                                }];
    
    NSString *urlTemp = [NSString stringWithFormat:@"%@%@%@", SERVER_BASE_URL, SERVER_BASE_USER_URL, LOGIN];
    NSString *url = [NSString stringWithFormat:@"%@%@", urlTemp, [commonUtils getLocalizedURL]];
    [self POST:url parameters:parameters vImage:nil onSuccess:completionBlock onFailure:failureBlock];
}

-(void)registerEmail:(NSString *)userID byEmail:(NSString *)email byPassword:(NSString *)password byLatitude:(NSString *)latitude byLongitude:(NSString *)longitude byDeviceId:(NSString *)device_id onSuccess:(SuccessBlock)completionBlock onFailure:(FailureBlock)failureBlock{
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithDictionary:@{@"user_id": userID, @"email":email, @"password":password, @"latitude":latitude, @"longitude":longitude, @"device_id":device_id
                                                                                      }];
    NSString *url = [NSString stringWithFormat:@"%@%@%@", SERVER_BASE_URL, SERVER_BASE_USER_URL, REGISTER_EMAIL];
    [self POST:url parameters:parameters vImage:nil onSuccess:completionBlock onFailure:failureBlock];

}
*/
-(void)test:(NSDictionary*)params  onSuccess:(SuccessBlock)completionBlock onFailure:(FailureBlock)failureBlock
{
    NSString *urlStr = DOO_GET_RECENT_POST;
    [self POST:urlStr parameters:[params mutableCopy] onSuccess:completionBlock onFailure:failureBlock];
}

#pragma mark - Post and Get Function

- (void)POST:(NSString *)url
  parameters:(NSMutableDictionary*)parameters
   onSuccess:(SuccessBlock)completionBlock
   onFailure:(FailureBlock)failureBlock
{
    // Check out network connection
    NetworkStatus networkStatus = [[Reachability reachabilityForInternetConnection] currentReachabilityStatus];
    if (networkStatus == NotReachable) {
        NSLog(@"There IS NO internet connection");
        [SHAlertHelper showOkAlertWithTitle:@"Error" message:@"We are unable to connect to our servers.\rPlease check your connection."];
        failureBlock(nil);
        return;
    }
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableDictionary * tempDic;
    if (parameters == nil) {
        tempDic = [NSMutableDictionary dictionary];
    }else{
        tempDic= [NSMutableDictionary dictionaryWithDictionary:parameters];
    }
    
//    [tempDic setObject:[User sharedInstance].strToken forKey:@"token"];
    parameters = tempDic;

    
    NSLog(@"POST url : %@", url);
    NSLog(@"POST param : %@", parameters);
    NSLog(@"Debug____________POST_____________!pause");
    
    [self POST:url
          parameters:parameters
          success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject){
              NSData* data = (NSData*)responseObject;
              NSError* error = nil;
              NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
              NSLog(@"POST success : %@", dict);
              
              completionBlock(dict);
              
        
          }failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error){
              NSLog(@"POST Error  %@", error);
              [SHAlertHelper showOkAlertWithTitle:@"Connection Error" andMessage:@"Error occurs while connecting to web-service. Please try again!" andOkBlock:nil];
              failureBlock(nil);
          }
    ];
    
  }




- (void)POST:(NSString *)url
  parameters:(NSMutableDictionary*)parameters
      vImage:(NSData*)vImage
   onSuccess:(SuccessBlock)completionBlock
   onFailure:(FailureBlock)failureBlock
{
    // Check out network connection
    NetworkStatus networkStatus = [[Reachability reachabilityForInternetConnection] currentReachabilityStatus];
    if (networkStatus == NotReachable) {
        NSLog(@"There IS NO internet connection");
        [SHAlertHelper showOkAlertWithTitle:@"Error" message:@"We are unable to connect to our servers.\rPlease check your connection."];
        failureBlock(nil);
        return;
    }
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSLog(@"POST url : %@", url);
    NSLog(@"POST param : %@", parameters);
    NSLog(@"Debug____________POST_____________!pause");
    
    [self POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (vImage != nil) {
            [formData appendPartWithFormData:vImage name:@"vImage"];
        }
    } success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSData* data = (NSData*)responseObject;
        NSError* error = nil;
        NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        NSLog(@"POST success : %@", dict);
        
       completionBlock(dict);
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"POST Error  %@", error);
        [SHAlertHelper showOkAlertWithTitle:@"Connection Error" andMessage:@"Error occurs while connecting to web-service. Please try again!" andOkBlock:nil];
        failureBlock(nil);
    }];
}


- (void)GET:(NSString *)url
 parameters:(NSMutableDictionary*)parameters
  onSuccess:(SuccessBlock)completionBlock
  onFailure:(FailureBlock)failureBlock
{
    // Check out network connection
    NetworkStatus networkStatus = [[Reachability reachabilityForInternetConnection] currentReachabilityStatus];
    if (networkStatus == NotReachable) {
        NSLog(@"There IS NO internet connection");
        [SHAlertHelper showOkAlertWithTitle:@"Error" message:@"We are unable to connect to our servers.\rPlease check your connection."];
        
        failureBlock(nil);
        return;
    }
    url = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"GET url : %@", url);
    NSLog(@"GET param : %@", parameters);
    
    [self GET:url parameters:parameters success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSData* data = (NSData*)responseObject;
        NSError* error = nil;
        NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
        NSLog(@"GET success : %@", dict);
        completionBlock(dict);
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"GET Error  %@", error);
        [SHAlertHelper showOkAlertWithTitle:@"Connection Error" andMessage:@"Error occurs while connecting to web-service. Please try again!" andOkBlock:nil];
        failureBlock(nil);
    }];
}

@end
