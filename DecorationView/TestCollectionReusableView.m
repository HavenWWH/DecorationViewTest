//
//  TestCollectionReusableView.m
//  DecorationView
//
//  Created by 吴文海 on 2019/7/4.
//  Copyright © 2019 吴文海. All rights reserved.
//

#import "TestCollectionReusableView.h"
#import "CDChineseCollectionViewLayoutAttributes.h"

@interface TestCollectionReusableView()
// 装饰视图，里面就一张图片
@property (nonatomic, strong) UIImageView * imageView;

@end
@implementation TestCollectionReusableView
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]){
        
        self.backgroundColor = UIColor.whiteColor;
        _imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        _imageView.clipsToBounds = true;
        [self addSubview: _imageView];
        
    }
    return self;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    [super applyLayoutAttributes:layoutAttributes];
    
    NSLog(@"indexPath.item:  %@", @(layoutAttributes.indexPath.item));
    if ([layoutAttributes isKindOfClass:[CDChineseCollectionViewLayoutAttributes class]]) {
        
        CDChineseCollectionViewLayoutAttributes *attribute = (CDChineseCollectionViewLayoutAttributes *)layoutAttributes;
        _imageView.frame = self.bounds;
        self.imageView.image = [UIImage imageNamed:attribute.imgUrlStr];
    }
}

@end
