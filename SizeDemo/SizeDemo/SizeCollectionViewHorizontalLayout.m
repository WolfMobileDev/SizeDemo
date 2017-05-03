//
//  SizeCollectionViewHorizontalLayout.m
//  SizeDemo
//
//  Created by jinru.lu on 2017/4/20.
//  Copyright © 2017年 jinru.lu. All rights reserved.
//

#import "SizeCollectionViewHorizontalLayout.h"

@interface SizeCollectionViewHorizontalLayout ()

@property (nonatomic, strong) NSMutableArray *allAttributes;

@end

@implementation SizeCollectionViewHorizontalLayout

- (CGSize)collectionViewContentSize {
    return self.collectionView.contentSize;
}

@end
