//
//  OCMockDemoTests.m
//  OCMockDemoTests
//
//  Created by gcy on 2018/2/24.
//  Copyright © 2018年 aklee. All rights reserved.
//  OCMock文档:http://ocmock.org/features/

#import <XCTest/XCTest.h>
#import "BaseTestCase.h"
#import "OCMock.h"
#import "Student.h"
@interface OCMockDemoTests : BaseTestCase

@end

@implementation OCMockDemoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testClassMethod{
    id testCls = OCMClassMock([Student class]);
    NSString*str = nil;
    str = [Student HelloWorld];
    NSLog(@"%@",str);//HelloWorld
    
    [OCMStub([testCls HelloWorld]) andReturn:@"HelloWorld by ak"];
    str=[Student HelloWorld];//HelloWorld by ak
    NSLog(@"%@",str);
    XCTAssertEqual(str, @"HelloWorld by ak");
}

- (void)testInstanceMethod{
    id testCls = OCMClassMock([Student class]);
    NSString*str = nil;
    str = [[Student new] hello];
    NSLog(@"%@",str);//hello
    [OCMStub([testCls hello]) andReturn:@"hello by ak"];//Same like instance Method
    str = [testCls hello];
    NSLog(@"%@",str);//hello by ak
    
    XCTAssertEqual(str, @"hello by ak");
}

- (void)testClassMethod2{
    id mock = [OCMockObject mockForClass:[Student class]];
    NSString*str = nil;
    str = [Student HelloWorld];
    NSLog(@"%@",str);//HelloWorld
    [[[mock stub] andReturn:@"HelloWorld by mock"] HelloWorld];//Same like instance Method
    str=[Student HelloWorld];
    NSLog(@"%@",str);//HelloWorld by mock
    XCTAssertEqual(str, @"HelloWorld by mock");
}

- (void)testInstanceMethod2{
    id obj = [Student new];
    NSString*str = nil;
    id mockObj=[OCMockObject partialMockForObject:obj];
    [[[mockObj stub] andReturn:@"hello by mock"] hello];
    str=[obj hello];
    NSLog(@"%@",str);//hello by mock
    XCTAssertEqual(str, @"hello by mock");
}

- (void)testParams{
    id obj = [Student new];
    NSString*str = nil;
    id mockObj=[OCMockObject partialMockForObject:obj];
    [[[mockObj stub] andReturn:@"haveFun by mock"] haveFun:@"drink" drive:[OCMArg any]];
    
    str=[mockObj haveFun:@"drink" drive:@"car"];
    XCTAssertTrue([str isEqualToString:@"haveFun by mock"],@"mock失败");
    
    str=[mockObj haveFun:@"play games" drive:@"car"];
    XCTAssertTrue([str isEqualToString:@"haveFun!"],@"方法调用失败");
    
    [mockObj stopMocking];//以便下次重新mock相同方法
    
    
    id mockObj2=[OCMockObject partialMockForObject:obj];
    [[[mockObj2 stub] andReturn:@"mock again!"] haveFun:@"drink" drive:[OCMArg any]];
    
    str=[mockObj2 haveFun:@"drink" drive:@"car"];
    XCTAssertTrue([str isEqualToString:@"mock again!"],@"重复mock相同方法失败");
    
}


- (void)testHaveFun{
    id testCls = OCMClassMock([Student class]);
    NSString*str = nil;
    //tip:[OCMArg any]方法告诉stub匹配所有的OC对象参数值，对于基本类型无用
    [OCMStub([testCls haveFun:@"at home" drive:[OCMArg any]]) andReturn:@"you are boring"];
    str=[testCls haveFun:@"at home" drive:@"- -"];//you are boring
    NSLog(@"%@",str);
    str=[testCls haveFun:@"swimming" drive:@"car"];//(null)
    NSLog(@"%@",str);
    
    //tip:andDo 和 andReturn 只能生效首个
    [OCMStub([testCls haveFun:@"at school" drive:[OCMArg any]]) andDo:^(NSInvocation *invocation) {
        NSLog(@"good study learning!");
    }];
//    [OCMStub([testCls haveFun:@"at school" drive:[OCMArg any]]) andReturn:@"you are in school"];
    
    str=[testCls haveFun:@"at school" drive:@"- -"];//good study learning!
    NSLog(@"%@",str);//(null)

}

- (void)testExpectAndVerify{
    //Expectations and verification
    id mock = [OCMockObject mockForClass:[Student class]];
    [[mock expect] haveFun:@"nothing" drive:@"no"];
    [mock haveFun:@"nothing" drive:@"no"];//pass
    //[mock haveFun:@"sing" drive:@"no"];//异常
    [mock verify];//如果没有调用期望的方法和参数，将抛出异常
    
}
- (void)testException{
    id testCls = OCMClassMock([Student class]);
    NSException *exp = [[NSException alloc]initWithName:@"warming" reason:@"swimming alone is dangerous" userInfo:nil];
    [OCMStub([testCls swimming:true]) andThrow:exp];
    [testCls swimming:true];
}


@end
