//
//  XBZLayerMaskView.m
//  XBZLayerMaskView
//
//  Created by BigKing on 2018/7/13.
//  Copyright © 2018年 BigKing. All rights reserved.
//

#import "XBZLayerMaskView.h"

NSTimeInterval kTimerInterval = 0.05;

@interface XBZLayerMaskView ()

@property (nonatomic, strong) UILabel *backLabel;
@property (nonatomic, strong) UILabel *fontLabel;

@property (nonatomic, weak) CAShapeLayer *maskLayer;
@property (nonatomic, assign) CGFloat currentWidth;

@end

@implementation XBZLayerMaskView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _textColor = [UIColor redColor];
        _maskTextColor = [UIColor whiteColor];
        _maskBackgroundColor = [UIColor redColor];
        _borderColor = [UIColor redColor];
        _textValue = 0.f;
        _maxValue = 100.f;
        _minValue = 0.f;
        _font = 25;
        _speed = 0.3;
        
        _backLabel = [UILabel new];
        _backLabel.textColor = _textColor;
        _backLabel.font = [UIFont systemFontOfSize:_font];
        _backLabel.text = [NSString stringWithFormat:@"%ld%%", (NSInteger)_textValue];
        _backLabel.textAlignment = NSTextAlignmentCenter;
        _backLabel.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        [self addSubview:_backLabel];
        
        _fontLabel = [UILabel new];
        _fontLabel.backgroundColor = _maskBackgroundColor;
        _fontLabel.textColor = _maskTextColor;
        _fontLabel.font = [UIFont systemFontOfSize:_font];
        _fontLabel.text = [NSString stringWithFormat:@"%ld%%", (NSInteger)_textValue];
        _fontLabel.textAlignment = NSTextAlignmentCenter;
        _fontLabel.frame = CGRectMake(0, 0,frame.size.width, frame.size.height);
        [self addSubview:_fontLabel];
        
        CAShapeLayer *waveLayer = [CAShapeLayer layer];
        waveLayer.fillColor = [UIColor blueColor].CGColor;
        waveLayer.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        _fontLabel.layer.mask = waveLayer;
        self.maskLayer = waveLayer;
        
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setTitle:@"点击开始" forState:UIControlStateNormal];
        _button.backgroundColor = [UIColor whiteColor];
        [_button setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(clickStart:) forControlEvents:UIControlEventTouchUpInside];
        _button.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        [self addSubview:_button];
        
        self.layer.cornerRadius = 4.f;
        self.layer.borderColor = _borderColor.CGColor;
        self.layer.borderWidth = 3.f;
        self.layer.masksToBounds = YES;
        
        _currentWidth = 0;
        
    }
    return self;
}

//MARK: Action

- (void)clickStart:(UIButton *)sender {
    
    [sender setTitle:@"" forState:UIControlStateNormal];
    sender.backgroundColor = [UIColor clearColor];
    
    [NSTimer scheduledTimerWithTimeInterval:kTimerInterval target:self selector:@selector(start:) userInfo:nil repeats:YES];
}


//MAKR: Timer

- (void)start:(NSTimer *)timer {
    
    if (_minValue < _maxValue) {
        _minValue += _speed;
        self.backLabel.text = [NSString stringWithFormat:@"%ld%%", (NSInteger)_minValue];
        self.fontLabel.text = self.backLabel.text;
        
        _currentWidth += self.backLabel.frame.size.width / (_maxValue / _speed);
        
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, _currentWidth, self.frame.size.height)];
        self.maskLayer.path = path.CGPath;
        
    }else {
        self.backLabel.text = [NSString stringWithFormat:@"%ld%%", (NSInteger)_maxValue];
        self.fontLabel.text = self.backLabel.text;
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.button setTitle:@"再来一次" forState:UIControlStateNormal];
            self.button.backgroundColor = [UIColor whiteColor];
            self.minValue = 0;
            self.currentWidth = 0;
        });

        [timer invalidate];
        timer = nil;
    }
}


//MARK: Setter

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    self.backLabel.textColor = textColor;
}

- (void)setMaskTextColor:(UIColor *)maskTextColor {
    _maskTextColor = maskTextColor;
    self.fontLabel.textColor = maskTextColor;
}

- (void)setMaskBackgroundColor:(UIColor *)maskBackgroundColor {
    _maskBackgroundColor = maskBackgroundColor;
    self.fontLabel.backgroundColor = maskBackgroundColor;
}

- (void)setFont:(NSInteger)font {
    _font = font;
    
    self.backLabel.font = [UIFont systemFontOfSize:font];
    self.fontLabel.font = [UIFont systemFontOfSize:font];
}

- (void)setTextValue:(CGFloat)textValue {
    _textValue = textValue;
    
    self.fontLabel.text = [NSString stringWithFormat:@"%ld%%", (NSInteger)textValue];
    self.backLabel.text = [NSString stringWithFormat:@"%ld%%", (NSInteger)textValue];
}


@end
