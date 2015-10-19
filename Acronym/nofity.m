//
//  nofity.m
//  Acronym
//
//  Created by Phanindhar Mothukuri on 10/19/15.
//  Copyright © 2015 Phanidhar Mothukuri. All rights reserved.
//

#import "nofity.h"

@implementation nofity
+ (void)alertWithTitle:(NSString *)title message:(NSString *)message {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

+ (void)alertWithError:(NSError *)error {
    [self alertWithTitle:@"Error" message:error.localizedDescription];
    NSLog(@"%@", error.localizedDescription);
}
@end
