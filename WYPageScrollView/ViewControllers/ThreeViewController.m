//
//  ThreeViewController.m
//  WYPageScrollView
//
//  Created by wangyangyang on 15/9/18.
//  Copyright (c) 2015年 wang yangyang. All rights reserved.
//

#import "ThreeViewController.h"
#import "CommonDefine.h"

@interface ThreeViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *co_scrollView;

@property (nonatomic, assign) CGFloat pagingWidth; /**< 每页的宽度 大于屏幕宽度 */

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.pagingWidth = ScreenWidth + 20;
    
    [self.view addSubview:self.co_scrollView];
    self.co_scrollView.frame = CGRectMake(0, MMNavigationBarHeight, self.pagingWidth, ScreenHeight - MMNavigationBarHeight);
    
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
        indexView.frame = CGRectMake(self.pagingWidth*index, 10, ScreenWidth, CGRectGetHeight(self.co_scrollView.frame) - 20);
        
        UILabel *label = [UILabel new];
        label.text = [@(index) stringValue];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:40];
        label.frame = indexView.bounds;
        [indexView addSubview:label];
        
        [self.co_scrollView addSubview:indexView];
    }
    //end
    
    [self.co_scrollView setContentSize:CGSizeMake(self.pagingWidth*6, CGRectGetHeight(self.co_scrollView.frame) - 20)];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger currentPage = (NSInteger)scrollView.contentOffset.x/self.pagingWidth;
    currentPage = MAX(0, currentPage);
    
    NSLog(@"----当前是第%d页----",(int)currentPage);
}

#pragma mark - getters and setters

- (UIScrollView *)co_scrollView
{
    if (_co_scrollView == nil) {
        _co_scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
        _co_scrollView.pagingEnabled = YES;
        _co_scrollView.delegate = self;
        _co_scrollView.showsHorizontalScrollIndicator = NO;
        _co_scrollView.showsVerticalScrollIndicator = NO;
    }
    return _co_scrollView;
}

@end
