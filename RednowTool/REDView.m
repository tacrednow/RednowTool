//
//  REDView.m
//  YXTK
//
//  Created by rednow on 15/8/1.
//  Copyright (c) 2015年 ZML. All rights reserved.
//

#import "REDView.h"

@implementation REDView

//背景／线条
-(instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color{
    self=[super initWithFrame:frame];
    if (self) {
        if (color) {
            self.backgroundColor=color;
        }else{
            self.backgroundColor=[UIColor whiteColor];
        }
    }
    return self;
}

//提示框
- (instancetype)initWithFrameTS:(CGRect)frame image:(UIImage *)image color:(UIColor *)color
{
    self = [super initWithFrame:self.window.frame];
    if (self) {
        REDImageView *imageView=[[REDImageView alloc]initWithFrame:frame image:image];
        imageView.center=self.center;
        self.backgroundColor=color;
        [self addSubview:imageView];
    }
    return self;
}

@end
