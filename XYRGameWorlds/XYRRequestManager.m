//
//  XYRRequestManager.m
//  XYRGameWorlds
//
//  Created by Vladislava Kirichenko on 9/24/15.
//  Copyright © 2015 Vladislava Kirichenko. All rights reserved.
//

#import "XYRRequestManager.h"

@implementation XYRRequestManager

+ (void)requestAvailableWorldsWithUserName:(NSString *)userName
                                  password:(NSString *)password
                         complitionHandler:(void(^)(NSArray *worldsList, NSError *error))complitionHandler
{
    NSCParameterAssert([userName isKindOfClass:[NSString class]] && [password isKindOfClass:[NSString class]]);
    
    
}

+ (void)requestAvailableWorldsWithURL:(NSURL *)url
                           parameters:(NSDictionary *)parameters
                    complitionHandler:(void(^)(NSData *data, NSError *error))complitionHandler
{
    NSCParameterAssert([url isKindOfClass:[NSURL class]]);
    
    
}

@end
