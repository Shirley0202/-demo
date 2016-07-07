# 自定义的转场动画 
#### 说明
1.此demo的是在解读其他人的框架时候理解时候而写 仅代表作者本人的想法,有不对的地方请多多指教.
2.需要更多效果的同学可以参考这个demo,本人就是学习他的框架是简单总结的下面的要点,学习的同学可以参考,
3具体效果,小伙伴们自己下载demo吧
<https://github.com/alanwangmodify/WXSTransition>



无交互转场动画的实现 
跳转
1 先在window上面加一层透明的 transitionView 
2 再在这个上面添加上要显示的view并实现动画,
3 在动画结束之后 把前一个从试图中删除  

返回上一层
1 先把上一层的view添加到 transitionView底部
2 然后开始褪去当前显示的view 的动画 
3 当动画结束的时候 把transitionView从window上删除


### 对于 presentView mode出来的 要设置

1. 设置要 ***弹出***  的view的 transitioningDelegate 为一个对象 
2. 实现里面的代理方法 
 - (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source   
 1> 返回一个遵守了UIViewControllerAnimatedTransitioning协议的对象 
 2> 这个对象里面实现了协议的方法

- (void)animationEnded:(BOOL)transitionCompleted {
  NSLog(@"%s", __FUNCTION__);
}
// 返回持续的时间
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
  return self.duration;
}
//在这个方法里面 具体的去实现动画 他提供了一个 UIViewControllerContextTransitioning对象,里面有需要用到的两个控制器 还有一个containerView 用来转化view ,
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
}
### 对于 push 出来的 要设置 和上面的类似 
1.设置navigationController.delegate 为一个对象 
2.实现里面的代理方法 
- (id<UIViewControllerAnimatedTransitioning>) navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC

1> 返回一个遵守了UIViewControllerAnimatedTransitioning协议的对象 
 2> 这个对象里面实现了协议的方法

- (void)animationEnded:(BOOL)transitionCompleted {
  NSLog(@"%s", __FUNCTION__);
}
// 返回持续的时间
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
  return self.duration;
}
//在这个方法里面 具体的去实现动画 他提供了一个 UIViewControllerContextTransitioning对象,里面有需要用到的两个控制器 还有一个containerView 用来转化view ,
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionCont



####补充
给一个没有显示出来的controller的view 截取屏幕的快照 snapshotViewAfterScreenUpdates 会导致控制器里面的一下方法会呗调用 (当在弹出的时候就不会在调用viewDidLoad方法了 其他的还会正常的调用)
viewDidLoad
viewWillAppear
viewWillDisappear
viewDidDisappear

