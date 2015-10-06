//
//  REDTableViewCell.m
//  ANE
//
//  Created by rednow on 15/9/9.
//  Copyright (c) 2015年 binghe168. All rights reserved.
//

#import "REDTableViewCell.h"
#import <SDWebImage/UIButton+WebCache.h>
#import <SDWebImage/UIImageView+WebCache.h>

@implementation REDTableViewCell

-(instancetype)initWithStyleCL:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _imageLeft=[[REDImageView alloc]initWithFrame:REDRect(15, 10, 20, 20) image:nil];
        _imageLeft.contentMode=UIViewContentModeScaleAspectFit;
        [self addSubview:_imageLeft];
        
        _titleLeft=[[REDLabel alloc]initWithFrame:REDRect(46, 10, 150, 20) Content:nil textColor:cMyWhite1 font:titleFont];
        [self addSubview:_titleLeft];
        
        _buttonRight=[[REDButton alloc]initWithFrameQP:REDRect(193, 10, 20, 20) title:@"3" corner:10*sIZE tag:0];
        [self addSubview:_buttonRight];
        
        _imageRight=[[REDImageView alloc]initWithFrame:REDRect(227, 17, 8, 12.5) image:IMAGE(@"更多.png")];
        [self addSubview:_imageRight];
        
        _viewAmong=[[REDView alloc]initWithFrame:CGRectMake(46*sIZE, 39.5*sIZE, 190*sIZE, 0.5) color:cMyBlack2];
        [self addSubview:_viewAmong];
        
        
    }
    return self;
}

-(instancetype)initWithStyleSY:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _buttonLeft=[[REDButton alloc]initWithFrame:REDRect(10, 10, 85, 85) image:IMAGE(@"头像.png") corner:sizeofRadius tag:0];
        _buttonLeft.imageView.layer.cornerRadius=sizeofRadius;
//        _buttonLeft.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
//        _buttonLeft.layer.shadowOffset = CGSizeMake(0.8,0.8);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
//        _buttonLeft.layer.shadowOpacity = 1;//阴影透明度，默认0
//        _buttonLeft.layer.shadowRadius = 0.8;//阴影半径，默认3
        [self addSubview:_buttonLeft];
        
        _titleLeft=[[REDLabel alloc]initWithFrame:REDRect(105, 14, 180, 20) Content:nil textColor:cMyBlue font:titleFont];
        [self addSubview:_titleLeft];
        
        _titleAmong=[[REDLabel alloc]initWithFrame:REDRect(105, 45, 180, 20) Content:nil textColor:cMyWhite2 font:smallerContentFont];
        [_titleAmong setNumberOfLines:4];
        [self addSubview:_titleAmong];
        
        _imageRight=[[REDImageView alloc]initWithFrame:REDRect(290, 45, 9, 15) image:IMAGE(@"首页更多.png")];
        [self addSubview:_imageRight];        
    }
    return self;
}

-(instancetype)initWithStyleMYHead:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titleLeft=[[REDLabel alloc]initWithFrame:REDRect(15, 15, 80, 20) Content:nil textColor:cMyWhite1 font:titleFont];
        [self addSubview:_titleLeft];
        
        _imageAmong=[[REDImageView alloc]initWithFrame:REDRect(250, 5, 40, 40) image:nil corner:20*sIZE];
        [self addSubview:_imageAmong];
        
        _imageRight=[[REDImageView alloc]initWithFrame:REDRect(300, 17, 8, 12.5) image:IMAGE(@"更多.png")];
        [self addSubview:_imageRight];
    }
    return self;
}

-(instancetype)initWithStyleMY:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _titleLeft=[[REDLabel alloc]initWithFrame:REDRect(15, 15, 80, 20) Content:nil textColor:cMyWhite1 font:titleFont];
        [self addSubview:_titleLeft];
        
        _titleRight=[[REDLabel alloc]initWithFrameZW:REDRect(100, 15, 190, 20) Content:nil textColor:cMyWhite1];
        _titleRight.textAlignment=NSTextAlignmentRight;
        [self addSubview:_titleRight];
        
        _imageRight=[[REDImageView alloc]initWithFrame:REDRect(300, 19, 8, 12.5) image:IMAGE(@"更多.png")];
        [self addSubview:_imageRight];
    }
    return self;
}

