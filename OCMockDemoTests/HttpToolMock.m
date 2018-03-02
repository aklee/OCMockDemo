//
//  HttpToolMock.m
//  OCMockDemoTests
//
//  Created by gcy on 2018/3/2.
//  Copyright © 2018年 aklee. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BaseTestCase.h"
#import "OCMock.h"
#import "HttpTool.h"

@interface HttpToolMock : BaseTestCase

@end

@implementation HttpToolMock

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testHttpRequest{
    OCMockObject *mock = [OCMockObject mockForClass:[HttpTool class]];
    [[[mock stub] andDo:^(NSInvocation *invocation) {
        void (^complete)(NSArray*,BOOL);
        [invocation getArgument:&complete atIndex:3];
        complete(nil,YES);
    }] sendRequest:[OCMArg any] completionBlock:[OCMArg any]];
    
    //模拟http请求失败
    [HttpTool sendRequest:@"url" completionBlock:^(NSArray *list, BOOL result) {
        XCTAssertTrue(result,@"Mock失败");
    }];
    [mock stopMocking];
    
//    int param = 1;
//    NSValue *value = [NSValue value:&param withObjCType:@encode(int)];
//    mock = [OCMockObject mockForClass:[HttpTool class]];
//    [[[mock stub] andDo:^(NSInvocation *invocation) {
//        void (^complete)(NSArray*,BOOL);
//        [invocation getArgument:&complete atIndex:3];
//        complete(nil,YES);
//    }] sendRequest:[OCMArg any] paramInt:[OCMArg defaultValue] completionBlock:[OCMArg any]];
//    
////    [OCMStub([mock2 sendRequest:[OCMArg any] completionBlock:[OCMArg any]]) andDo:^(NSInvocation *invocation) {
////        void (^complete)(NSArray*,BOOL);
////        [invocation getArgument:&complete atIndex:3];
////        complete(nil,YES);
////    }];
//    
//    [HttpTool sendRequest:@"url" paramInt:0 completionBlock:^(NSArray *list, BOOL result) {
//        XCTAssertFalse(result,@"Mock失败");
//    }];
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
