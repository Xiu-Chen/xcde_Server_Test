//
//  AsynTests.m
//  PITax
//
//  Created by yuanxiulong on 2017/3/13.
//  Copyright © 2017年 tony. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface AsynTests : XCTestCase

@end

@implementation AsynTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
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

- (void)testAsynchronousURLConnection {
    XCTestExpectation *expectation = [self expectationWithDescription:@"GET Baidu"];
    
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com/"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // XCTestExpectation条件已满足，接下来的测试可以执行了。
        [expectation fulfill];
        XCTAssertNotNil(data, @"返回数据不应非nil");
        XCTAssertNil(error, @"error应该为nil");
        if (nil != response) {
            NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
            XCTAssertEqual(httpResponse.statusCode, 200, @"HTTPResponse的状态码应该是200");
            XCTAssertEqual(httpResponse.URL.absoluteString, url.absoluteString, @"HTTPResponse的URL应该与请求的URL一致");
        } else {
            XCTFail(@"返回内容不是NSHTTPURLResponse类型");
        }
    }];
    [task resume];
    
    // 超时后执行
    [self waitForExpectationsWithTimeout:10 handler:^(NSError * _Nullable error) {
        [task cancel];
    }];
}

@end