-(instancetype)initWithStyleMyTask:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _buttonLeft=[[REDButton alloc]initWithFrameTX:REDRect(15, 10, 60, 60) image:IMAGE(@"ANE头像.png") corner:0 tag:0];
        _buttonLeft.imageView.layer.cornerRadius=sizeofRadius;
//        _buttonLeft.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
//        _buttonLeft.layer.shadowOffset = CGSizeMake(0.8,0.8);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
//        _buttonLeft.layer.shadowOpacity = 1;//阴影透明度，默认0
//        _buttonLeft.layer.shadowRadius = 0.8;//阴影半径，默认3
        [self addSubview:_buttonLeft];
        
        _titleLeft=[[REDLabel alloc]initWithFrameBT:REDRect(80, 13, 202, 20) Content:nil textColor:cMyWhite1];
        [self addSubview:_titleLeft];
        
        _buttonAmong=[[REDButton alloc]initWithFrameBJ:CGRectMake(CGRectGetMaxX(_titleLeft.frame)+5*sIZE, 13*sIZE, 40*sIZE, 16*sIZE) image:IMAGE(@"dailingqu.png") tag:0];
        _buttonAmong.titleLabel.font=[UIFont systemFontOfSize:smallerContentFont];
        [self addSubview:_buttonAmong];
        
        _titleRight=[[REDLabel alloc]initWithFrameZW:REDRect(80, 36, 212, 20) Content:nil textColor:cMyWhite2];
        [_titleRight setNumberOfLines:2];
        [self addSubview:_titleRight];
        
        _buttonRight=[[REDButton alloc]initWithFrame:REDRect(280, 18, 24, 42) image:IMAGE(@"接受.png") tag:0];
        _buttonRight.hidden=YES;
        [self addSubview:_buttonRight];
        
        _imageRight=[[REDImageView alloc]initWithFrame:REDRect(300, 35, 8, 12.5) image:IMAGE(@"gengduomessage.png")];
        [self addSubview:_imageRight];
    }
    return self;
}

-(instancetype)initWithStyleXX:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _buttonLeft=[[REDButton alloc]initWithFrameTX:REDRect(15, 10, 48, 48) image:IMAGE(@"ANE头像.png") corner:0 tag:0];
        [self addSubview:_buttonLeft];
        
        _titleLeft=[[REDLabel alloc]initWithFrameBT:REDRect(68, 13, 222, 20) Content:nil textColor:cMyWhite1];
        [self addSubview:_titleLeft];
        
        _titleRight=[[REDLabel alloc]initWithFrameZW:REDRect(68, 40, 222, 20) Content:nil textColor:cMyWhite2];
        [self addSubview:_titleRight];
        
        _imageRight=[[REDImageView alloc]initWithFrame:REDRect(300, 29, 8, 12.5) image:IMAGE(@"gengduomessage.png")];
        [self addSubview:_imageRight];
    }
    return self;
}

-(instancetype)initWithStyleMyReward:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _imageLeft=[[REDImageView alloc]initWithFrameYJ:REDRect(15, 10, 290, 100) image:IMAGE(@"占位图.png") corner:sizeofRadius];
        [self addSubview:_imageLeft];
        
        _titleLeft=[[REDLabel alloc]initWithFrameZW:REDRect(15, 115, 290, 20) Content:nil textColor:cMyWhite1];
        [self addSubview:_titleLeft];
        
        _titleAmong=[[REDLabel alloc]initWithFrameBT:REDRect(15, 140, 250, 15) Content:nil textColor:cMyWhite2];
        [self addSubview:_titleAmong];
        
        _titleRight=[[REDLabel alloc]initWithFrameBT:REDRect(270, 140, 40, 15) Content:nil textColor:cMyBlue];
        [self addSubview:_titleRight];
    }
    return self;
}

