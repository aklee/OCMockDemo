//
//  StudentMock.m
//  OCMockDemoTests
//
//  Created by gcy on 2018/2/27.
//  Copyright © 2018年 aklee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BaseTestCase.h"
#import "Student.h"
@interface Student()
-(void)privateMoney;
@end

@interface StudentMock : BaseTestCase

@end

@implementation StudentMock

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPublicMethod{
    Student *s = [Student new];
    [s publicMoney];
}

- (void)testPriveMethod{
    //测试调用@implementation中方法
    Student *s = [Student new];
    [s privateMoney];
}
- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
