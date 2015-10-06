//
//  REDLabel.m
//  YXTK
//
//  Created by rednow on 15/8/1.
//  Copyright (c) 2015年 ZML. All rights reserved.
//

#import "REDLabel.h"

@implementation REDLabel

//普通
-(instancetype)initWithFrame:(CGRect)frame Content:(NSString *)Content textColor:(UIColor *)textColor font:(CGFloat)font{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.text = Content;
        self.textColor=textColor;
        self.font = [UIFont systemFontOfSize:font];
    }
    return self;
}

//正文
-(instancetype)initWithFrameZW:(CGRect)frame Content:(NSString *)Content textColor:(UIColor *)textColor{
    self=[super initWithFrame:frame];
    if (self) {
        if (!textColor) {
            self.textColor=cMyGray4;
        }else{
            self.textColor=textColor;
        }
        self.backgroundColor = [UIColor clearColor];
        self.text = Content;
        self.font=[UIFont systemFontOfSize:smallContentFont];
    }
    return self;
}

//标题，用户名等
-(instancetype)initWithFrameBT:(CGRect)frame Content:(NSString *)Content textColor:(UIColor *)textColor{
    self=[super initWithFrame:frame];
    if (self) {
        if (!textColor) {
            self.textColor=[UIColor blackColor];
        }else{
            self.textColor=textColor;
        }
        self.font=[UIFont systemFontOfSize:titleFont];
        self.backgroundColor = [UIColor clearColor];
        self.text = Content;
    }
    return self;
}

//气泡
-(instancetype)initWithFrame:(CGRect)frame Content:(NSString *)content corner:(CGFloat)corner{
    self=[super initWithFrame:frame];
    if (self) {
        self.text=content;
        self.layer.cornerRadius=corner;
        self.clipsToBounds=YES;
        self.textAlignment=NSTextAlignmentCenter;
        self.backgroundColor=[UIColor redColor];
        self.textColor=cMyWhite;
        self.font = [UIFont boldSystemFontOfSize:smallContentFont];
    }
    return self;
}




@end
