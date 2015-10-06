//
//  REDTextField.m
//  ANE
//
//  Created by rednow on 15/9/8.
//  Copyright (c) 2015年 binghe168. All rights reserved.
//

#import "REDTextField.h"

@implementation REDTextField

//普通
- (instancetype)initWithFrame:(CGRect)frame placeholder:(NSString *)placeholder
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clearsOnBeginEditing=YES;
        self.font=[UIFont systemFontOfSize:smallContentFont];
        self.borderStyle=UITextBorderStyleNone;
        self.textColor=cMyGray1;
        self.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder attributes:@{NSForegroundColorAttributeName:cMyGray4}];
    }
    return self;
}

@end
