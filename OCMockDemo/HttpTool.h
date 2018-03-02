//
//  HttpTool.h
//  OCMockDemo
//
//  Created by gcy on 2018/3/2.
//  Copyright © 2018年 aklee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpTool : NSObject
+ (void)sendRequest:(NSString*)url completionBlock:(void(^)(NSArray *, BOOL ))completionBlock;

+ (void)sendRequest:(NSString*)url paramInt:(int)paramInt completionBlock:(void(^)(NSArray *, BOOL ))completionBlock;

@end
