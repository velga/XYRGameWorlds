//
//  XYRRequestManager.m
//  XYRGameWorlds
//
//  Created by Vladislava Kirichenko on 9/24/15.
//  Copyright © 2015 Vladislava Kirichenko. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYRRequestManager.h"
#import "NSDictionary+URLEncode.h"
#import "XYRWorldModel.h"

@implementation XYRRequestManager

+ (void)requestAvailableWorldsWithUserName:(NSString *)userName
                                  password:(NSString *)password
                         complitionHandler:(void(^)(NSArray *worldsList, NSError *error))complitionHandler
{
    NSCParameterAssert([userName isKindOfClass:[NSString class]] &&
                       [password isKindOfClass:[NSString class]] &&
                       complitionHandler);
    
    NSString *const kRequestURL = @"http://backend1.lordsandknights.com/XYRALITY/WebObjects/BKLoginServer.woa/wa/worlds";
    
    NSString *deviceType = [NSString stringWithFormat:@"%@ - %@ %@",
                            [[UIDevice currentDevice] model],
                            [[UIDevice currentDevice] systemName],
                            [[UIDevice currentDevice] systemVersion]];
    NSString *deviceId = [[NSUUID UUID] UUIDString];
    
    NSDictionary *requestParameters = @{@"login"      : userName,
                                        @"password"   : password,
                                        @"deviceType" : deviceType,
                                        @"deviceId"   : deviceId};
    NSURL *requestURL = [NSURL URLWithString:kRequestURL];
    
    [self requestAvailableWorldsWithURL:requestURL
                             parameters:requestParameters
                      complitionHandler:^(NSData *data, NSError *error)
    {
        if (error || !data.length) { complitionHandler(nil, error); }
        
        NSError *serializationError;
        NSDictionary *response = [NSPropertyListSerialization propertyListWithData:data
                                                                           options:NSPropertyListImmutable
                                                                            format:NULL
                                                                             error:&serializationError];
        
        if (serializationError) { complitionHandler(nil, serializationError); }
        NSCParameterAssert([response isKindOfClass:[NSDictionary class]]);
        
        NSArray *worldsList = [self parseWorldsListFromResponse:response];
        
        complitionHandler(worldsList, nil);
    }];
}

+ (void)requestAvailableWorldsWithURL:(NSURL *)url
                           parameters:(NSDictionary *)parameters
                    complitionHandler:(void(^)(NSData *data, NSError *error))complitionHandler
{
    NSCParameterAssert([url isKindOfClass:[NSURL class]]);
    
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    sessionConfiguration.timeoutIntervalForResource = 30.0;
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration];
    
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:url];
    urlRequest.HTTPMethod = @"POST";
    urlRequest.HTTPBody = [[parameters URLEncodeString] dataUsingEncoding:NSUTF8StringEncoding];
    
     NSURLSessionDataTask *task = [session dataTaskWithRequest:urlRequest
                                             completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (complitionHandler) { complitionHandler(data, error); }
        });
    }];
    
    [task resume];
}

+ (NSArray *)parseWorldsListFromResponse:(NSDictionary *)response
{
    NSArray *responseArray = response[@"allAvailableWorlds"];
    NSCParameterAssert([responseArray isKindOfClass:[NSArray class]]);
    
    NSMutableArray *worldsList = [[NSMutableArray alloc] init];
    for (NSDictionary *worldInfo in responseArray) {
        NSCParameterAssert([worldInfo isKindOfClass:[NSDictionary class]]);
        
        XYRWorldModel *worldModel = [[XYRWorldModel alloc] initWithDictionary:worldInfo];
        [worldsList addObject:worldModel];
    }
    
    return [worldsList copy];
}

@end
