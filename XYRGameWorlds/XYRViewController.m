//
//  ViewController.m
//  XYRGameWorlds
//
//  Created by Vladislava Kirichenko on 9/24/15.
//  Copyright © 2015 Vladislava Kirichenko. All rights reserved.
//

#import "XYRViewController.h"
#import "XYRGameWorldCell.h"
#import "XYRWorldModel.h"
#import "XYRRequestManager.h"

@interface XYRViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *loginTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIButton *requestButton;

@property (strong, nonatomic) NSArray *worldsList;

@end


@implementation XYRViewController

- (IBAction)requestButtonPressed:(UIButton *)sender
{
    [self.activityIndicator startAnimating];
    self.requestButton.enabled = NO;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.tableView.alpha = 0.0;
    }];
     
    [XYRRequestManager requestAvailableWorldsWithUserName:self.loginTextField.text
                                                 password:self.passwordTextField.text
                                        complitionHandler:^(NSArray *worldsList, NSError *error)
    {
        NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:@"worldName" ascending:YES];
        NSArray *sortedArray = [worldsList sortedArrayUsingDescriptors:@[descriptor]];
        self.worldsList = sortedArray;
        [self.tableView reloadData];
        
        [UIView animateWithDuration:0.2 animations:^{
            self.tableView.alpha = 1.0;
        } completion:^(BOOL finished) {
            [self.activityIndicator stopAnimating];
            self.requestButton.enabled = YES;
        }];
    }];
}

#pragma marka - TableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.worldsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XYRGameWorldCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XYRGameWorldCell" forIndexPath:indexPath];
    
    XYRWorldModel *worldModel = self.worldsList[indexPath.row];
    
    cell.isOnline = [worldModel.worldStatus.statusDescription.lowercaseString isEqualToString:@"online"];
    cell.worldName.text = worldModel.worldName;
    
    return cell;
}

@end
