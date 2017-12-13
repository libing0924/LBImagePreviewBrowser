//
//  LBImagePreviewController.m
//  LBImagePreviewBrowser
//
//  Created by 李冰 on 2015/12/13.
//  Copyright © 2015年 李冰. All rights reserved.
//

#import "LBImagePreviewController.h"
#import "LBImagePreviewCollectionCell.h"
#import <objc/runtime.h>

static NSString * const LBImagePreviewCollectionCellIdentifier = @"LBImagePreviewCollectionCellIdentifier";

@interface LBImagePreviewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation LBImagePreviewController

- (instancetype)initWithAssetArray:(NSArray *)assetsArray {
    
    if (self = [super init])
    {
        
        _assetsArray = assetsArray;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _createUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    self.assetsArray = nil;
}

- (void) _createUI {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.itemSize = CGSizeMake(CGRectGetWidth(self.view.frame) + 20, CGRectGetHeight(self.view.frame));
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(-10, 0, CGRectGetWidth(self.view.frame) + 20, CGRectGetHeight(self.view.frame)) collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor blackColor];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.scrollsToTop = NO;
    _collectionView.pagingEnabled = YES;
    _collectionView.contentOffset = CGPointMake(0, 0);
    _collectionView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[LBImagePreviewCollectionCell class] forCellWithReuseIdentifier:LBImagePreviewCollectionCellIdentifier];
    
}

#pragma - MARK UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.assetsArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LBImagePreviewCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LBImagePreviewCollectionCellIdentifier forIndexPath:indexPath];
    
    id asset = self.assetsArray[indexPath.item];
    cell.asset = asset;
    
    return cell;
}

@end
