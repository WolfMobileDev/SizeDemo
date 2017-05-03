//
//  SizeCollectionViewCell.m
//  SizeDemo
//
//  Created by jinru.lu on 2017/4/18.
//  Copyright © 2017年 jinru.lu. All rights reserved.
//

#import "SizeCollectionViewCell.h"


@interface SizeCollectionViewCell ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIView *rightLineView;
@property (nonatomic, strong) UIView *bottomLineView;

@end

@implementation SizeCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self buildLable];
        [self buildRightLineView];
        [self buildBottomLineView];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.label.frame = self.bounds;
    self.rightLineView.frame = CGRectMake(self.bounds.size.width - 0.5f, 0.f, 0.5f, self.bounds.size.height);
    self.bottomLineView.frame = CGRectMake(0.f, self.bounds.size.height - 0.5f, self.bounds.size.width, 0.5f);
}

- (void)dealloc {
    self.label = nil;
    self.rightLineView = nil;
    self.bottomLineView = nil;
}

- (void)reloadCell:(NSString *)str {
    self.label.text = str;
}


- (void)buildLable {
    self.label = [[UILabel alloc] init];
//    self.label.backgroundColor = [UIColor redColor];
    self.label.textColor = [UIColor redColor];
    self.label.font = [UIFont systemFontOfSize:11.f];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.label];
}

- (void)buildRightLineView {
    self.rightLineView = [[UIView alloc] init];
    self.rightLineView.backgroundColor = [UIColor grayColor];
    [self addSubview:self.rightLineView];
}

- (void)buildBottomLineView {
    self.bottomLineView = [[UIView alloc] init];
    self.bottomLineView.backgroundColor = [UIColor grayColor];
    [self addSubview:self.bottomLineView];
}

@end
