//
//  OneViewController.m
//  WYPageScrollView
//
//  Created by wangyangyang on 15/9/17.
//  Copyright (c) 2015年 wang yangyang. All rights reserved.
//

#import "OneViewController.h"
#import "CommonDefine.h"

@interface OneViewController () <UIScrollViewDelegate>
{
    CGPoint _lastOffset;
}

@property (nonatomic, strong) UIScrollView *co_scrollView;

@property (nonatomic, assign) CGFloat customWidth;

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.customWidth = 300;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //添加内容试图
    [self.view addSubview:self.co_scrollView];
    self.co_scrollView.backgroundColor = MMRGBColor(244, 244, 246);
    self.co_scrollView.frame = CGRectMake(0, MMNavigationBarHeight, ScreenWidth + 20, ScreenHeight - MMNavigationBarHeight);
    //end
    
    //添加每页内容
    for (NSInteger index = 0; index < 6; index ++) {
        UIView *indexView = [UIView new];
        indexView.backgroundColor = MMRGBColor(12 + index*10, 121 + index*10, 125);
        indexView.frame = CGRectMake((self.customWidth + 20)*index, 10, self.customWidth, CGRectGetHeight(self.co_scrollView.frame) - 20);
        
        UILabel *label = [UILabel new];
        label.text = [@(index) stringValue];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:40];
        label.frame = indexView.bounds;
        [indexView addSubview:label];
        
        [self.co_scrollView addSubview:indexView];
    }
    //end
    
    [self.co_scrollView setContentSize:CGSizeMake((self.customWidth + 20)*6 + 20*6, CGRectGetHeight(self.co_scrollView.frame) - 20)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollViewDelegate

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {

    _lastOffset = scrollView.contentOffset;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    
    CGFloat kMaxIndex = 6;
    CGFloat targetX = scrollView.contentOffset.x + velocity.x * 60.0;
    CGFloat targetIndex = round(targetX / (self.customWidth + 20));
    if (targetIndex < 0)
        targetIndex = 0;
    if (targetIndex > kMaxIndex)
        targetIndex = kMaxIndex;
    targetContentOffset->x = targetIndex * (self.customWidth + 20);
}

#pragma mark - getters and setters

- (UIScrollView *)co_scrollView
{
    if (_co_scrollView == nil) {
        _co_scrollView = [UIScrollView new];
        _co_scrollView.pagingEnabled = NO;  //必须是NO
        _co_scrollView.backgroundColor = MMRGBColor(244, 244, 246);
        _co_scrollView.showsVerticalScrollIndicator = NO;
        _co_scrollView.showsHorizontalScrollIndicator = NO;
        _co_scrollView.scrollEnabled = YES;
        _co_scrollView.delegate = self;
    }
    return _co_scrollView;
}

@end
