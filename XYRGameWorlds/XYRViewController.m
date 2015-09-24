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

@interface XYRViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *worldsList;

@end


@implementation XYRViewController

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
