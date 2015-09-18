//
//  WYPagingView.h
//  WYPageScrollView
//
//  Created by wangyangyang on 15/9/18.
//  Copyright (c) 2015年 wang yangyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYPagingView : UIView

@property (nonatomic, readonly, strong) UIScrollView *scrollView;

@property (nonatomic, readonly, assign) CGFloat pageWidth; /**< 每页的宽度 */
@property (nonatomic, readonly, assign) CGFloat itemSpace; /**< 两页之间的间距 */

- (void)updateWithPageWidth:(CGFloat)pageWidthT
                  itemSpace:(CGFloat)itemSpageT;

@end
