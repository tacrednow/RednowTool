//
//  REDImageView.h
//  YXTK
//
//  Created by rednow on 15/7/30.
//  Copyright (c) 2015年 ZML. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface REDImageView : UIImageView

@property(nonatomic,strong)UIImageView *headImage;

//头像
-(instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image corner:(CGFloat)corner;

//一般图片
-(instancetype)initWithFrameYJ:(CGRect)frame image:(UIImage *)image corner:(CGFloat)corner;

//无圆角图片
-(instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image;

@end
