//
//  searchResult.h
//  Acronym
//
//  Created by Phanindhar Mothukuri on 10/19/15.
//  Copyright © 2015 Phanidhar Mothukuri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface searchResult : NSObject

- (id)initWithDictionary:(NSDictionary *)searchData;
@property (nonatomic, strong) NSArray *results;
@end
