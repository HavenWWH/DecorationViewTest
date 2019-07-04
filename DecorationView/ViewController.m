//
//  ViewController.m
//  DecorationView
//
//  Created by 吴文海 on 2019/7/4.
//  Copyright © 2019 吴文海. All rights reserved.
//

#import "ViewController.h"

#import "TestCollectionCell.h"
#import "TestCollectionViewFlowLayout.h"

@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) TestCollectionViewFlowLayout *flowLayout;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.collectionView];
    
}

#pragma mark - delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 13;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([TestCollectionCell class]) forIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
    TestCollectionCell *testCell = (TestCollectionCell *)cell;
    [testCell setttingData:indexPath];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, 200);
}

// 每行之间竖直之间的最小间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return CGFLOAT_MIN;
}



#pragma mark - setter
- (UICollectionView *)collectionView {
    if (!_collectionView) {
    
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
        _collectionView.frame = self.view.bounds;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.allowsMultipleSelection = true;
        _collectionView.alwaysBounceVertical = true;
        _collectionView.showsHorizontalScrollIndicator = false;
        _collectionView.backgroundColor = [UIColor whiteColor];
        
        if (@available(iOS 11, *)) {
            _collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        [_collectionView registerClass:[TestCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([TestCollectionCell class])];
    }
    return _collectionView;
}

- (TestCollectionViewFlowLayout *)flowLayout {
    
    if (!_flowLayout) {
        _flowLayout = [[TestCollectionViewFlowLayout alloc] init];
    }
    return _flowLayout;
}
@end
