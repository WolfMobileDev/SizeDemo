//
//  ParamsListModel.m
//  SizeDemo
//
//  Created by jinru.lu on 2017/4/26.
//  Copyright © 2017年 jinru.lu. All rights reserved.
//

#import "ParamsListModel.h"
#import "MJExtension.h"

@implementation ParamsListModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"paramsList":@"params"};
}

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"paramsList":[ParamsModel class]};
}

@end
