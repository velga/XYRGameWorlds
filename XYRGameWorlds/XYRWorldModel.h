//
//  XYRWorldModel.h
//  XYRGameWorlds
//
//  Created by Vladislava Kirichenko on 9/24/15.
//  Copyright © 2015 Vladislava Kirichenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYRWorldStatusModel : NSObject

@property (copy, nonatomic)   NSString *statusDescription;
@property (assign, nonatomic) NSInteger statusId;

- (instancetype)initWithDictionary:(NSDictionary *)worldStatusDictionary;

@end


@interface XYRWorldModel : NSObject

@property (copy, nonatomic)   NSString *country;
@property (assign, nonatomic) NSInteger worldId;
@property (copy, nonatomic)   NSString *language;
@property (copy, nonatomic)   NSString *mapURL;
@property (copy, nonatomic)   NSString *worldName;
@property (copy, nonatomic)   NSString *url;
@property (strong, nonatomic) XYRWorldStatusModel *worldStatus;

- (instancetype)initWithDictionary:(NSDictionary *)worldDictionary;

@end