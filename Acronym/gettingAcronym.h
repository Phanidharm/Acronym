//
//  gettingAcronym.h
//  Acronym
//
//  Created by Phanindhar Mothukuri on 10/19/15.
//  Copyright © 2015 Phanidhar Mothukuri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"


@interface gettingAcronym : NSObject
+ (gettingAcronym *)instance;
+ (void)getAcronym:(NSString *)acronym success:(void (^)(NSURLSessionDataTask *task, id response))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

@end
