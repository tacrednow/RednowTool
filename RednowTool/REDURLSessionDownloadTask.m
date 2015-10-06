//
//  REDURLSessionDownloadTask.m
//  YXTK
//
//  Created by rednow on 15/8/8.
//  Copyright (c) 2015年 ZML. All rights reserved.
//

#import "REDURLSessionDownloadTask.h"

@interface REDURLSessionDownloadTask()

@property(nonatomic,strong)NSString *fileName;

@end

@implementation REDURLSessionDownloadTask

- (instancetype)initWithURL:(NSString *)downloadURL fileName:(NSString *)fileName
{
    self = [super init];
    if (self) {
        _fileName=fileName;
        NSString *urlStr=[NSString stringWithFormat: @"%@?file=%@",downloadURL ,fileName];
        urlStr =[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL *url=[NSURL URLWithString:urlStr];
        //2.创建请求
        NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
        //3.创建会话
        //默认会话
        NSURLSessionConfiguration *sessionConfig=[NSURLSessionConfiguration defaultSessionConfiguration];
        sessionConfig.timeoutIntervalForRequest=10.0f;//请求超时时间
        sessionConfig.allowsCellularAccess=true;//是否允许蜂窝网络下载（2G/3G/4G）
        //创建会话
        NSURLSession *session=[NSURLSession sessionWithConfiguration:sessionConfig delegate:self delegateQueue:nil];//指定配置和代理
        self=(REDURLSessionDownloadTask *)[session downloadTaskWithRequest:request];
        [self resume];
    }
    return self;
}

#pragma mark 设置界面状态
-(void)setUIStatus:(int64_t)totalBytesWritten expectedToWrite:(int64_t)totalBytesExpectedToWrite{
    dispatch_async(dispatch_get_main_queue(), ^{
//        _progressView.progress=(float)totalBytesWritten/totalBytesExpectedToWrite;
        if (totalBytesWritten==totalBytesExpectedToWrite) {
            _label.text=@"下载完成";
            [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
        }else{
            _label.text=@"正在下载...";
            [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
        }
    });
}

//#pragma mark 文件下载
//-(void)downloadFile{
//    //1.创建url
//    NSString *fileName=_fileName;
//    NSString *urlStr=[NSString stringWithFormat: @"%@?file=%@",_text ,fileName];
//    urlStr =[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSURL *url=[NSURL URLWithString:urlStr];
//    //2.创建请求
//    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
//    
//    //3.创建会话
//    //默认会话
//    NSURLSessionConfiguration *sessionConfig=[NSURLSessionConfiguration defaultSessionConfiguration];
//    sessionConfig.timeoutIntervalForRequest=10.0f;//请求超时时间
//    sessionConfig.allowsCellularAccess=true;//是否允许蜂窝网络下载（2G/3G/4G）
//    //创建会话
//    NSURLSession *session=[NSURLSession sessionWithConfiguration:sessionConfig delegate:self delegateQueue:nil];//指定配置和代理
//    _downloadTask=[session downloadTaskWithRequest:request];
//    
//    [_downloadTask resume];
//}

#pragma mark 取消下载
-(void)cancelDownload{
    [self cancel];
}
#pragma mark 挂起下载
-(void)suspendDownload{
    [self suspend];
}
#pragma mark 恢复下载下载
-(void)resumeDownload{
    [self resume];
}

#pragma mark - 下载任务代理
#pragma mark 下载中(会多次调用，可以记录下载进度)
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    [self setUIStatus:totalBytesWritten expectedToWrite:totalBytesExpectedToWrite];
}

#pragma mark 下载完成
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    NSError *error;
    NSString *cachePath=[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *savePath=[cachePath stringByAppendingPathComponent:_fileName];
    NSLog(@"%@",savePath);
    NSURL *saveUrl=[NSURL fileURLWithPath:savePath];
    [[NSFileManager defaultManager] copyItemAtURL:location toURL:saveUrl error:&error];
    if (error) {
        NSLog(@"Error is:%@",error.localizedDescription);
    }
//    [self requestData];
}

#pragma mark 任务完成，不管是否下载成功
-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error{
    [self setUIStatus:0 expectedToWrite:0];
    if (error) {
        NSLog(@"Error is:%@",error.localizedDescription);
    }
}


@end
