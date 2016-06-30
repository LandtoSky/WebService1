//
//  AppController.h
//  WebServiceSample
//
//  Created by LandtoSky on 6/14/16.
//  Copyright © 2016 LandtoSky. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppController : NSObject

// Utility Variables
@property (nonatomic, strong) UIColor *appMainColor, *appTextColor, *appThirdColor;
@property (nonatomic, strong) DoAlertView *vAlert;

// Phone Contact Array
@property (nonatomic, strong) NSArray *contactArray;

+ (AppController *)sharedInstance;
@end
