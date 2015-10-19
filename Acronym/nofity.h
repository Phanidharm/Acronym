//
//  nofity.h
//  Acronym
//
//  Created by Phanindhar Mothukuri on 10/19/15.
//  Copyright © 2015 Phanidhar Mothukuri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
#import "gettingAcronym.h"
#import "MBProgressHUD.h"
@interface nofity : NSObject


+ (void)alertWithTitle:(NSString *)title message:(NSString *)message;
+ (void)alertWithError:(NSError *)error;
@end
