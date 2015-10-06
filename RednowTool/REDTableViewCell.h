//
//  REDTableViewCell.h
//  ANE
//
//  Created by rednow on 15/9/9.
//  Copyright (c) 2015年 binghe168. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface REDTableViewCell : UITableViewCell

@property(nonatomic,strong)REDImageView *imageLeft;
@property(nonatomic,strong)REDImageView *imageAmong;
@property(nonatomic,strong)REDImageView *imageRight;
@property(nonatomic,strong)REDImageView *imageOther;

@property(nonatomic,strong)REDLabel *titleLeft;
@property(nonatomic,strong)REDLabel *titleAmong;
@property(nonatomic,strong)REDLabel *titleRight;

@property(nonatomic,strong)REDLabel *contentLeft;
@property(nonatomic,strong)REDLabel *contentAmong;
@property(nonatomic,strong)REDLabel *contentRight;

@property(nonatomic,strong)REDButton *buttonLeft;
@property(nonatomic,strong)REDButton *buttonAmong;
@property(nonatomic,strong)REDButton *buttonRight;

@property(nonatomic,strong)REDView *viewLeft;
@property(nonatomic,strong)REDView *viewAmong;
@property(nonatomic,strong)REDView *viewRight;

-(instancetype)initWithStyleCL:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
-(instancetype)initWithStyleSY:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
-(instancetype)initWithStyleMYHead:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
-(instancetype)initWithStyleMY:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
-(instancetype)initWithStyleMyTask:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
-(instancetype)initWithStyleXX:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
-(instancetype)initWithStyleMyReward:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
-(instancetype)initWithStyleLevel:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
-(instancetype)initWithStyleMyGroup:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
-(instancetype)initWithStyleDNE:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

-(void)setDataSY:(NSDictionary *)dict;
-(void)setDataXX:(NSDictionary *)dict;
-(void)setDataMyTask:(NSDictionary *)dict;
-(void)setDataMyReward:(NSDictionary *)dict;
-(void)setDataLevel:(NSDictionary *)dict;
-(void)setDataDNE:(NSDictionary *)dict;
-(void)setTextHeight:(NSString*)text;
-(void)setDataMyGroup:(NSDictionary *)dict;

@end
