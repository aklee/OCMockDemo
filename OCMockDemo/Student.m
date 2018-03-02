//
//  Student.m
//  OCMockDemo
//
//  Created by gcy on 2018/2/24.
//  Copyright © 2018年 aklee. All rights reserved.
//

#import "Student.h"

@implementation Student

+(NSString*)HelloWorld{
    return @"HelloWorld";
}
-(NSString*)hello{
    return @"hello";
}
-(NSString*)haveFun:(NSString*)something drive:(NSString*)drive{
    return @"haveFun!";
}
-(void)swimming:(bool)alone{
    
}

-(void)publicMoney{
    NSLog(@"大家都知道我有10块！");
}
-(void)privateMoney{
    NSLog(@"我的私房钱有100块！");
}
@end
