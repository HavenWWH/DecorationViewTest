//
//  TestCollectionViewFlowLayout.m
//  DecorationView
//
//  Created by 吴文海 on 2019/7/4.
//  Copyright © 2019 吴文海. All rights reserved.
//

#import "TestCollectionViewFlowLayout.h"

#import "TestCollectionReusableView.h"
#import "CDChineseCollectionViewLayoutAttributes.h"

#define CollectionViewCellH 200.0  // cell高度
#define GroudByCount 4  // 4个一组

@interface TestCollectionViewFlowLayout ()

@property (nonatomic, strong) NSMutableArray *itemsAttribute;

@end

@implementation TestCollectionViewFlowLayout
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        
    }
    return self;
}

- (void)prepareLayout {
    [super prepareLayout];
    // 注册装饰视图
    [self registerClass:[TestCollectionReusableView class] forDecorationViewOfKind:TestCollectionReusableViewid];
    
    // 每4个cell设置一个装饰图, 根据cell高度计算计算imageView高度
    NSLog(@"prepareLayout..:%@ ",[NSDate date]);
    self.itemsAttribute = [NSMutableArray new];
    NSInteger items = [self.collectionView numberOfItemsInSection:0];
    NSInteger line = items / GroudByCount;
    NSInteger lastItem = items % GroudByCount;
    if (lastItem != 0) {
        line ++;
    }
    for (int i = 0; i < line; i++) {
        
        CDChineseCollectionViewLayoutAttributes *attribute = [CDChineseCollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:TestCollectionReusableViewid withIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        attribute.zIndex = -1;
        attribute.imgUrlStr = @"found_img_test_detail";
        UICollectionViewLayoutAttributes *firstItem = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i * GroudByCount inSection:0]];
        CGFloat tempOrigin = firstItem.frame.origin.y;
        CGFloat tempHeight = 0;
        if (i == line - 1 && lastItem != 0) {
            tempHeight = lastItem * CollectionViewCellH;
        } else {
            tempHeight = GroudByCount * CollectionViewCellH;
        }
        
        if (i == 0) {
            
//            tempOrigin -= self.sectionInset.top;
            //            tempHeight += self.sectionInset.top + self.minimumLineSpacing*0.5;
        }else {
            
//            tempOrigin -= self.minimumLineSpacing * 0.5;
            //            tempHeight += self.minimumLineSpacing;
        }
        attribute.frame = CGRectMake(0, tempOrigin, self.collectionView.frame.size.width, tempHeight);
        [self.itemsAttribute addObject:attribute];
    }
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    NSMutableArray *attributes=[NSMutableArray arrayWithArray:[super layoutAttributesForElementsInRect:rect]];
    for (UICollectionViewLayoutAttributes *attribute in self.itemsAttribute) {
        if (CGRectIntersectsRect(rect, attribute.frame)) {
            [attributes addObject:attribute];
        }
    }
    return attributes;
}

@end
