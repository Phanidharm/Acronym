//
//  searchResult.m
//  Acronym
//
//  Created by Phanindhar Mothukuri on 10/19/15.
//  Copyright © 2015 Phanidhar Mothukuri. All rights reserved.
//

#import "searchResult.h"
@interface searchResult ()

@property (nonatomic, strong) NSDictionary *searchData;

@end

@implementation searchResult

@synthesize searchData=_searchData;

- (id)init {
    if (self = [self initWithDictionary:nil]) {
    }
    return self;
}

- (id)initWithDictionary:(NSDictionary *)searchData {
    if (self = [super init]) {
        _searchData = searchData;
        if (_searchData == nil) {
            _searchData = [NSDictionary dictionary];
        }
    }
    return self;
}

- (NSArray *)results {
    return self.searchData[@"lfs"];
}

@end
