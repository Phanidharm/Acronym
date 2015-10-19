//
//  SearchViewController.h
//  Acronym
//
//  Created by Phanindhar Mothukuri on 10/19/15.
//  Copyright © 2015 Phanidhar Mothukuri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIView
@property (weak, nonatomic) IBOutlet UITextField *searchField;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (nonatomic, copy) void (^buttonBlock)();
@end
