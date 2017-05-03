//
//  SizeCollectionViewHorizontalLayout.h
//  SizeDemo
//
//  Created by jinru.lu on 2017/4/20.
//  Copyright © 2017年 jinru.lu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SizeCollectionViewHorizontalLayout : UICollectionViewFlowLayout

//列数
@property (nonatomic, assign) NSInteger columnsCount;
//行数
@property (nonatomic, assign) NSInteger rowCount;

@end
