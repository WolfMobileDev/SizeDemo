//
//  SizeTableViewCell.m
//  SizeDemo
//
//  Created by jinru.lu on 2017/4/18.
//  Copyright © 2017年 jinru.lu. All rights reserved.
//

#import "SizeTableViewCell.h"

@interface SizeTableViewCell ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIView *bottomLineView;
@property (nonatomic, strong) UIView *rightLineView;

@end

@implementation SizeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        [self buildLable];
        [self buildBottomLineView];
        [self buildRightLineView];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.label.frame = self.bounds;
    self.rightLineView.frame = CGRectMake(0.f, self.bounds.size.height - 0.5f, self.bounds.size.width, 0.5f);
    self.bottomLineView.frame = CGRectMake(self.bounds.size.width - 0.5f, 0.f, 0.5f, self.bounds.size.height);
}

- (void)dealloc {
    self.label = nil;
    self.bottomLineView = nil;
    self.rightLineView = nil;
}

- (void)reloadCell:(NSString *)str {
    self.label.text = str;
}

- (void)buildLable {
    self.label = [[UILabel alloc] init];
    self.label.textColor = [UIColor blackColor];
    self.label.font = [UIFont systemFontOfSize:12.f];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.label];
}

- (void)buildBottomLineView {
    self.bottomLineView = [[UIView alloc] init];
    self.bottomLineView.backgroundColor = [UIColor grayColor];
    [self addSubview:self.bottomLineView];
}

- (void)buildRightLineView {
    self.rightLineView = [[UIView alloc] init];
    self.rightLineView.backgroundColor = [UIColor grayColor];
    [self addSubview:self.rightLineView];
}

@end
