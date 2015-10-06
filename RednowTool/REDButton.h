//
//  REDButton.h
//  YXTK
//
//  Created by rednow on 15/8/1.
//  Copyright (c) 2015年 ZML. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface REDButton : UIButton

//普通
-(instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image corner:(CGFloat)corner tag:(int)tag;

//标题普通
-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor font:(CGFloat)font tag:(int)tag;

//头像
-(instancetype)initWithFrameTX:(CGRect)frame image:(UIImage *)image corner:(CGFloat)corner tag:(int)tag;

//气泡
-(instancetype)initWithFrameQP:(CGRect)frame title:(NSString *)title corner:(CGFloat)corner tag:(int)tag;

//图文
-(instancetype)initWithFrameTW:(CGRect)frame image:(UIImage *)image title:(NSString *)title tag:(int)tag;

//背景图按钮
-(instancetype)initWithFrameBJ:(CGRect)frame image:(UIImage *)image tag:(int)tag;

//标题＋背景颜色
-(instancetype)initWithFrameBJ:(CGRect)frame color:(UIColor *)color title:(NSString *)title titleColor:(UIColor *)titleColor tag:(int)tag;




//标题（可变底色）
-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title tag:(int)tag titleColor:(UIColor *)titleColor;

//标题（带边框，可变底色）
-(instancetype)initWithFrame1:(CGRect)frame title:(NSString *)title tag:(int)tag titleColor:(UIColor *)titleColor;

//正文（可变底色）
-(instancetype)initWithFrame2:(CGRect)frame title:(NSString *)title tag:(int)tag titleColor:(UIColor *)titleColor;

//标题（带边框）
-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title tag:(int)tag;

-(instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image tag:(int)tag;
-(instancetype)initWithFrame1:(CGRect)frame image:(UIImage *)image tag:(int)tag;

//按钮(背景色)
-(instancetype)initWithFrame:(CGRect)frame title:(NSString *)title backgroundColor:(UIColor *)color1  titleColor:(UIColor *)color2 corner:(CGFloat)corner tag:(int)tag;

//头像
-(instancetype)initWithFrame2:(CGRect)frame image:(UIImage *)image tag:(int)tag corner:(CGFloat)corner;

@end
