//
//  ModeAnimal.h
//  自定义一个转场动画
//
//  Created by Shirley on 16/7/6.
//  Copyright © 2016年 BFMXYJtext. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef NS_ENUM(NSUInteger, HYBModalTransitionType) {
    kHYBModalTransitionPresent = 1 << 1,
    kHYBModalTransitionDismiss = 1 << 2
};

@interface ModeAnimal : NSObject <UIViewControllerAnimatedTransitioning>

/*!
 *  @author 黄仪标, 15-12-21 11:12:44
 *
 *  指定动画类型
 *
 *  @param type          动画类型
 *  @param duration      动画时长
 *  @param presentHeight 弹出呈现的高度
 *  @param scale         fromVC的绽放系数
 *
 *  @return
 */
+ (ModeAnimal *)transitionWithType:(HYBModalTransitionType)type
                                  duration:(NSTimeInterval)duration
                             presentHeight:(CGFloat)presentHeight
                                     scale:(CGPoint)scale;


@end
