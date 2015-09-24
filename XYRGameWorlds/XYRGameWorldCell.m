//
//  XYRGameWorldCell.m
//  XYRGameWorlds
//
//  Created by Vladislava Kirichenko on 9/24/15.
//  Copyright © 2015 Vladislava Kirichenko. All rights reserved.
//

#import "XYRGameWorldCell.h"

@interface XYRGameWorldCell ()

@property (weak, nonatomic) IBOutlet UIView *onlineIndicatorView;

@end

@implementation XYRGameWorldCell

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    self.onlineIndicatorView.backgroundColor = [UIColor clearColor];
    self.worldName.text = @"";
}

- (void)setOnline:(BOOL)isOnline
{
    self.onlineIndicatorView.backgroundColor = isOnline ? [UIColor greenColor] : [UIColor redColor];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.onlineIndicatorView.layer.cornerRadius = self.onlineIndicatorView.bounds.size.height/2;
}

@end
