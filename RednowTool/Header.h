//
//  Header.h
//  YXTK
//
//  Created by ZML on 15/6/8.
//  Copyright (c) 2015年 ZML. All rights reserved.
//

#ifndef YXTK_Header_h
#define YXTK_Header_h



/*
 * Size
 */

#define sIZE [UIScreen mainScreen].bounds.size.width/320
#define SCREEN_Width [UIScreen mainScreen].bounds.size.width
#define SCREEN_Height [UIScreen mainScreen].bounds.size.height
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define MYGRAYCOLOR [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1]
#define IMAGE(_NAME) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForAuxiliaryExecutable:_NAME]]
#define Nav_Height 64
#define Bar_Height 48
#define NAVandBAR_Height 112
#define sizeofRadius 3*[UIScreen mainScreen].bounds.size.width/320
#define REDRect(x, y, Width, Height) CGRectMake((x)*([UIScreen mainScreen].bounds.size.width/320), (y)*([UIScreen mainScreen].bounds.size.width/320), (Width)*([UIScreen mainScreen].bounds.size.width/320), (Height)*([UIScreen mainScreen].bounds.size.width/320))


/*
 * Constant
 */

#define kCHANGEROOTVIEWCONTROLLER @"kCHANGEROOTVIEWCONTROLLER"


/*
 * HEAD_URL
 */

//#define HEAD_URL @"http://192.168.0.67/ane/index.php/Index"
#define HEAD_URL @"http://120.24.244.98/ane/index.php/Index"
//#define HEAD_URL_IMAGE @"http://192.168.0.67/ane/"
#define HEAD_URL_IMAGE @"http://120.24.244.98/ane/"


/*
 * TAIL_URL
 */

#define tUsercode                    @"/User/code"
#define tUserRegister                @"/User/Register"
#define tUserLogin                   @"/User/Login"
#define tUserUserDetail              @"/User/UserDetail"
#define tUserGetProvince             @"/User/GetProvince"
#define tUserGetCity                 @"/User/GetCity"
#define tUserGetArea                 @"/User/GetArea"
#define tUserEditUser                @"/User/EditUser"
#define tUserEditPwd                 @"/User/EditPwd"
#define tUserMyMessage               @"/User/MyMessage"
#define tUserMessageDetail           @"/User/MessageDetail"
#define tUserMyGroup                 @"/User/MyGroup"
#define tUserGroupAssignment         @"/User/GroupAssignment"
#define tUserMyPreferential          @"/User/MyPreferential"
#define tUserHonour                  @"/User/Honour"

#define tActionIndex                 @"/Action/Index"
#define tActionAssignmentList        @"/Action/AssignmentList"
#define tActionAssignmentDetail      @"/Action/AssignmentDetail"
#define tActionReceiveAssignment     @"/Action/ReceiveAssignment"
#define tActionDatum                 @"/Action/Datum"
#define tActionDatumDetail           @"/Action/DatumDetail"
#define tActionExchangeGoods         @"/Action/ExchangeGoods"
#define tActionAssignmentFinish      @"/Action/AssignmentFinish"
#define tActionSavePoint             @"/Action/SavePoint"
#define tActionInvite                @"/Action/Invite"
#define tActionRejectInvite          @"/Action/RejectInvite"
#define tActionConsentInvite         @"/Action/ConsentInvite"
#define tActionReturnCode            @"/Action/ReturnCode"
#define tActionDelInvite             @"/Action/DelInvite"

/*
 * type
 */

//秀
#define typeStar             @"1"
#define typeFriend           @"2"
#define typeView             @"3"
#define typeLocation         @"4"

//我
#define typeVideo            @"1"
#define typeAudio            @"2"
#define typePicture          @"3"


/*
 * UserInfo
 */

#define uUserId           [UserInfoStore shareStore].userId
//#define uUserId             @"1"


/*
 * COLOR
 */

