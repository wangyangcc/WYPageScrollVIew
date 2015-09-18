//
//  TwoViewController.m
//  WYPageScrollView
//
//  Created by wangyangyang on 15/9/17.
//  Copyright (c) 2015年 wang yangyang. All rights reserved.
//

#import "TwoViewController.h"
#import "WYPagingView.h"
#import "CommonDefine.h"

@interface TwoViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) WYPagingView *co_pagingView;

@property (nonatomic, assign) CGFloat customWidth;
@property (nonatomic, assign) CGFloat itemSpace;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.customWidth = 280;
    self.itemSpace = 20;
    
    [self.view addSubview:self.co_pagingView];
    [self.co_pagingView updateWithPageWidth:self.customWidth itemSpace:self.itemSpace];
    
    [self dataInit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dataInit
{
    //添加每页内容
    for (NSInteger index = 0; index < 6; index ++) {
        UIView *indexView = [UIView new];
        indexView.backgroundColor = MMRGBColor(12 + index*10, 121 + index*10, 125);
        indexView.frame = CGRectMake(self.customWidth*index, 10, self.customWidth - self.itemSpace, CGRectGetHeight(self.co_pagingView.frame) - 20);
        
        UILabel *label = [UILabel new];
        label.text = [@(index) stringValue];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:40];
        label.frame = indexView.bounds;
        [indexView addSubview:label];
        
        [self.co_pagingView.scrollView addSubview:indexView];
    }
    //end
    
    [self.co_pagingView.scrollView setContentSize:CGSizeMake(self.customWidth*6, CGRectGetHeight(self.co_pagingView.frame) - 20)];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger currentPage = (NSInteger)scrollView.contentOffset.x/self.co_pagingView.pageWidth;
    currentPage = MAX(0, currentPage);
    
    NSLog(@"----当前是第%d页----",(int)currentPage);
}

#pragma mark - getters and setters

- (WYPagingView *)co_pagingView
{
    if (_co_pagingView == nil) {
        _co_pagingView = [[WYPagingView alloc] initWithFrame:CGRectMake(0, MMNavigationBarHeight, ScreenWidth, ScreenHeight - MMNavigationBarHeight)];
        _co_pagingView.scrollView.delegate = self;
        _co_pagingView.clipsToBounds = YES;
        _co_pagingView.backgroundColor = [UIColor lightGrayColor];
    }
    return _co_pagingView;
}
@end
