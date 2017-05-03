//
//  ViewController.m
//  SizeDemo
//
//  Created by jinru.lu on 2017/4/18.
//  Copyright © 2017年 jinru.lu. All rights reserved.
//

#import "ViewController.h"
#import "SizeTableViewCell.h"
#import "SizeCollectionViewCell.h"
#import "SizeCollectionViewHorizontalLayout.h"

#import "ParamsListModel.h"
#import "SizeAllModel.h"
#import "MJExtension.h"

@interface ViewController ()
<UITableViewDelegate, UITableViewDataSource,
UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) ParamsListModel *parmasListModel;
@property (nonatomic, strong) SizeAllModel *sizeAllModel;
@property (nonatomic, strong) SizeListModel *sizeListModel;

@property (nonatomic, assign) CGFloat itemMinWidth;
@property (nonatomic, assign) CGFloat itemMinHeight;
@property (nonatomic, assign) CGFloat totalWidth;

@end

@implementation ViewController

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    
    return self;
}

- (void)loadView {
    [super loadView];
    
    [self buildTableView];
    [self buildScrollView];
    [self buildCollectionView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.itemMinWidth = 80.f;
    self.itemMinHeight = 40.f;
    
    NSMutableArray *paramsArr = [NSMutableArray array];
    [paramsArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"中国", @"value", nil]];
    [paramsArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"意大利", @"value", nil]];
    [paramsArr addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"法国", @"value", nil]];
    
    NSMutableDictionary *paramsDic = [NSMutableDictionary dictionary];
    [paramsDic setObject:paramsArr forKey:@"params"];
    
    self.parmasListModel = [ParamsListModel mj_objectWithKeyValues:paramsDic];
    
    
    NSMutableDictionary *size1 = [NSMutableDictionary dictionary];
    NSMutableArray *arr1 = [NSMutableArray array];
    [arr1 addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"S", @"value", @"2", @"total",  nil]];
    [arr1 addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"M", @"value", @"1", @"total",  nil]];
    [arr1 addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"L", @"value", @"3", @"total",  nil]];
    [arr1 addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"XL", @"value", @"1", @"total",  nil]];
    [arr1 addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"XXL", @"value", @"1", @"total",  nil]];
    [arr1 addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"XXXL", @"value", @"6", @"type", @"1", @"total",  nil]];
    [size1 setObject:arr1 forKey:@"size_list"];
    
    NSMutableDictionary *size2 = [NSMutableDictionary dictionary];
    NSMutableArray *arr2 = [NSMutableArray array];
    [arr2 addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"1", @"total",  nil]];
    [arr2 addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"35", @"value", @"1", @"total",  nil]];
    [arr2 addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"35", @"value", @"1", @"total",  nil]];
    [arr2 addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"34", @"value", @"1", @"total",  nil]];
    [arr2 addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"35", @"value", @"1", @"total",  nil]];
    [arr2 addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"36", @"value", @"1", @"total",  nil]];
    [arr2 addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"35", @"value", @"1", @"total",  nil]];
    [arr2 addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"36", @"value", @"1", @"total",  nil]];
    [arr2 addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"36", @"value", @"1", @"total",  nil]];
    [size2 setObject:arr2 forKey:@"size_list"];
    
    NSMutableDictionary *size3 = [NSMutableDictionary dictionary];
    NSMutableArray *arr3 = [NSMutableArray array];
    [arr3 addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"SS", @"value", @"2", @"total",  nil]];
    [arr3 addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"MM", @"value", @"1", @"total", nil]];
    [arr3 addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"LL", @"value", @"3", @"total", nil]];
    [arr3 addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"XLXL", @"value", @"1", @"total", nil]];
    [arr3 addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"XXXLX", @"value", @"1", @"total",  nil]];
    [arr3 addObject:[NSDictionary dictionaryWithObjectsAndKeys:@"XXXLX", @"value", @"1", @"total",  nil]];
    [size3 setObject:arr3 forKey:@"size_list"];
    
    NSMutableArray *arr = [NSMutableArray array];
    [arr addObject:size1];
    [arr addObject:size2];
    [arr addObject:size3];
    
    NSMutableDictionary *sizeDic = [NSMutableDictionary dictionary];
    [sizeDic setObject:arr forKey:@"sizes"];
    
    self.sizeAllModel = [SizeAllModel mj_objectWithKeyValues:sizeDic];
    
    NSArray<SizeListModel *> *sizes = self.sizeAllModel.sizes;
    
    NSArray *headerArr = [[sizes firstObject] sizeList];
    NSInteger sizeTotalCount = 0;
    for (SizeModel *sizeModel in headerArr) {
        sizeTotalCount += sizeModel.total.integerValue;
    }
    self.totalWidth = sizeTotalCount * self.itemMinWidth;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    self.tableView.frame = CGRectMake(0.f, 0.f, self.itemMinWidth, self.parmasListModel.paramsList.count * self.itemMinHeight);
    self.scrollView.frame = CGRectMake(CGRectGetMaxX(self.tableView.frame), 0.f, self.view.bounds.size.width - CGRectGetMaxX(self.tableView.frame), self.parmasListModel.paramsList.count * self.itemMinHeight);
    self.scrollView.contentSize = CGSizeMake(self.totalWidth, CGRectGetHeight(self.scrollView.frame));
    self.collectionView.frame = CGRectMake(0.f, 0.f, self.totalWidth, self.parmasListModel.paramsList.count * self.itemMinHeight);
    self.collectionView.contentSize = CGSizeMake(self.totalWidth, CGRectGetHeight(self.collectionView.frame));
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.parmasListModel.paramsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView registerClass:[SizeTableViewCell class] forCellReuseIdentifier:NSStringFromClass([SizeTableViewCell class])];
    SizeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SizeTableViewCell class]) forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section < self.parmasListModel.paramsList.count) {
        ParamsModel *model = [self.parmasListModel.paramsList objectAtIndex:indexPath.section];
        [cell reloadCell:model.value];
    }
    
    return cell;
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40.f;
}

#pragma mark UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[[self.sizeAllModel.sizes objectAtIndex:section] sizeList] count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.sizeAllModel.sizes.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView registerClass:[SizeCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([SizeCollectionViewCell class])];
    SizeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SizeCollectionViewCell class]) forIndexPath:indexPath];
    SizeListModel *sizeListModel = [self.sizeAllModel.sizes objectAtIndex:indexPath.section];
    SizeModel *sizeModel = [sizeListModel.sizeList objectAtIndex:indexPath.row];
    [cell reloadCell:sizeModel.value];
    
    return cell;
}

#pragma mark UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    SizeListModel *sizeListModel = [self.sizeAllModel.sizes objectAtIndex:indexPath.section];
    SizeModel *sizeModel = [sizeListModel.sizeList objectAtIndex:indexPath.row];
    return CGSizeMake(sizeModel.total.integerValue * self.itemMinWidth, 40.f);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsZero;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return FLT_MIN;
}

#pragma mark - Builder
- (void)buildTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.scrollEnabled = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (void)buildScrollView {
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.backgroundColor = [UIColor clearColor];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.bounces = NO;
    [self.view addSubview:self.scrollView];
}

- (void)buildCollectionView {
//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    SizeCollectionViewHorizontalLayout *flowLayout = [[SizeCollectionViewHorizontalLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.alwaysBounceHorizontal = YES;
    self.collectionView.bounces = NO;
    self.collectionView.scrollEnabled = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.scrollView addSubview:self.collectionView];
}


@end
