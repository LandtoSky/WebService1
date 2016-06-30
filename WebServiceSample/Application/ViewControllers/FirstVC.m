//
//  FirstVC.m
//  WebServiceSample
//
//  Created by LandtoSky on 6/14/16.
//  Copyright © 2016 LandtoSky. All rights reserved.
//

#import "FirstVC.h"

@implementation FirstVC

- (IBAction)onLoad:(UIButton*)sender
{
    
    if(self.isLoadingBase) return;
//
//    if([commonUtils isFormEmpty:[@[self.emailTextField.text, self.passwordTextField.text] mutableCopy]]) {
//        [commonUtils showVAlertSimple:@"Warning" body:@"Please complete entire form" duration:1.2];
//    }else if(![commonUtils validateEmail:_emailTextField.text]) {
//        [commonUtils showVAlertSimple:@"Warning" body:@"Email address is not in a vaild format" duration:1.2];
//    }else if([self.passwordTextField.text length] < 8 || [self.passwordTextField.text length] > 20){
//        [commonUtils showVAlertSimple:@"Warning" body:@"Password length must be between 8 and 20 characters" duration:1.2];
//    }else{
    
        
        if ([commonUtils getDeviceUDID] != nil) {
            
//            if([commonUtils getUserDefault:@"currentLatitude"] && [commonUtils getUserDefault:@"currentLongitude"]) {
//                
//                NSString *latitude = [commonUtils getUserDefault:@"currentLatitude"];
//                NSString *longitude = [commonUtils getUserDefault:@"currentLongitude"];
//                NSString *device_ID = [commonUtils getDeviceUDID];
            
            NSDictionary *params = @{
                                     @"count":@(0),
                                     @"user_id":@(8),
                                     @"category_id":@(0)
                                     
                                     };
                
                [JSWaiter ShowWaiter:self.view title:@"Log in..." type:0];
                self.isLoadingBase = YES;
            [[DatabaseController sharedManager] test:params onSuccess:^(id response){
                    
                    [JSWaiter HideWaiter];
                    NSLog(@"response Data : %@", response);
                    
                    self.isLoadingBase = NO;
                    
                } onFailure:^(id error){
                    
                    [JSWaiter HideWaiter];
                    self.isLoadingBase = NO;
                }];
//            }
            
        }else{
            
            //testing
            if([commonUtils getUserDefault:@"currentLatitude"] && [commonUtils getUserDefault:@"currentLongitude"]) {
                
//                NSString *latitude = [commonUtils getUserDefault:@"currentLatitude"];
//                NSString *longitude = [commonUtils getUserDefault:@"currentLongitude"];
//                NSString *device_ID = @"F7F69BD1-D1A7-4426-8932-EDCA90C5D962";
                
                [JSWaiter ShowWaiter:self.view title:@"Log in..." type:0];
                self.isLoadingBase = YES;
                [[DatabaseController sharedManager] test:nil onSuccess:^(id response){
                    [JSWaiter HideWaiter];
                    NSLog(@"response Data : %@", response);
                    
                    self.isLoadingBase = NO;
                    
                } onFailure:^(id error){
                    [JSWaiter HideWaiter];
                    self.isLoadingBase = NO;
                }];
            }
        }
//    }

}

@end
