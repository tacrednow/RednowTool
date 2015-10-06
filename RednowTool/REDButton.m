//
//  REDButton.m
//  YXTK
//
//  Created by rednow on 15/8/1.
//  Copyright (c) 2015年 ZML. All rights reserved.
//

#import "REDButton.h"

@implementation REDButton

//普通
-(instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image corner:(CGFloat)corner tag:(int)tag{
    self=[super initWithFrame:frame];
    if (self) {
        [self setImage:image forState:0];
        self.tag=tag;
        self.imageView.clipsToBounds=YES;
        self.imageView.contentMode=UIViewContentModeScaleAspectFill;
        self.contentMode=UIViewContentModeScaleAspectFill;
        self.layer.cornerRadius=corner;
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image tag:(int)tag{
    self=[super initWithFrame:frame];
    if (self) {
        [self setImage:image forState:0];
        self.tag=tag;
        self.imageView.clipsToBounds=YES;
        self.imageView.contentMode=UIViewContentModeScaleAspectFill;
        self.contentMode=UIViewContentModeScaleAspectFill;
    }
    return self;
}

-(instancetype)initWithFrame1:(CGRect)frame image:(UIImage *)image tag:(int)tag{
    self=[super initWithFrame:frame];
    if (self) {
        [self setImage:image forState:0];
        self.tag=tag;
        self.clipsToBounds=YES;
        self.contentMode=UIViewContentModeScaleAspectFit;
    }
    return self;
}

//头像
-(instancetype)initWithFrameTX:(CGRect)frame image:(UIImage *)image corner:(CGFloat)corner tag:(int)tag{
    self=[super initWithFrame:frame];
    if (self) {
        [self setImage:image forState:0];
        self.imageEdgeInsets=UIEdgeInsetsMake(1*sIZE, 1*sIZE, 1*sIZE, 1*sIZE);
        self.tag=tag;
        self.imageView.frame=CGRectMake(frame.origin.x-1*sIZE, frame.origin.y-1*sIZE, frame.size.width-2*sIZE, frame.size.height-2*sIZE);
        self.imageView.clipsToBounds=YES;
        self.imageView.contentMode=UIViewContentModeScaleAspectFill;
        self.layer.cornerRadius=corner;
        if (corner==0) {
            [self setBackgroundImage:[UIImage imageNamed:@"touxiangbeijing2.png"] forState:0];
//            self.imageView.frame=CGRectMake(frame.origin.x-5*sIZE, frame.origin.y-5*sIZE, frame.size.width-10*sIZE, frame.size.height-10*sIZE);
//            self.imageEdgeInsets=UIEdgeInsetsMake(5*sIZE, 5*sIZE, 0, 0);
        }else{
            [self setBackgroundImage:[UIImage imageNamed:@"touxiangbeijing.png"] forState:0];
            self.imageView.layer.cornerRadius=corner-1*sIZE;
        }

    }
    return self;
}


//标题普通
-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor font:(CGFloat)font tag:(int)tag{
    self=[super initWithFrame:frame];
    if (self) {
        self.tag=tag;
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:font];
    }
    return self;
}

//气泡
-(instancetype)initWithFrameQP:(CGRect)frame title:(NSString *)title corner:(CGFloat)corner tag:(int)tag{
    self=[super initWithFrame:frame];
    if (self) {
        self.tag=tag;
        self.clipsToBounds=YES;
        self.layer.cornerRadius=corner;
        [self setBackgroundImage:IMAGE(@"xiaoyuan.png") forState:0];
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:cMyGreen1 forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:smallContentFont];
    }
    return self;
}

//图文
-(instancetype)initWithFrameTW:(CGRect)frame image:(UIImage *)image title:(NSString *)title tag:(int)tag{
    self=[super initWithFrame:frame];
    if (self) {
        [self setImage:image forState:0];
        self.imageView.clipsToBounds=YES;
        self.imageView.contentMode=UIViewContentModeScaleAspectFit;
        self.tag=tag;
        [self setTitle:title forState:0];
        [self setTitleColor:cMyWhite1 forState:0];
        self.titleLabel.font = [UIFont systemFontOfSize:smallContentFont];
    }
    return self;
}

//添加按钮背景图
-(instancetype)initWithFrameBJ:(CGRect)frame image:(UIImage *)image tag:(int)tag{
    self=[super initWithFrame:frame];
    if (self) {
        [self setBackgroundImage:image forState:0];
        self.tag=tag;
    }
    return self;
}

//标题＋背景颜色
-(instancetype)initWithFrameBJ:(CGRect)frame color:(UIColor *)color title:(NSString *)title titleColor:(UIColor *)titleColor tag:(int)tag {
    self=[super initWithFrame:frame];
    if (self) {
        self.tag=tag;
        self.layer.cornerRadius=sizeofRadius;
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        self.backgroundColor=color;
        self.titleLabel.font = [UIFont systemFontOfSize:titleFont];
    }
    return self;
}











//标题（可变底色）
-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title tag:(int)tag titleColor:(UIColor *)titleColor{
    self=[super initWithFrame:frame];
    if (self) {
        self.tag=tag;
        self.layer.cornerRadius=sizeofRadius;
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:titleFont];
    }
    return self;
}

//标题（带边框，可变底色）
-(instancetype)initWithFrame1:(CGRect)frame title:(NSString *)title tag:(int)tag titleColor:(UIColor *)titleColor{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderColor = cMyGray.CGColor;
        self.layer.borderWidth = 0.5;
        self.tag=tag;
        self.layer.cornerRadius=sizeofRadius;
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:titleFont];
    }
    return self;
}

//正文（可变底色）
-(instancetype)initWithFrame2:(CGRect)frame title:(NSString *)title tag:(int)tag titleColor:(UIColor *)titleColor{
    self=[super initWithFrame:frame];
    if (self) {
        self.tag=tag;
        self.layer.cornerRadius=sizeofRadius;
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:smallContentFont];
    }
    return self;
}

//标题（带边框）
-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title tag:(int)tag{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderColor = cMyGray.CGColor;
        self.layer.borderWidth = 0.5;
        self.tag=tag;
        self.layer.cornerRadius=sizeofRadius;
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:titleFont];
    }
    return self;
}







//按钮（背景色）
-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title backgroundColor:(UIColor *)color1  titleColor:(UIColor *)color2 corner:(CGFloat)corner tag:(int)tag{
    self=[super initWithFrame:frame];
    if (self) {
        self.tag=tag;
        self.clipsToBounds=YES;
        self.backgroundColor=color1;
        self.layer.cornerRadius=corner;
        self.contentMode=UIViewContentModeScaleAspectFill;
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:color2 forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:smallContentFont];
    }
    return self;
}


//头像
-(instancetype)initWithFrame2:(CGRect)frame image:(UIImage *)image tag:(int)tag corner:(CGFloat)corner{
    self=[super initWithFrame:frame];
    if (self) {
        [self setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:0];
        self.tag=tag;
        self.clipsToBounds=YES;
        self.contentMode=UIViewContentModeScaleAspectFill;
        self.layer.cornerRadius=corner;
        self.layer.masksToBounds = YES;
        self.layer.borderWidth=(corner/15)*sIZE;
        self.layer.borderColor=cMyBorderColor;
        self.backgroundColor = cMyGray1;

    }
    return self;
}

@end
