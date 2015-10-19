//
//  gettingAcronym.m
//  Acronym
//
//  Created by Phanindhar Mothukuri on 10/19/15.
//  Copyright © 2015 Phanidhar Mothukuri. All rights reserved.
//

#import "gettingAcronym.h"
#import "AFNetworkActivityIndicatorManager.h"
@interface gettingAcronym()
@property (nonatomic, strong) AFHTTPSessionManager *manager;
@end
@implementation gettingAcronym
static NSString *URL = @"http://www.nactem.ac.uk/software/acromine/";
+ (gettingAcronym *)instance {
    static gettingAcronym *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (id)init {
    self = [super init];
    if (self) {
        self.manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString: URL]];
        self.manager.responseSerializer = [AFJSONResponseSerializer serializer];
        self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/plain"]];
        
    
        self.manager.completionQueue = dispatch_queue_create("nextqueue", DISPATCH_QUEUE_SERIAL);
        
        [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    }
    return self;
}

+ (void)getAcronym:(NSString *)acronym success:(void (^)(NSURLSessionDataTask *task, id response))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure {
    NSDictionary *param = @{@"sf": acronym, @"lf": @""};
    [[self instance].manager GET:@"dictionary.py" parameters:param success:success failure:failure];
}

@end
