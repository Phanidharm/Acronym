//
//  ViewController.m
//  Acronym
//
//  Created by Phanindhar Mothukuri on 10/19/15.
//  Copyright © 2015 Phanidhar Mothukuri. All rights reserved.
//

#import "ViewController.h"
#import "SearchViewController.h"
#import "TableCellTableViewCell.h"
#import "nofity.h"
#import "searchResult.h"
#import "gettingAcronym.h"

@interface ViewController ()


@property (nonatomic, strong) IBOutlet SearchViewController *searchBox;
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *lf;

@end

@implementation ViewController

- (void)viewDidLoad {
    [gettingAcronym instance];
    [super viewDidLoad];
    self.searchBox.searchField.returnKeyType = UIReturnKeySearch;
    self.searchBox.searchField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.searchBox.searchField.delegate = self;
 
    __weak SearchViewController *weaksb = self.searchBox;
    weaksb.buttonBlock = ^{
        if (!weaksb.searchField.text || [weaksb.searchField.text isEqualToString:@""])
            [nofity alertWithTitle:@"Error" message:@"Blank! Please enter acronym"];
        else
            [self searchAcronym:weaksb.searchField.text];
    };
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)searchAcronym:(NSString *)enteredAcronym {
    __weak ViewController *forLF = self;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [gettingAcronym getAcronym:enteredAcronym
                       success:^(NSURLSessionDataTask *task, id response) {
                           dispatch_async(dispatch_get_main_queue(), ^{
                               [MBProgressHUD hideHUDForView:self.view animated:YES];
                               if(((NSArray*)response).count > 0) {
                                   searchResult *sResult = [[searchResult alloc] initWithDictionary:response[0]];
                                   forLF.lf = [sResult.results mutableCopy];
                                   [forLF.tableView reloadData];
                               } else {
                                   [nofity alertWithTitle:@"Error" message:@"Abbreviation not available"];
                               }
                           });
                       }
                       failure:^(NSURLSessionDataTask *task, NSError *error) {
                           dispatch_async(dispatch_get_main_queue(), ^{
                               [MBProgressHUD hideHUDForView:self.view animated:YES];
                               [nofity alertWithError:error];
                           });
                       }
     ];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.view endEditing:YES];
    [self.searchBox.buttonBlock invoke];
    return YES;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.lf.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableCell" forIndexPath:indexPath];
    cell.label.text = self.lf[indexPath.row][@"lf"];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
