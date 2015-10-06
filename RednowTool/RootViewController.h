//
//  RootViewController.h
//  YXTK
//
//  Created by ZML on 15/6/16.
//  Copyright (c) 2015年 ZML. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate, UIActionSheetDelegate>

@property(nonatomic,strong)NSMutableArray *R_dataArray;
@property(nonatomic,strong)NSMutableDictionary *R_dataDict;
@property(nonatomic,strong)NSMutableDictionary *R_dataDictPage;
@property(nonatomic,strong)NSMutableDictionary *R_dataDictData;
@property(nonatomic,strong)NSString *R_ID;
@property(nonatomic,strong)NSString *R_Info;
@property(nonatomic,weak)UIViewController *parent;
@property(nonatomic,strong)UITableView *R_tableView;
@property(nonatomic,strong)UIScrollView *R_scrollView;
@property(nonatomic)int R_flag;
@property(nonatomic)int R_type;
@property(nonatomic)float R_float;
@property(weak ,nonatomic)NSTimer *R_timer;

#pragma mark - RequestData

-(void)requestData:(NSDictionary *)paramars paramarsSite:(NSString *)paramarsSite;
-(void)requestDataForOther:(NSDictionary *)paramars paramarsSite:(NSString *)paramarsSite getParamars:(NSString *)getParamars;
-(void)requestData;
-(void)requestDatanoPage:(NSDictionary *)paramars paramarsSite:(NSString *)paramarsSite;
-(void)requestDatainDictionary:(NSDictionary *)paramars paramarsSite:(NSString *)paramarsSite;
-(void)submitDataForImage:(NSDictionary *)paramars paramarsSite:(NSString *)paramarsSite fileDict:(NSMutableDictionary *)fileDict;
-(void)requestDataforSmallRequest:(NSDictionary *)paramars paramarsSite:(NSString *)paramarsSite alert:(NSString *)alert;
-(void)requestDataforSmallRequestPopView:(NSDictionary *)paramars paramarsSite:(NSString *)paramarsSite alert:(NSString *)alert;
-(void)submitData:(NSDictionary *)paramars paramarsSite:(NSString *)paramarsSite fileDict:(NSMutableDictionary *)fileDict;
-(void)submitDataForAudio:(NSDictionary *)paramars paramarsSite:(NSString *)paramarsSite fileDict:(NSMutableDictionary *)fileDict;

#pragma mark - initUI

-(void)initUI;
-(void)getNavigationBar:(NSString *)leftTitle rightItem:(NSString *)rightTitle;
- (void)getNavigationBarWithImage:(NSString *)leftImage rightItem:(NSString *)rightImage;
-(void)R_tableViewaddFreshing;

#pragma mark - ButtonAction

-(void)leftBarButtonPressed:(UIBarButtonItem *)sender;
-(void)rightBarButtonPressed:(UIBarButtonItem *)sender;
-(void)headerRefreshing;
-(void)footerRefreshing;

#pragma mark - Alert Method

- (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelTitle;
- (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelTitle otherButtonTitle:(NSString *)otherTitle;
-(void)showAlertView:(NSString *)title;
- (void)showProgressView;
- (void)hideProgressView;
- (void)showToastViewWithTitle:(NSString *)title;

@end
