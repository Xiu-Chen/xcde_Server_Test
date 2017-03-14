//
//  Person.m
//  PITax
//
//  Created by yuanxiulong on 2017/3/13.
//  Copyright © 2017年 tony. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (instancetype)personWithDict:(NSDictionary *)dict{
    
    Person *obj = [[self alloc] init];
    [obj setValuesForKeysWithDictionary:dict];
    
    // age范围处理
    if (obj.age <= 0 || obj.age >= 100) {
        obj.age = 0;
    }
    
    return obj;
}

@end
