//
//  BaseTestCase.m
//  OCMockDemoTests
//
//  Created by gcy on 2018/2/27.
//  Copyright © 2018年 aklee. All rights reserved.
//

#import "BaseTestCase.h"

@implementation BaseTestCase

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    NSLog(@"=============setUp=============");
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    NSLog(@"=============tearDown=============");
}
@end
