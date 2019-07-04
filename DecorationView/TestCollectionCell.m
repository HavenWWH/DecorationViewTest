//
//  TestCollectionCell.m
//  DecorationView
//
//  Created by 吴文海 on 2019/7/4.
//  Copyright © 2019 吴文海. All rights reserved.
//

#import "TestCollectionCell.h"

@implementation TestCollectionCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        [self setupView];
    }
    return self;
}

- (void)setupView {
    
}


- (void)setttingData:(NSIndexPath *)indexPath {
    
    if (indexPath.item % 2 == 0) {
        
        self.backgroundColor = [UIColor colorWithRed:20/255.0f green:10/255.0f blue:100/255.0f alpha:0.6];
    } else {
        
        self.backgroundColor = [UIColor colorWithRed:20/255.0f green:40/255.0f blue:110/255.0f alpha:0.6];
    }
}
@end
