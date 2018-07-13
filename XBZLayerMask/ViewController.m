//
//  ViewController.m
//  XBZLayerMask
//
//  Created by BigKing on 2018/7/13.
//  Copyright © 2018年 BigKing. All rights reserved.
//

#import "ViewController.h"
#import "XBZLayerMaskView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    XBZLayerMaskView *maskView = [[XBZLayerMaskView alloc] initWithFrame:CGRectMake(0, 0, 200, 60)];
    maskView.center = self.view.center;
    //    maskView.textColor = [UIColor greenColor];
    //    maskView.font = 20;
    //    maskView.maskBackgroundColor = [UIColor yellowColor];
    //    maskView.maxValue = 300;
    //    maskView.maskTextColor = [UIColor blueColor];
    
    [self.view addSubview:maskView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
