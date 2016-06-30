//
//  Config.h
//  WebServiceSample
//
//  Created by LandtoSky on 6/14/16.
//  Copyright © 2016 LandtoSky. All rights reserved.
//

#ifndef Config_h
#define Config_h

#define API_KEY @"123456789"
#define API_TEST @"http://172.16.1.214:8080/kamiwaza/api/test"





// Map View Default Config
#define MINIMUM_ZOOM_ARC 0.014 //approximately 1 miles (1 degree of arc ~= 69 miles)
#define ANNOTATION_REGION_PAD_FACTOR 1.15
#define MAX_DEGREES_ARC 360


// Utility Values
#define RGBA(a, b, c, d) [UIColor colorWithRed:(a / 255.0f) green:(b / 255.0f) blue:(c / 255.0f) alpha:d]
#define M_PI        3.14159265358979323846264338327950288

#define FONT_GOTHAM_NORMAL(s) [UIFont fontWithName:@"GothamRounded-Book" size:s]
#define FONT_GOTHAM_BOLD(s) [UIFont fontWithName:@"GothamRounded-Bold" size:s]

#define FONT_HELVETICA15 [UIFont fontWithName:@"Helvetica" size:15]
#define FONT_HELVETICA10 [UIFont fontWithName:@"Helvetica" size:10]


#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
#define IS_IPHONE_6_OR_ABOVE (IS_IPHONE && SCREEN_MAX_LENGTH >= 667.0)


#endif /* Config_h */
