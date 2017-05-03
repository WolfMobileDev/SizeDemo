//
//  SizeAllModel.m
//  SizeDemo
//
//  Created by jinru.lu on 2017/5/2.
//  Copyright © 2017年 jinru.lu. All rights reserved.
//

#import "SizeAllModel.h"
#import "MJExtension.h"

@implementation SizeAllModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"sizes":@"sizes"};
}

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"sizes":[SizeListModel class]};
}

@end
