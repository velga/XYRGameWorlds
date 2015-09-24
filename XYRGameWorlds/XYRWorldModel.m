//
//  XYRWorldModel.m
//  XYRGameWorlds
//
//  Created by Vladislava Kirichenko on 9/24/15.
//  Copyright © 2015 Vladislava Kirichenko. All rights reserved.
//

#import "XYRWorldModel.h"

static NSString *const kCountryKey           = @"country";
static NSString *const kWorldIdKey           = @"id";
static NSString *const kLanguageKey          = @"language";
static NSString *const kMapURLKey            = @"mapURL";
static NSString *const kWorldNameKey         = @"name";
static NSString *const kUrlKey               = @"url";
static NSString *const kWorldStatusKey       = @"worldStatus";
static NSString *const kStatusDescriptionKey = @"description";
static NSString *const kStatusIdKey          = @"id";

@implementation XYRWorldStatusModel

- (instancetype)initWithDictionary:(NSDictionary *)worldStatusDictionary
{
    self = [super init];
    
    if (self) {
        if ([worldStatusDictionary[kStatusIdKey] respondsToSelector:@selector(integerValue)]) {
            self.statusId = [worldStatusDictionary[kStatusIdKey] integerValue];
        }
        
        self.statusDescription = worldStatusDictionary[kStatusDescriptionKey];
    }
    
    return self;
}

@end


@implementation XYRWorldModel

- (instancetype)initWithDictionary:(NSDictionary *)worldDictionary
{
    self = [super init];
    
    if (self) {
        if ([worldDictionary[kWorldIdKey] respondsToSelector:@selector(integerValue)]) {
            self.worldId = [worldDictionary[kWorldIdKey] integerValue];
        }
        
        self.country   = worldDictionary[kCountryKey];
        self.language  = worldDictionary[kLanguageKey];
        self.mapURL    = worldDictionary[kMapURLKey];
        self.worldName = worldDictionary[kWorldNameKey];
        self.url       = worldDictionary[kUrlKey];
        
        NSDictionary *statusDict = worldDictionary[kWorldStatusKey];
        self.worldStatus = [[XYRWorldStatusModel alloc] initWithDictionary:statusDict];
    }
    
    return self;
}

@end
