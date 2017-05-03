//
//  SizeListModel.m
//  SizeDemo
//
//  Created by jinru.lu on 2017/4/26.
//  Copyright © 2017年 jinru.lu. All rights reserved.
//

#import "SizeListModel.h"
#import "MJExtension.h"

@implementation SizeListModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"sizeList":@"size_list"};
}

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"sizeList":[SizeModel class]};
}

@end
