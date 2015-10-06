//
//  UserInfoStore.m
//  YXTK
//
//  Created by rednow on 15/7/23.
//  Copyright (c) 2015年 ZML. All rights reserved.
//

#import "UserInfoStore.h"

static int timerNumber=0;

@implementation UserInfoStore

+ (UserInfoStore *)shareStore {
    static dispatch_once_t onceToken;
    static UserInfoStore *userInfoStore = nil;
    dispatch_once(&onceToken, ^{
        userInfoStore = [[UserInfoStore alloc]init];
    });
    return userInfoStore;
}

- (instancetype)init {
    if (self = [super init]) {
        
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        
        if (![ud objectForKey:@"isAutoLogin"]) {
            [ud setBool:NO forKey:@"isAutoLogin"];
            _isAutoLogin = NO;
        } else {
            _isAutoLogin = [ud boolForKey:@"isAutoLogin"];
        }
        
        if (![ud objectForKey:@"isRememberPwd"]) {
            [ud setBool:NO forKey:@"isRememberPwd"];
            _isRememberPwd = NO;
        } else {
            _isRememberPwd = [ud boolForKey:@"isRememberPwd"];
        }
        
        if (![ud objectForKey:@"userName"]) {
            [ud setObject:@"" forKey:@"userName"];
            _userName = @"";
        } else {
            _userName = [ud objectForKey:@"userName"];
        }
        
        if (![ud objectForKey:@"userPassword"]) {
            [ud setObject:@"" forKey:@"userPassword"];
            _userPassword = @"";
        } else {
            _userPassword = [ud objectForKey:@"userPassword"];
        }
        
        if (![ud objectForKey:@"userMark"]) {
            [ud setObject:@"" forKey:@"userMark"];
            _userMark = @"";
        } else {
            _userMark = [ud objectForKey:@"userMark"];
        }
        
        if (![ud objectForKey:@"userMoney"]) {
            [ud setObject:@"" forKey:@"userMoney"];
            _userMoney = @"";
        } else {
            _userMoney = [ud objectForKey:@"userMoney"];
        }

        
        if (![ud objectForKey:@"userId"]) {
            [ud setObject:@"" forKey:@"userId"];
            _userId = @"";
        } else {
            _userId = [ud objectForKey:@"userId"];
        }
        
        if (![ud objectForKey:@"headImageString"]) {
            [ud setObject:@"" forKey:@"headImageString"];
            _headImageString = @"";
        } else {
            _headImageString = [ud objectForKey:@"headImageString"];
        }
        
        if (![ud objectForKey:@"showRefresh"]) {
            [ud setBool:NO forKey:@"showRefresh"];
            _showRefresh = NO;
        } else {
            _showRefresh = [ud boolForKey:@"showRefresh"];
        }
        
        if (![ud objectForKey:@"titleName"]) {
            [ud setObject:@"" forKey:@"titleName"];
            _titleName = @"";
        } else {
            _titleName = [ud objectForKey:@"titleName"];
        }
        
        if (![ud objectForKey:@"headImage"]) {
            [ud setObject:@"" forKey:@"headImage"];
            _headImage = [UIImage imageNamed:@"头像14.jpeg"];
        } else {
            _headImage = [ud objectForKey:@"headImage"];
        }
        
        if (![ud objectForKey:@"petName"]) {
            [ud setObject:@"" forKey:@"petName"];
            _petName = @"";
        } else {
            _petName = [ud objectForKey:@"petName"];
        }

        if (![ud objectForKey:@"friendUsername"]) {
            [ud setObject:@"" forKey:@"friendUsername"];
            _friendUsername = @"";
        } else {
            _friendUsername = [ud objectForKey:@"friendUsername"];
        }
        
        if (![ud objectForKey:@"userDict"]) {
            [ud setObject:[NSMutableDictionary new] forKey:@"userDict"];
            _userDict = [NSMutableDictionary new];
        } else {
            _userDict = [ud objectForKey:@"userDict"];
        }
        _myfriendArr=[[NSMutableArray alloc]init];
        _hezouzhangguan=[[NSMutableArray alloc]init];

        [ud synchronize];
        
    }
    return self;
}

