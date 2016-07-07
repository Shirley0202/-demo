//
//  CustomPushAnimation.m
//  自定义一个转场动画
//
//  Created by Shirley on 16/7/7.
//  Copyright © 2016年 BFMXYJtext. All rights reserved.
//

#import "CustomPushAnimation.h"

#define screenW [UIScreen mainScreen].bounds.size.width
#define screenH [UIScreen mainScreen].bounds.size.height

@implementation CustomPushAnimation
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext

{
    
    return 1.0;
    
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{   //目的ViewController
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //起始ViewController
    
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    
    
    //添加toView到上下文
    
    [[transitionContext containerView] insertSubview:toViewController.view belowSubview:fromViewController.view];
    
    
    
    //自定义动画
    
    toViewController.view.transform = CGAffineTransformMakeTranslation(screenW, screenH);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        fromViewController.view.transform = CGAffineTransformMakeTranslation(-screenW, -screenH);
        toViewController.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
        fromViewController.view.transform = CGAffineTransformIdentity;
        // 声明过渡结束时调用 completeTransition: 这个方法
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
    
}

@end
