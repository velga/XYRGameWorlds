//
//  XYRGameWorldCell.h
//  XYRGameWorlds
//
//  Created by Vladislava Kirichenko on 9/24/15.
//  Copyright © 2015 Vladislava Kirichenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYRGameWorldCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *worldName;
@property (assign, nonatomic, setter=setOnline:) BOOL isOnline;

@end
