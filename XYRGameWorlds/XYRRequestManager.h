//
//  XYRRequestManager.h
//  XYRGameWorlds
//
//  Created by Vladislava Kirichenko on 9/24/15.
//  Copyright © 2015 Vladislava Kirichenko. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYRRequestManager : NSObject

+ (void)requestAvailableWorldsWithUserName:(NSString *)userName
                                  password:(NSString *)password
                         complitionHandler:(void(^)(NSArray *worldsList, NSError *error))complitionHandler;

+ (void)makeRequestWithURL:(NSURL *)url
                parameters:(NSDictionary *)parameters
         complitionHandler:(void(^)(NSData *data, NSError *error))complitionHandler;

@end