#define cMyWhite            [UIColor whiteColor]
#define cMyWhite1           [UIColor colorWithRed:0.91 green:0.91 blue:0.92 alpha:1]
#define cMyWhite2           [UIColor colorWithRed:0.75 green:0.75 blue:0.75 alpha:1]
#define cMyWhite3           [UIColor colorWithRed:0.47 green:0.51 blue:0.56 alpha:1]
#define cMyWhite10          [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:0.8]
#define cBackgroundGray     [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1]
#define cMyBlack            [UIColor blackColor]
#define cMyBlack1           [UIColor colorWithRed:0.23 green:0.26 blue:0.29 alpha:1]
#define cMyBlack2           [UIColor colorWithRed:0.19 green:0.20 blue:0.23 alpha:1]
#define cMyBlack10          [UIColor colorWithRed:0.18 green:0.18 blue:0.18 alpha:0.9]
#define cMyBlack11          [UIColor colorWithRed:0.23 green:0.25 blue:0.28 alpha:0.5]
#define cMyBlue             [UIColor colorWithRed:0.18 green:0.61 blue:0.83 alpha:1]
#define cMyBlue1            [UIColor colorWithRed:0.23 green:0.57 blue:0.97 alpha:1]
#define cMyBlue2            [UIColor colorWithRed:0.14 green:0.19 blue:0.22 alpha:1]
#define cMyGray             [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1]
#define cMyGray1            [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1]
#define cMyGray2            [UIColor colorWithRed:0.97 green:0.97 blue:0.97 alpha:1]
#define cMyGray3            [UIColor colorWithRed:0.39 green:0.39 blue:0.39 alpha:1]
#define cMyGray4            [UIColor colorWithRed:0.25 green:0.28 blue:0.3 alpha:1]
#define cMyGray10           [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.7]
#define cMyGreen            [UIColor colorWithRed:0.27 green:0.78 blue:0.76 alpha:1]
#define cMyGreen1           [UIColor colorWithRed:0.09 green:0.32 blue:0.26 alpha:1]
#define cMyBorderColor      [UIColor colorWithRed:0.87 green:0.88 blue:0.76 alpha:0.3].CGColor
#define cMyPink             [UIColor colorWithRed:0.88 green:0.56 blue:0.66 alpha:1]
#define cMyRed              [UIColor colorWithRed:0.95 green:0.45 blue:0.48 alpha:1]
#define cMyRed1             [UIColor colorWithRed:1 green:0.91 blue:0.91 alpha:1]
#define cMyYellow           [UIColor colorWithRed:1 green:0.97 blue:0.33 alpha:1]

/*
 * FontSize
 */

//#define biggerTitleFont     22*[UIScreen mainScreen].bounds.size.width/320
//#define bigTitleFont        20*[UIScreen mainScreen].bounds.size.width/320
//#define titleFont           18*[UIScreen mainScreen].bounds.size.width/320
//#define contentFont         16*[UIScreen mainScreen].bounds.size.width/320
//#define smallContentFont    14*[UIScreen mainScreen].bounds.size.width/320
//#define smallerContentFont  12*[UIScreen mainScreen].bounds.size.width/320

#define biggerTitleFont     22
#define bigTitleFont        20
#define titleFont           18
#define contentFont         16
#define smallContentFont    14
#define smallerContentFont  12

/*
 * PageName
 */
#define nShow          @"秀"
#define nComment       @"评论列表"
#define nMyHomePage    @"个人主页"


/*
 * Notice
 */
#define KNOTIFICATION_LOGINCHANGE     @"loginStateChange"
#define KNOTIFICATION_NEWMESSAGE      @"newmessage"
#define KNOTIFICATION_TASKDETAIL      @"taskDetail"
#define KNOTIFICATION_FLASHTASK       @"flashTask"
#define KNOTIFICATION_STOPTASK        @"stopTask"


/*
 * Replace_Simple
 */

#define CH_COLOR_image(_imageName) [UIColor colorWithPatternImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForAuxiliaryExecutable:_imageName]]]
#define CH_IMAGE(_name) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForAuxiliaryExecutable:_name]]
#define CH_COLOR_normal(_R,_G,_B) [UIColor colorWithRed:_R / 255.0f green:_G / 255.0f blue:_B / 255.0f alpha:1]
#define CH_COLOR_alpha(_R,_G,_B,_A) [UIColor colorWithRed:_R / 255.0f green:_G / 255.0f blue:_B / 255.0f alpha:_A]
#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#define CHATVIEWBACKGROUNDCOLOR [UIColor colorWithRed:0.936 green:0.932 blue:0.907 alpha:1]

#endif
