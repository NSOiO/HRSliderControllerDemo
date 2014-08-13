//
//  LeftSliderController.m
//  HRSliderControllerDemo
//
//  Created by Rannie on 13-10-7.
//  Copyright (c) 2013年 Rannie. All rights reserved.
//

#import "LeftSliderController.h"

#import "ClassModel.h"
#import "HRButton.h"
#import "HRSliderController.h"

#define RButtonWidth 180
#define RButtonHeight 400/6

@interface LeftSliderController ()
{
    NSArray *_modelList;
}

@end

@implementation LeftSliderController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *backView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    backView.image = [UIImage imageNamed:@"fancyBackground"];
    [self.view addSubview:backView];
    
    [self initialModelsAndButtons];
}

- (void)initialModelsAndButtons
{
    ClassModel *newscm = [ClassModel classModelWithTitle:@"新闻" className:@"NewsViewController" contentText:@"新闻视图内容" andImageName:@"sidebar_nav_news"];
    ClassModel *readcm = [ClassModel classModelWithTitle:@"订阅" className:@"ReadViewController" contentText:@"订阅视图内容" andImageName:@"sidebar_nav_reading"];
    ClassModel *localcm = [ClassModel classModelWithTitle:@"本地" className:@"LocalViewController" contentText:@"本地视图内容" andImageName:@"sidebar_nav_local"];
    ClassModel *piccm = [ClassModel classModelWithTitle:@"图片" className:@"PicViewController" contentText:@"图片视图内容" andImageName:@"sidebar_nav_photo"];
    ClassModel *commentcm = [ClassModel classModelWithTitle:@"跟帖" className:@"CommentViewController" contentText:@"跟帖视图内容" andImageName:@"sidebar_nav_comment"];
    ClassModel *topiccm = [ClassModel classModelWithTitle:@"话题" className:@"TopicViewController" contentText:@"话题视图内容" andImageName:@"sidebar_nav_topic"];
    
    _modelList = @[newscm, readcm, localcm, piccm, commentcm, topiccm];
    
    for (NSInteger i = 0; i < _modelList.count; i++)
    {
        HRButton *cmButton = [self buttonWithClassModel:_modelList[i]];
        cmButton.frame = CGRectMake(0, 40+i*RButtonHeight, RButtonWidth, RButtonHeight);
        [self.view addSubview:cmButton];
    }
}

//private
- (HRButton *)buttonWithClassModel:(ClassModel *)model
{
    HRButton *btn = [HRButton buttonWithType:UIButtonTypeRoundedRect];
    UIImage *image = [UIImage imageNamed:model.imageName];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setTitle:model.title forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:21.0f]];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(chooseTheModel:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = [_modelList indexOfObject:model];
    
    return btn;
}

//action
- (void)chooseTheModel:(UIButton *)sender
{
    ClassModel *model = _modelList[sender.tag];
    MyLog(@"选择了类目:%@", model.title);
    
    [[HRSliderController sharedSliderController] showContentControllerWithModel:model];
}

@end
