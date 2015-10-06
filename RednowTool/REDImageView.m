//
//  REDImageView.m
//  YXTK
//
//  Created by rednow on 15/7/30.
//  Copyright (c) 2015年 ZML. All rights reserved.
//

#import "REDImageView.h"

@implementation REDImageView

//头像
-(instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image corner:(CGFloat)corner{
    self=[super initWithFrame:frame];
    if (self) {
        self.clipsToBounds=YES;
        self.image=image;
        self.contentMode=UIViewContentModeScaleAspectFill;
        self.layer.cornerRadius=corner;
    }
    return self;
}

//一般图片
-(instancetype)initWithFrameYJ:(CGRect)frame image:(UIImage *)image corner:(CGFloat)corner{
    self=[super initWithFrame:frame];
    if (self) {
        self.clipsToBounds=YES;
        self.image=image;
        self.contentMode=UIViewContentModeScaleAspectFill;
        self.layer.cornerRadius=corner;
    }
    return self;
}

//无圆角图片
-(instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image{
    self=[super initWithFrame:frame];
    if (self) {
        self.clipsToBounds=YES;
        self.contentMode=UIViewContentModeScaleAspectFill;
        self.image=image;
    }
    return self;
}

@end
