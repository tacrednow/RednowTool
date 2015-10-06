//
//  REDView.h
//  YXTK
//
//  Created by rednow on 15/8/1.
//  Copyright (c) 2015年 ZML. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface REDView : UIView

//背景／线条
-(instancetype)initWithFrame:(CGRect)frame color:(UIColor *)color;

//提示框
- (instancetype)initWithFrameTS:(CGRect)frame image:(UIImage *)image color:(UIColor *)color;

@end