-(instancetype)initWithStyleLevel:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _imageLeft=[[REDImageView alloc]initWithFrameYJ:REDRect(15, 13, 40, 40) image:IMAGE(@"ANE头像.png") corner:sizeofRadius];
        [self addSubview:_imageLeft];
        
        _titleLeft=[[REDLabel alloc]initWithFrameBT:REDRect(60, 15, 202, 20) Content:nil textColor:cMyWhite1];
        [self addSubview:_titleLeft];
        
        _buttonLeft=[[REDButton alloc]initWithFrameBJ:REDRect(60, 40, 80, 20) image:IMAGE(@"dailingqu.png") tag:0];
        _buttonLeft.userInteractionEnabled=NO;
        _buttonLeft.titleLabel.font=[UIFont systemFontOfSize:smallerContentFont];
        [self addSubview:_buttonLeft];

        _titleRight=[[REDLabel alloc]initWithFrameBT:REDRect(260, 15, 50, 25) Content:nil textColor:cMyWhite1];
        [self addSubview:_titleRight];
    }
    return self;
}

-(instancetype)initWithStyleMyGroup:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _buttonLeft=[[REDButton alloc]initWithFrameTX:REDRect(15, 10, 35, 35) image:IMAGE(@"ANE头像.png") corner:0 tag:0];
        _buttonLeft.imageView.layer.cornerRadius=sizeofRadius;
//        _buttonLeft.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
//        _buttonLeft.layer.shadowOffset = CGSizeMake(0.8,0.8);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
//        _buttonLeft.layer.shadowOpacity = 1;//阴影透明度，默认0
//        _buttonLeft.layer.shadowRadius = 0.8;//阴影半径，默认3
        [self addSubview:_buttonLeft];
        
        _titleLeft=[[REDLabel alloc]initWithFrameBT:REDRect(70, 15, 202, 25) Content:nil textColor:cMyWhite1];
        [self addSubview:_titleLeft];
        
        _imageRight=[[REDImageView alloc]initWithFrame:REDRect(300, 21, 8, 12.5) image:IMAGE(@"gengduomessage.png")];
        [self addSubview:_imageRight];
    }
    return self;
}

-(instancetype)initWithStyleDNE:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _buttonLeft=[[REDButton alloc]initWithFrameTX:REDRect(15, 10, 60, 60) image:IMAGE(@"ANE头像.png") corner:0 tag:0];
        _buttonLeft.imageView.layer.cornerRadius=sizeofRadius;
//        _buttonLeft.layer.shadowColor = [UIColor blackColor].CGColor;//shadowColor阴影颜色
//        _buttonLeft.layer.shadowOffset = CGSizeMake(0.8,0.8);//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
//        _buttonLeft.layer.shadowOpacity = 1;//阴影透明度，默认0
//        _buttonLeft.layer.shadowRadius = 0.8;//阴影半径，默认3
        [self addSubview:_buttonLeft];
        
        _imageLeft=[[REDImageView alloc]initWithFrame:REDRect(15, 10, 60, 60) image:IMAGE(@"weijiesuo.png")];
        _imageLeft.hidden=YES;
        [self addSubview:_imageLeft];
        
        _titleLeft=[[REDLabel alloc]initWithFrameBT:REDRect(80, 13, 212, 20) Content:nil textColor:cMyWhite1];
        [self addSubview:_titleLeft];
        
        _titleRight=[[REDLabel alloc]initWithFrameZW:REDRect(80, 36, 212, 20) Content:nil textColor:cMyWhite2];
        [_titleRight setNumberOfLines:2];
        [self addSubview:_titleRight];
        
        _imageRight=[[REDImageView alloc]initWithFrame:REDRect(300, 35, 8, 12.5) image:IMAGE(@"gengduomessage.png")];
        [self addSubview:_imageRight];
    }
    return self;
}





