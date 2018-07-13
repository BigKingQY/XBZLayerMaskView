//
//  XBZLayerMaskView.h
//  XBZLayerMaskView
//
//  Created by BigKing on 2018/7/13.
//  Copyright © 2018年 BigKing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XBZLayerMaskView : UIView

//按钮
@property (nonatomic, strong) UIButton *button;
//文字颜色
@property (nonatomic, strong) UIColor *textColor;
//遮罩层文字颜色
@property (nonatomic, strong) UIColor *maskTextColor;
//遮罩层背景色
@property (nonatomic, strong) UIColor *maskBackgroundColor;
//边框色
@property (nonatomic, strong) UIColor *borderColor;
//值
@property (nonatomic, assign) CGFloat textValue;
//最小值
@property (nonatomic, assign) CGFloat minValue;
//最大值
@property (nonatomic, assign) CGFloat maxValue;
//字号
@property (nonatomic, assign) NSInteger font;
//增量（可以理解成速度）
@property (nonatomic, assign) CGFloat speed;

@end
