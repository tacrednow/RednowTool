//
//  REDURLSessionDownloadTask.h
//  YXTK
//
//  Created by rednow on 15/8/8.
//  Copyright (c) 2015年 ZML. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface REDURLSessionDownloadTask : NSURLSessionDownloadTask < NSURLSessionDownloadDelegate >

@property(nonatomic,strong)REDLabel *label;

@end
