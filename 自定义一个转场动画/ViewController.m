//
//  ViewController.m
//  自定义一个转场动画
//
//  Created by Shirley on 16/7/6.
//  Copyright © 2016年 BFMXYJtext. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "CustomPushAnimation.h"
#import "CustomPopAnimation.h"
@interface ViewController ()<UINavigationControllerDelegate>
{

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置代理
    self.navigationController.delegate = self;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    SecondViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}
#pragma mark - UINavigationControllerDelegate
- (id<UIViewControllerAnimatedTransitioning>) navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC

{
    /**
     
     *  typedef NS_ENUM(NSInteger, UINavigationControllerOperation) {
     
     *     UINavigationControllerOperationNone,
     
     *     UINavigationControllerOperationPush,
     
     *     UINavigationControllerOperationPop,
     
     *  };
     
     */
    //push的时候用我们自己定义的customPush
    if (operation == UINavigationControllerOperationPush) {
        
        return [[CustomPushAnimation alloc] init];
        
    }else if(operation == UINavigationControllerOperationPop){
        
        return [[CustomPopAnimation alloc]init];
        
    }else {
        return nil;
    }
    
}
@end
