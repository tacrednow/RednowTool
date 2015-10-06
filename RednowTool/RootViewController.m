//
//  RootViewController.m
//  YXTK
//
//  Created by ZML on 15/6/16.
//  Copyright (c) 2015年 ZML. All rights reserved.
//

#import "RootViewController.h"
#import "MBProgressHUD.h"

@interface RootViewController()

@property(nonatomic)int timerNumber;
@property(nonatomic,strong)REDView *alertView;

@end

@implementation RootViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _R_dataArray=[NSMutableArray new];
        _R_dataDictPage =[NSMutableDictionary new];
        _R_dataDict =[NSMutableDictionary new];
        [_R_dataDictPage setObject:@"1" forKey:@"page"];
        [_R_dataDictPage setObject:@"1" forKey:@"pageTotal"];
        [_R_dataDictPage setObject:@"0" forKey:@"headerRefresh"];
        [_R_dataDictPage setObject:@"0" forKey:@"footerRefresh"];
        self.hidesBottomBarWhenPushed=YES;
        self.edgesForExtendedLayout=UIRectEdgeNone;
        self.R_flag=0;
        self.R_float=0.0;
        _timerNumber=0;
    }
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor=cMyBlack1;
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    [self.navigationItem setBackBarButtonItem:backItem];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
//    self.R_scrollView.alwaysBounceVertical=YES;
//    self.R_scrollView.backgroundColor=cMyGray1;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.R_scrollView.alwaysBounceVertical=YES;
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - RequestData

-(void)requestData:(NSDictionary *)paramars paramarsSite:(NSString *)paramarsSite{
    [BaseRequest requestWithMethodResponseJsonByGet:HEAD_URL paramars:paramars  paramarsSite:paramarsSite sucessBlock:^(id content) {
        [self hideProgressView];
        self.R_dataDictPage[@"headerRefresh"]=@"0";
        self.R_dataDictPage[@"footerRefresh"]=@"0";
        [self.R_tableView.header endRefreshing];
        [self.R_tableView.footer endRefreshing];
        self.R_timer.fireDate=[NSDate distantFuture];
        NSLog(@"content:%@",content);
        NSLog(@"paramars:%@",paramars);
        [_R_dataDictPage setObject:content forKey:@"allData"];
        [_R_dataDictPage setObject:content[@"page"] forKey:@"pageTotal"];
        if (![content[@"list"] isEqual:[NSNull null]]) {
            if (_R_tableView && [_R_dataDictPage[@"page"] intValue]==1) {
                _R_dataArray=[NSMutableArray new];
                [_R_dataArray addObjectsFromArray:content[@"list"]];
                [_R_tableView reloadData];
            }else if (_R_tableView && [_R_dataDictPage[@"page"] intValue]>1 && self.R_flag==1){
                [_R_dataArray addObjectsFromArray:content[@"list"]];
                [_R_tableView reloadData];
            }else if (!_R_tableView && [_R_dataDictPage[@"page"] intValue]==1){
                _R_dataArray=[NSMutableArray new];
                [_R_dataArray addObjectsFromArray:content[@"list"]];
                [self initUI];
            }
        }
    } failure:^(NSError *error) {
        [self hideProgressView];
        [self.R_tableView.header endRefreshing];
        [self.R_tableView.footer endRefreshing];
        [self showToastViewWithTitle:@"网络错误"];
    }];
}

-(void)requestDatainDictionary:(NSDictionary *)paramars paramarsSite:(NSString *)paramarsSite{
    [BaseRequest requestWithMethodResponseStringResult:HEAD_URL paramars:paramars  paramarsSite:paramarsSite sucessBlock:^(id content) {
        [self hideProgressView];
        id jsonObj = [NSJSONSerialization JSONObjectWithData:content options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"content:%@",jsonObj);
        NSLog(@"paramars:%@",paramars);
        _R_dataDict =jsonObj;
        if (_R_tableView) {
            [_R_tableView reloadData];
        }else{
            [self initUI];
        }
    } failure:^(NSError *error) {
        [self hideProgressView];
        [self showToastViewWithTitle:@"网络错误"];
    }];
}

