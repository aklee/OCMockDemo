//
//  HttpTool.m
//  OCMockDemo
//
//  Created by gcy on 2018/3/2.
//  Copyright © 2018年 aklee. All rights reserved.
//

#import "HttpTool.h"

@implementation HttpTool
+ (void)sendRequest:(NSString*)url completionBlock:(void(^)(NSArray *, BOOL ))completionBlock{
    //http request
    NSLog(@"sendRequest completionBlock");

}

+ (void)sendRequest:(NSString*)url paramInt:(int)paramInt completionBlock:(void(^)(NSArray *, BOOL ))completionBlock{
    NSLog(@"sendRequest paramInt completionBlock");
}
@end
