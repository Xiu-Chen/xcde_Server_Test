//
//  Person.h
//  PITax
//
//  Created by yuanxiulong on 2017/3/13.
//  Copyright © 2017年 tony. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;

//字典转模型
+ (instancetype)personWithDict:(NSDictionary *)dict;

@end