-(void)requestDataForOther:(NSDictionary *)paramars paramarsSite:(NSString *)paramarsSite getParamars:(NSString *)getParamars{
    [BaseRequest requestWithMethodResponseJsonByGet:HEAD_URL paramars:paramars  paramarsSite:paramarsSite sucessBlock:^(id content) {
        [self hideProgressView];
        self.R_dataDictPage[@"headerRefresh"]=@"0";
        self.R_dataDictPage[@"footerRefresh"]=@"0";
        [self.R_tableView.header endRefreshing];
        [self.R_tableView.footer endRefreshing];
        self.R_timer.fireDate=[NSDate distantFuture];
        NSLog(@"content:%@",content);
        NSLog(@"paramars:%@",paramars);
        [_R_dataDictPage setObject:content forKey:@"allData"];
        [_R_dataDictPage setObject:content[@"page"] forKey:@"pageTotal"];
        if (![content[@"list"] isEqual:[NSNull null]]) {
            if (_R_tableView && [_R_dataDictPage[@"page"] intValue]==1) {
                _R_dataArray=[NSMutableArray new];
                [_R_dataArray addObjectsFromArray:content[getParamars]];
                [_R_tableView reloadData];
            }else if (_R_tableView && [_R_dataDictPage[@"page"] intValue]>1 && self.R_flag==1){
                [_R_dataArray addObjectsFromArray:content[getParamars]];
                [_R_tableView reloadData];
            }else if (!_R_tableView && [_R_dataDictPage[@"page"] intValue]==1){
                _R_dataArray=[NSMutableArray new];
                [_R_dataArray addObjectsFromArray:content[getParamars]];
                [self initUI];
            }
        }
    } failure:^(NSError *error) {
        [self hideProgressView];
        [self.R_tableView.header endRefreshing];
        [self.R_tableView.footer endRefreshing];
        [self showToastViewWithTitle:@"网络错误"];
    }];
}

-(void)requestData{
    if (!self.R_tableView && !self.R_scrollView) {
        [self showProgressView];
    }
}

-(void)requestDatanoPage:(NSDictionary *)paramars paramarsSite:(NSString *)paramarsSite{
    [BaseRequest requestWithMethodResponseJsonByGet:HEAD_URL paramars:paramars  paramarsSite:paramarsSite sucessBlock:^(id content) {
        [self hideProgressView];
        NSLog(@"content:%@",content);
        NSLog(@"paramars:%@",paramars);
        _R_dataArray=[NSMutableArray new];
        [_R_dataArray addObjectsFromArray:content[@"list"]];
        if (_R_tableView) {
            [_R_tableView reloadData];
        }else{
            [self initUI];
        }
    } failure:^(NSError *error) {
        [self hideProgressView];
        [self showToastViewWithTitle:@"网络错误"];
    }];
}

-(void)submitDataForImage:(NSDictionary *)paramars paramarsSite:(NSString *)paramarsSite fileDict:(NSMutableDictionary *)fileDict{
    UIProgressView *progressView=[[UIProgressView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, 3*sIZE)];
    progressView.progressTintColor=cMyGreen;
    [self.view addSubview:progressView];
    [BaseRequest requestWithMethodForFile:HEAD_URL paramars:paramars paramarsSite:paramarsSite fileDict:fileDict withProgress:progressView successBlock:^(id content) {
        [self hideProgressView];
        id jsonObj = [NSJSONSerialization JSONObjectWithData:content options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"jsonObj:%@",jsonObj);
        NSLog(@"paramars:%@",paramars);
        _R_dataDict =content;
        [self.R_tableView reloadData];
    } failure:^(NSError *error) {
        [self hideProgressView];
        [self showToastViewWithTitle:@"网络错误"];
    }];
}

-(void)requestDataforSmallRequest:(NSDictionary *)paramars paramarsSite:(NSString *)paramarsSite alert:(NSString *)alert{
    [BaseRequest requestWithMethodResponseStringResult:HEAD_URL paramars:paramars paramarsSite:paramarsSite sucessBlock:^(id content) {
        [self hideProgressView];
        id jsonObj = [NSJSONSerialization JSONObjectWithData:content options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"content:%@",jsonObj);
        NSLog(@"paramars:%@",paramars);
        if (alert) {
            [self showToastViewWithTitle:alert];
        }
    } failure:^(NSError *error) {
        [self hideProgressView];
        [self showToastViewWithTitle:@"网络错误"];
    }];
}

