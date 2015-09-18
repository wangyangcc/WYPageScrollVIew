//
//  WYPagingView.m
//  WYPageScrollView
//
//  Created by wangyangyang on 15/9/18.
//  Copyright (c) 2015年 wang yangyang. All rights reserved.
//

#import "WYPagingView.h"

@interface WYPagingView ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, assign) CGFloat pageWidth; /**< 每页的宽度 */
@property (nonatomic, assign) CGFloat itemSpace; /**< 两页之间的间距 */

@end

@implementation WYPagingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.scrollView];
        self.scrollView.frame = self.bounds;
    }
    return self;
}

- (UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        _scrollView = [UIScrollView new];
        _scrollView.clipsToBounds = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    return _scrollView;
}

- (void)updateWithPageWidth:(CGFloat)pageWidthT
                  itemSpace:(CGFloat)itemSpageT
{
    self.itemSpace = itemSpageT;
    self.pageWidth = pageWidthT;
}

- (void)setPageWidth:(CGFloat)pageWidth
{
    _pageWidth = pageWidth;
    CGRect scrollVR = self.bounds;
    scrollVR.origin.x = (CGRectGetWidth(self.frame) - (pageWidth - self.itemSpace))/2;
    scrollVR.size.width = pageWidth;
    self.scrollView.frame = scrollVR;
}

//让子试图处理事件
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if ([self pointInside:point withEvent:event]) {
        if ([[self subviews] count] > 0) {
            //force return of first child, if exists
            return [[self subviews] objectAtIndex:0];
        } else {
            return self;
        }
    }
    return nil;
}


@end
