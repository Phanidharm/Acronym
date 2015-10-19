//
//  SearchViewController.m
//  Acronym
//
//  Created by Phanindhar Mothukuri on 10/19/15.
//  Copyright © 2015 Phanidhar Mothukuri. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()
@property (assign, nonatomic) BOOL isEditing;
@end

@implementation SearchViewController
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initialization];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frames
{
    self = [super initWithFrame:frames];
    if (self) {
        [self initialization];
    }
    return self;
}

- (void)initialization
{
    UIView *view = [[[NSBundle bundleForClass:[self class]] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    view.frame = self.bounds;
   view.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:view];
    
   [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)]];
[self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(view)]];
    
    UITapGestureRecognizer *tapRecognization = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(isTyping)];
    tapRecognization.cancelsTouchesInView = NO;
    [self addGestureRecognizer:tapRecognization];
    
    self.searchField.returnKeyType = UIReturnKeyDone;
}

- (void)isTyping
{
    if (!self.searchField.userInteractionEnabled)
        return;
    self.isEditing = !self.isEditing;
    if (self.isEditing) {
        [self.superview.superview.superview endEditing:YES];
    } else {
        [self.searchField becomeFirstResponder];
    }
}


- (IBAction)searchTapped:(id)sender {
    if (self.buttonBlock)
        [self.buttonBlock invoke];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
