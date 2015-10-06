//
//  UserInfoStore.h
//  YXTK
//
//  Created by rednow on 15/7/23.
//  Copyright (c) 2015年 ZML. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoStore : NSObject

+ (UserInfoStore *)shareStore;

@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *userPassword;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *headImageString;
@property (nonatomic, strong) NSString *userMark;
@property (nonatomic, strong) NSString *userMoney;

@property (nonatomic, assign) BOOL isAutoLogin;
@property (nonatomic, assign) BOOL isRememberPwd;
@property (nonatomic, assign) BOOL showRefresh;
@property (nonatomic, strong) NSString *titleName;
@property (nonatomic, strong) UIImage *headImage;
@property (nonatomic, strong) NSString *petName;
@property(nonatomic,retain)NSString *phototstr;
@property (nonatomic, strong) NSString *friendUsername;
@property (nonatomic, strong)NSMutableDictionary *userDict;
@property(nonatomic,retain)NSMutableArray *myfriendArr;
@property(nonatomic,retain)NSMutableArray *hezouzhangguan;
@property(weak ,nonatomic)NSTimer *R_timer;


-(NSString *)commentTime:(NSString *)time;
-(NSString *)locationChange:(NSString *)string;

@end
