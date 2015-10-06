//
//  REDLabel.h
//  YXTK
//
//  Created by rednow on 15/8/1.
//  Copyright (c) 2015年 ZML. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface REDLabel : UILabel

//普通
-(instancetype)initWithFrame:(CGRect)frame Content:(NSString *)Content textColor:(UIColor *)textColor font:(CGFloat)font;

//正文
-(instancetype)initWithFrameZW:(CGRect)frame Content:(NSString *)Content textColor:(UIColor *)textColor;

//标题，用户名等
-(instancetype)initWithFrameBT:(CGRect)frame Content:(NSString *)Content textColor:(UIColor *)textColor;

//气泡
-(instancetype)initWithFrame:(CGRect)frame Content:(NSString *)Content corner:(CGFloat)corner;

@end
