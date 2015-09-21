# WYPageScrollVIew
scrollview 自定义整页滚动宽度

##在使用scrollView的过程中，经常会碰到整屏滚动的需求，设计湿设计的通常是需要自定义paging size的，下面总结了三种常用的解决方法

### 1、实现 UIScrollViewDelegate 协议，重写`scrollViewWillEndDragging:withVelocity:targetContentOffset:`方法

首先要保证`scrollView`的`pagingEnabled`为`NO`，示例如下：

<pre><code>- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    //计算在scrollView在停止的时候，应该滚动到的位置
    CGFloat kMaxIndex = 6; //最大的页数
    CGFloat targetX = scrollView.contentOffset.x ;//+ velocity.x * 60.0;
    CGFloat targetIndex = round(targetX / (self.customWidth + 20));
    if (targetIndex < 0)
        targetIndex = 0;
    if (targetIndex > kMaxIndex)
        targetIndex = kMaxIndex;
    //指定scrollView在停止的时候，滚动到的位置
    targetContentOffset->x = targetIndex * (self.customWidth + 20);
}</pre></code>

### 2、给scrollView添加父类，设置其`clipsToBounds`

首先要保证`scrollView`的`pagingEnabled`为`YES`
其次，设置scrollView父类`clipsToBounds`为`YES`，scrollView`clipsToBounds`为`NO`，然后设置scrollView的`frame`
> `clipsToBounds` 设置为`YES`则把超出`view`的那部份隐藏起来

此外，需要重写scrollView父类的`hitTest:withEvent:`方法，保证在滑动scrollView外部区域的时候，scrollView也能响应事件，代码如下

<pre><code>- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    if ([self pointInside:point withEvent:event]) {
        if ([[self subviews] count] > 0) {
            //force return of first child, if exists
            return [[self subviews] objectAtIndex:0];
        } else {
            return self;
        }
    }
    return nil;
}</pre></code>

### 3、对于整屏滚动，类似iOS系统相册查看图片的方式

设置`scrollView`的`pagingEnabled`为`YES`，关键代码如下

<pre><code>self.co_scrollView.frame = CGRectMake(0, MMNavigationBarHeight, self.pagingWidth, ScreenHeight - MMNavigationBarHeight);
//添加每页内容
for (NSInteger index = 0; index < 6; index ++) {
    UIView *indexView = [UIView new];
    indexView.backgroundColor = MMRGBColor(12 + index*10, 121 + index*10, 125);
     indexView.frame = CGRectMake(self.pagingWidth*index, 10, ScreenWidth, CGRectGetHeight(self.co_scrollView.frame) - 20);
     [self.co_scrollView addSubview:indexView];
}
//end
[self.co_scrollView setContentSize:CGSizeMake(self.pagingWidth*6, CGRectGetHeight(self.co_scrollView.frame) - 20)];</pre></code>