-(void)requestDataforSmallRequestPopView:(NSDictionary *)paramars paramarsSite:(NSString *)paramarsSite alert:(NSString *)alert{
    [BaseRequest requestWithMethodResponseStringResult:HEAD_URL paramars:paramars paramarsSite:paramarsSite sucessBlock:^(id content) {
        [self hideProgressView];
        id jsonObj = [NSJSONSerialization JSONObjectWithData:content options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"content:%@",jsonObj);
        NSLog(@"paramars:%@",paramars);
        if (alert) {
            [self showToastViewWithTitle:alert];
        }
        [self.navigationController popViewControllerAnimated:YES];
    } failure:^(NSError *error) {
        [self hideProgressView];
        [self showToastViewWithTitle:@"网络错误"];
    }];
}

-(void)submitData:(NSDictionary *)paramars paramarsSite:(NSString *)paramarsSite fileDict:(NSMutableDictionary *)fileDict{
    UIProgressView *progressView=[[UIProgressView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, 3*sIZE)];
    progressView.progressTintColor=cMyGreen;
    [self.view addSubview:progressView];
    [BaseRequest requestWithMethodForFile:HEAD_URL paramars:paramars paramarsSite:paramarsSite fileDict:fileDict withProgress:progressView successBlock:^(id content) {
        [self hideProgressView];
        id jsonObj = [NSJSONSerialization JSONObjectWithData:content options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"jsonObj:%@",jsonObj);
        NSLog(@"paramars:%@",paramars);
        [[UserInfoStore shareStore] setShowRefresh:YES];
        [self showToastViewWithTitle:@"上传完成"];
        [self.navigationController popViewControllerAnimated:YES];
    } failure:^(NSError *error) {
        [self hideProgressView];
        [self showToastViewWithTitle:@"网络错误"];
    }];
}

-(void)submitDataForAudio:(NSDictionary *)paramars paramarsSite:(NSString *)paramarsSite fileDict:(NSMutableDictionary *)fileDict{
    UIProgressView *progressView=[[UIProgressView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, 3*sIZE)];
    progressView.progressTintColor=cMyGreen;
    [self.view addSubview:progressView];
    [BaseRequest requestWithMethodForAudio:HEAD_URL paramars:paramars paramarsSite:paramarsSite fileDict:fileDict withProgress:progressView successBlock:^(id content) {
        [self hideProgressView];
        id jsonObj = [NSJSONSerialization JSONObjectWithData:content options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"jsonObj:%@",jsonObj);
        NSLog(@"paramars:%@",paramars);
        [[UserInfoStore shareStore] setShowRefresh:YES];
        [self showToastViewWithTitle:@"上传完成"];
        [self.navigationController popToRootViewControllerAnimated:YES];
    } failure:^(NSError *error) {
        [self hideProgressView];
        [self showToastViewWithTitle:@"网络错误"];
    }];
}

#pragma mark - initUI

-(void)initUI{
//    if (self.R_dataArray.count==0) {
//        REDView *view=[[REDView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_Width, SCREEN_Width) color:[UIColor clearColor] text:@"这里没有内容"];
//        [self.view addSubview:view];
//        return;
//    }
}

- (void)getNavigationBar:(NSString *)leftTitle rightItem:(NSString *)rightTitle{
    if (leftTitle) {
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithTitle:leftTitle style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonPressed:)];
        [self.navigationItem setLeftBarButtonItem:leftItem];
    }
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:rightTitle style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonPressed:)];
    [self.navigationItem setRightBarButtonItem:rightItem];
}

- (void)getNavigationBarWithImage:(NSString *)leftImage rightItem:(NSString *)rightImage{
    if (leftImage) {
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:leftImage] style:UIBarButtonItemStyleDone target:self action:@selector(leftBarButtonPressed:)];
        leftItem.imageInsets=UIEdgeInsetsMake(10, 0, 10, 5);
        [self.navigationItem setLeftBarButtonItem:leftItem];
    }
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:rightImage]  style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonPressed:)];
    rightItem.imageInsets=UIEdgeInsetsMake(10, 15, 10, 2);
    [self.navigationItem setRightBarButtonItem:rightItem];
}

