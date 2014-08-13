//
//  RightSliderController.m
//  HRSliderControllerDemo
//
//  Created by Rannie on 13-10-10.
//  Copyright (c) 2013年 Rannie. All rights reserved.
//

#import "RightSliderController.h"

@interface RightSliderController ()

@end

@implementation RightSliderController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:self.view.frame];
    bgView.image = [UIImage imageNamed:@"fancyBackground"];
    [self.view addSubview:bgView];
    
    UIImageView *head = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"navbar_netease"]];
    head.center = CGPointMake(210, 90);
    head.bounds = CGRectMake(0, 0, 90, 44);
    [self.view addSubview:head];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(140, 150, 140, 40)];
    label.textColor = [UIColor redColor];
    label.text = @"作者:RannieR";
    label.font = [UIFont systemFontOfSize:22.0f];
    [self.view addSubview:label];
}

@end
