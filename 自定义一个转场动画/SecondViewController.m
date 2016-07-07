//
//  SecondViewController.m
//  自定义一个转场动画
//
//  Created by Shirley on 16/7/6.
//  Copyright © 2016年 BFMXYJtext. All rights reserved.
//

#import "SecondViewController.h"
#import "ThreeViewController.h"
#import "ModeAnimal.h"
@interface SecondViewController ()//<UIViewControllerTransitioningDelegate>

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    ThreeViewController *vc =[self.storyboard instantiateViewControllerWithIdentifier:@"ThreeViewController"];
    [self presentViewController:vc animated:YES completion:nil];
    
}

@end