- (void)setIsRememberPwd:(BOOL)isRememberPwd {
    _isRememberPwd = isRememberPwd;
    [[NSUserDefaults standardUserDefaults] setBool:_isRememberPwd forKey:@"isRememberPwd"];
}

- (void)setIsAutoLogin:(BOOL)isAutoLogin {
    _isAutoLogin = isAutoLogin;
    [[NSUserDefaults standardUserDefaults] setBool:_isAutoLogin forKey:@"isAutoLogin"];
}

- (void)setUserId:(NSString *)userId {
    _userId = userId;
    [[NSUserDefaults standardUserDefaults] setObject:_userId forKey:@"userId"];
}

- (void)setUserPassword:(NSString *)userPassword {
    _userPassword = userPassword;
    [[NSUserDefaults standardUserDefaults] setObject:_userPassword forKey:@"userPassword"];
}

- (void)setUserName:(NSString *)userName {
    _userName = userName;
    [[NSUserDefaults standardUserDefaults] setObject:_userName forKey:@"userName"];
}

- (void)setUserMark:(NSString *)userMark {
    _userMark = userMark;
    [[NSUserDefaults standardUserDefaults] setObject:_userMark forKey:@"userMark"];
}

- (void)setUserMoney:(NSString *)userMoney {
    _userMoney = userMoney;
    [[NSUserDefaults standardUserDefaults] setObject:_userMoney forKey:@"userMoney"];
}


- (void)setHeadImageString:(NSString *)headImageString {
    _headImageString = headImageString;
    [[NSUserDefaults standardUserDefaults] setObject:_headImageString forKey:@"headImageString"];
}

- (void)setShowRefresh:(BOOL)showRefresh{
    _showRefresh = showRefresh;
    [[NSUserDefaults standardUserDefaults] setBool:_showRefresh forKey:@"showRefresh"];
}

- (void)setTitleName:(NSString *)titleName{
    _titleName = titleName;
    [[NSUserDefaults standardUserDefaults] setObject:_titleName forKey:@"titleName"];
}

- (void)setHeadImage:(UIImage *)headImage{
    _headImage = headImage;
    [[NSUserDefaults standardUserDefaults] setObject:_headImage forKey:@"headImage"];
}

- (void)setPetName:(NSString *)petName{
    _petName = petName;
    [[NSUserDefaults standardUserDefaults] setObject:_petName forKey:@"petName"];
}

- (void)setFriendUsername:(NSString *)friendUsername{
    _friendUsername = friendUsername;
    [[NSUserDefaults standardUserDefaults] setObject:_friendUsername forKey:@"friendUsername"];
}

- (void)setUserDict:(NSMutableDictionary *)userDict{
    _userDict = userDict;
    [[NSUserDefaults standardUserDefaults] setObject:_userDict forKey:@"userDict"];
}


