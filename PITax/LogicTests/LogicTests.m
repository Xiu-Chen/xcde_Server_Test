//
//  LogicTests.m
//  LogicTests
//
//  Created by 关东升 on 16/1/19.
//

#import <XCTest/XCTest.h>

#import "ViewController.h"
#import "Person.h"

@interface LogicTests : XCTestCase

@property (nonatomic,strong) ViewController *viewController;

@end

@implementation LogicTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    //初始化的代码，在测试方法调用之前调用
    self.viewController = [[ViewController alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    // 释放测试用例的资源代码，这个方法会每个测试用例执行后调用
    self.viewController = nil;
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    // 测试用例的例子，注意测试用例一定要test开头
}

//测试月应纳税额不超过1500元
- (void)testCalculateLevel1 {
    double dbRevenue = 5000;
    NSString *strRevenue = [NSString stringWithFormat:@"%f",dbRevenue];
    NSString* strTax =[self.viewController calculate:strRevenue];
    
    XCTAssertEqual(strTax.doubleValue, 45.0, @"用例1测试失败");
}


//性能测试
- (void)testPerformanceExample {
    [self measureBlock:^{

        // 测试用例，循环10000次，为了演示效果
        for (NSInteger i = 0; i < 10000; i++) {
            [Person personWithDict:@{@"name":@"zhang",@"age":@20}];
        }
        
    }];
}

//比如我们想要禁止一个测试用例，我们只需要在方法名字前加 DISABLED:
//我们很容易就能找到这个方法，并且因为这个方法不再是以 test 为开头，所以 XCTest 在运行时也会跳过这个测试用例。
- (void)DISABLED_testThatItDoesURLEncoding{
    
}



@end