-(void)R_tableViewaddFreshing{
    self.R_tableView.header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefreshing)];
    if (self.R_dataArray.count>10) {
        self.R_tableView.footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefreshing)];
    }
}

#pragma mark - ButtonAction

-(void)leftBarButtonPressed:(UIBarButtonItem *)sender{
    
}

-(void)rightBarButtonPressed:(UIBarButtonItem *)sender{
    
}

- (void)headerRefreshing{
    [self.R_dataDictPage setObject:@"1" forKey:@"page"];
    [self requestData];
    _timerNumber=0;
    self.R_dataDictPage[@"headerRefresh"]=@"1";
    self.R_timer.fireDate=[NSDate distantPast];
}

-(void)footerRefreshing{
    if (!([self.R_dataDictPage[@"page"]intValue]==[self.R_dataDictPage[@"pageTotal"]intValue])) {
        self.R_flag=1;
        int a=[self.R_dataDictPage[@"page"] intValue]+1;
        NSString *b=[NSString stringWithFormat:@"%d",a];
        [self.R_dataDictPage setObject:b forKey:@"page"];
        [self requestData];
        _timerNumber=0;
        self.R_dataDictPage[@"footerRefresh"]=@"1";
        self.R_timer.fireDate=[NSDate distantPast];
    }else{
        [self.R_tableView.footer endRefreshing];
    }
}

-(void)removeAlertView{
    [_alertView removeFromSuperview];
    _alertView=nil;
}

#pragma mark - tableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (self.R_dataArray.count<=10) {
        return 0.5;
    }else{
        return 0;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    REDView *view=[[REDView alloc]initWithFrame:REDRect(0, 0, 320, 0.1) color:cMyBlack];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier=@"rooCellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Alert Method

- (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelTitle{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelTitle otherButtonTitles:nil];
    [alertView show];
}

- (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelTitle otherButtonTitle:(NSString *)otherTitle{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:cancelTitle otherButtonTitles:otherTitle, nil];
    alertView.delegate=self;
    [alertView show];
}

- (void)showProgressView {
    [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
    [MBProgressHUD showHUDAddedTo:self.view animated:NO];
}

- (void)hideProgressView {
    [MBProgressHUD hideAllHUDsForView:self.view animated:NO];
}

- (void)showToastViewWithTitle:(NSString *)title {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.animationType = MBProgressHUDAnimationZoom;
    hud.labelText = title;
    hud.margin = 10.f;
    hud.yOffset=10.0f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:1.5];
}

-(void)showAlertView:(NSString *)title{
    _alertView=[[REDView alloc]initWithFrame:self.view.frame color:cMyBlack10];
    [self.view addSubview:_alertView];
    
    REDButton *button=[[REDButton alloc]initWithFrameBJ:REDRect(0, 200, 320, 160) image:IMAGE(@"提示框.png") tag:0];
    [_alertView addSubview:button];
    
    REDLabel *label=[[REDLabel alloc]initWithFrameBT:REDRect(90, 240, 140, 30) Content:title textColor:cMyWhite2];
    label.textAlignment=NSTextAlignmentCenter;
    [_alertView addSubview:label];
    
    REDButton *confirm=[[REDButton alloc]initWithFrameBJ:REDRect(115, 300, 90, 25) image:IMAGE(@"Nextstep.png") tag:0];
    [confirm addTarget:self action:@selector(removeAlertView) forControlEvents:UIControlEventTouchUpInside];
    [_alertView addSubview:confirm];
    
}

#pragma mark - Tool Method

-(NSTimer *)R_timer{
    if (!_R_timer) {
        _R_timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(stopDownload) userInfo:nil repeats:true];
    }
    return _R_timer;
}

-(void)stopDownload{
    _timerNumber=_timerNumber+1;
    if ([self.R_dataDictPage[@"headerRefresh"] isEqualToString:@"1"] || [self.R_dataDictPage[@"footerRefresh"] isEqualToString:@"1"]) {
        if (_timerNumber==20) {
            [self.R_tableView.header endRefreshing];
            [self.R_tableView.footer endRefreshing];
            [self showToastViewWithTitle:@"你的网络好像出错了"];
            self.R_timer.fireDate=[NSDate distantFuture];
            self.R_dataArray=[NSMutableArray new];
            [self.R_tableView reloadData];
        }
    }
}

@end