-(NSString *)commentTime:(NSString *)time{
    NSDateFormatter *formatter =[[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *current = [formatter stringFromDate:[NSDate date]];
    NSString *commentTime=@"";
    if ([[current substringWithRange:NSMakeRange(0, 4)] intValue]==[[time substringWithRange:NSMakeRange(0, 4)] intValue]) {
        if ([[current substringWithRange:NSMakeRange(5, 2)] intValue]==[[time substringWithRange:NSMakeRange(5, 2)] intValue]) {
            if ([[current substringWithRange:NSMakeRange(8, 2)] intValue]==[[time substringWithRange:NSMakeRange(8, 2)] intValue]) {
                if ([[current substringWithRange:NSMakeRange(11, 2)] intValue]==[[time substringWithRange:NSMakeRange(11, 2)] intValue]) {
                    if ([[current substringWithRange:NSMakeRange(14, 2)] intValue]==[[time substringWithRange:NSMakeRange(14, 2)] intValue]) {
                        commentTime=@"现在";
                    }else{
                        commentTime=@"刚刚";
                    }
                }else if([[current substringWithRange:NSMakeRange(11, 2)] intValue]==[[time substringWithRange:NSMakeRange(11, 2)] intValue]+1){
                    if ([[current substringWithRange:NSMakeRange(14, 2)] intValue]>=[[time substringWithRange:NSMakeRange(14, 2)] intValue]) {
                        commentTime=@"1小时前";
                    }else{
                        commentTime=@"刚刚";
                    }
                }else if([[current substringWithRange:NSMakeRange(11, 2)] intValue]==[[time substringWithRange:NSMakeRange(11, 2)] intValue]+2){
                    if ([[current substringWithRange:NSMakeRange(14, 2)] intValue]>=[[time substringWithRange:NSMakeRange(14, 2)] intValue]) {
                        commentTime=@"2小时前";
                    }else{
                        commentTime=@"1小时前";
                    }
                }else if([[current substringWithRange:NSMakeRange(11, 2)] intValue]==[[time substringWithRange:NSMakeRange(11, 2)] intValue]+3){
                    if ([[current substringWithRange:NSMakeRange(14, 2)] intValue]>=[[time substringWithRange:NSMakeRange(14, 2)] intValue]) {
                        commentTime=@"3小时前";
                    }else{
                        commentTime=@"2小时前";
                    }
                }else{
                    commentTime=@"今天";
                }
            }else if([[current substringWithRange:NSMakeRange(8, 2)] intValue]==[[time substringWithRange:NSMakeRange(8, 2)] intValue]+1){
                commentTime=@"昨天";
            }else if([[current substringWithRange:NSMakeRange(8, 2)] intValue]==[[time substringWithRange:NSMakeRange(8, 2)] intValue]+2){
                commentTime=@"前天";
            }else{
                commentTime=time;
            }
        }else if([[current substringWithRange:NSMakeRange(5, 2)] intValue]==[[time substringWithRange:NSMakeRange(5, 2)] intValue]+1){
            int cur=[[current substringWithRange:NSMakeRange(5, 2)] intValue];
            if (cur==5||cur==7||cur==8||cur==10||cur==12) {
                if ([[current substringWithRange:NSMakeRange(8, 2)] intValue]+[[time substringWithRange:NSMakeRange(8, 2)] intValue]==31 && [[time substringWithRange:NSMakeRange(8, 2)] intValue]-[[current substringWithRange:NSMakeRange(8, 2)] intValue]==29) {
                    commentTime=@"昨天";
                }else if ([[current substringWithRange:NSMakeRange(8, 2)] intValue]+[[time substringWithRange:NSMakeRange(8, 2)] intValue]==32 && [[time substringWithRange:NSMakeRange(8, 2)] intValue]-[[current substringWithRange:NSMakeRange(8, 2)] intValue]==28){
                    commentTime=@"前天";
                }else{
                    commentTime=time;
                }
            }else if(cur==2||cur==4||cur==6||cur==9||cur==11){
                if ([[current substringWithRange:NSMakeRange(8, 2)] intValue]+[[time substringWithRange:NSMakeRange(8, 2)] intValue]==32 && [[time substringWithRange:NSMakeRange(8, 2)] intValue]-[[current substringWithRange:NSMakeRange(8, 2)] intValue]==30) {
                    commentTime=@"昨天";
                }else if ([[current substringWithRange:NSMakeRange(8, 2)] intValue]+[[time substringWithRange:NSMakeRange(8, 2)] intValue]==31 && [[time substringWithRange:NSMakeRange(8, 2)] intValue]-[[current substringWithRange:NSMakeRange(8, 2)] intValue]==29){
                    commentTime=@"前天";
                }else{
                    commentTime=time;
                }
            }else{
                commentTime=time;
            }
        }
    }else{
        commentTime=time;
    }
    
    return commentTime;
}

-(NSString *)locationChange:(NSString *)string{
    NSString  *newString=string;
    if (newString.length>4) {
        newString=[NSString stringWithFormat:@"%@千米",[newString substringWithRange:NSMakeRange(0, newString.length-4)]];
    }else{
        newString=[NSString stringWithFormat:@"%@米",newString];
    }
    return newString;
}

#pragma mark - Tool Method

-(NSTimer *)R_timer{
    timerNumber=0;
    if (!_R_timer) {
        _R_timer=[NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(stopDownload) userInfo:nil repeats:true];
    }
    return _R_timer;
}

-(void)stopDownload{
    if (timerNumber==12) {
        NSLog(@"stopTask");
        self.R_timer.fireDate=[NSDate distantFuture];
        [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_STOPTASK object:nil];
    }else{
        NSLog(@"flashTask");
        [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_FLASHTASK object:nil];
    }
    timerNumber=timerNumber+1;
}

@end