-(void)setDataSY:(NSDictionary *)dict{
    [_buttonLeft sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HEAD_URL_IMAGE,dict[@"img"]]] forState:0 placeholderImage:[UIImage imageNamed:@"占位图.png"] options:SDWebImageRetryFailed|SDWebImageLowPriority|SDWebImageRefreshCached];
    _titleLeft.text=dict[@"name"];
    _titleAmong.text=dict[@"describe"];
    [_titleAmong sizeToFit];
}

-(void)setDataXX:(NSDictionary *)dict{
    _titleLeft.text=dict[@"title"];
    _titleRight.text=dict[@"content"];
}

-(void)setDataMyTask:(NSDictionary *)dict{
    [_buttonLeft sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HEAD_URL_IMAGE,dict[@"img"]]] forState:0 placeholderImage:[UIImage imageNamed:@"占位图.png"] options:SDWebImageRetryFailed|SDWebImageLowPriority|SDWebImageRefreshCached];
    _titleLeft.text=dict[@"name"];
    [_titleLeft sizeToFit];
    _titleRight.text=dict[@"describe"];
    [_titleRight sizeToFit];
    _buttonAmong.frame=CGRectMake(CGRectGetMaxX(_titleLeft.frame)+5*sIZE, 13*sIZE, 40*sIZE, 16*sIZE);
}

-(void)setDataMyReward:(NSDictionary *)dict{
    [_imageLeft sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HEAD_URL_IMAGE,dict[@"img"]]] placeholderImage:[UIImage imageNamed:@"占位图.png"] options:SDWebImageRetryFailed|SDWebImageLowPriority|SDWebImageRefreshCached];
    _titleLeft.text=[NSString stringWithFormat:@"截止时间：%@",dict[@"time"]];
    _titleAmong.text=dict[@"name"];
//    _titleRight.text=dict[@"describe"];
}

-(void)setDataLevel:(NSDictionary *)dict{
    [_imageLeft sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HEAD_URL_IMAGE,dict[@"head_img"]]] placeholderImage:[UIImage imageNamed:@"占位图.png"] options:SDWebImageRetryFailed|SDWebImageLowPriority|SDWebImageRefreshCached];
    _titleLeft.text=dict[@"name"];
    [_buttonLeft setTitle:[NSString stringWithFormat:@"积分：%@",dict[@"integral"]] forState:0];
}

-(void)setDataMyGroup:(NSDictionary *)dict{
    [_buttonLeft sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HEAD_URL_IMAGE,dict[@"gr_img"]]] forState:0 placeholderImage:[UIImage imageNamed:@"占位图.png"] options:SDWebImageRetryFailed|SDWebImageLowPriority|SDWebImageRefreshCached];
    _titleLeft.text=dict[@"name"];
}

-(void)setDataDNE:(NSDictionary *)dict{
    if ([[UserInfoStore shareStore].userDict[@"rank"] intValue]>=[dict[@"rank"] intValue]) {
        _imageLeft.hidden=YES;
    }else{
        _imageLeft.hidden=NO;
    }
    [_buttonLeft sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",HEAD_URL_IMAGE,dict[@"da_img"]]] forState:0 placeholderImage:[UIImage imageNamed:@"占位图.png"] options:SDWebImageRetryFailed|SDWebImageLowPriority|SDWebImageRefreshCached];
    _titleLeft.text=dict[@"title"];
    _titleRight.text=dict[@"content"];
    [_titleRight sizeToFit];
}

-(void)setTextHeight:(NSString*)text{
    _titleRight.text = text;
    if (![_titleRight.text isEqualToString:@""]) {
        CGRect frame = [self frame];
        [_titleRight setNumberOfLines:0];
        [_titleRight sizeToFit];
        _titleRight.frame=CGRectMake(290*sIZE-_titleRight.frame.size.width, 15*sIZE, _titleRight.frame.size.width, _titleRight.frame.size.height);
        frame.size.height = _titleRight.bounds.size.height+22*sIZE;
        self.frame = frame;
    }
}

@end
