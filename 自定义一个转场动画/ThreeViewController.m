//
//  ThreeViewController.m
//  自定义一个转场动画
//
//  Created by Shirley on 16/7/6.
//  Copyright © 2016年 BFMXYJtext. All rights reserved.
//

#import "ThreeViewController.h"
#import "ModeAnimal.h"
@interface ThreeViewController ()<UIViewControllerTransitioningDelegate>


@end

@implementation ThreeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.transitioningDelegate = self;
    self.modalPresentationStyle =  UIModalPresentationCustom;
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
#pragma mark - UIViewControllerTransitioningDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [ModeAnimal transitionWithType:kHYBModalTransitionPresent duration:0.5 presentHeight:350 scale:CGPointMake(0.9, 0.9)];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [ModeAnimal transitionWithType:kHYBModalTransitionDismiss duration:0.25 presentHeight:350 scale:CGPointMake(0.9, 0.9)];
}



@end
