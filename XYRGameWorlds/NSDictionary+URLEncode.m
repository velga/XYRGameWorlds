//
//  NSDictionary+URLEncode.m
//  XYRGameWorlds
//
//  Created by Vladislava Kirichenko on 9/24/15.
//  Copyright © 2015 Vladislava Kirichenko. All rights reserved.
//

#import "NSDictionary+URLEncode.h"

@implementation NSDictionary (URLEncode)

- (NSString *)URLEncodeString
{
    NSMutableArray *parts = [NSMutableArray array];
    
    for (id key in self) {
        id value = [self objectForKey: key];
        
        NSString *encodedKey = [[NSString stringWithFormat: @"%@", key]
                                stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
        NSString *encodedvalue = [[NSString stringWithFormat: @"%@", value]
                                  stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
        NSString *part = [NSString stringWithFormat: @"%@=%@", encodedKey, encodedvalue];
        
        [parts addObject: part];
    }
    
    return [parts componentsJoinedByString:@"&"];
}

@end
