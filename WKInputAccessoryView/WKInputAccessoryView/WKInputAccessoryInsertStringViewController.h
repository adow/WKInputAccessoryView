//
//  WKInputAccessoryInsertStringViewController.h
//  WKInputAccessoryView
//
//  Created by 秦 道平 on 14-2-17.
//  Copyright (c) 2014年 秦 道平. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WKInputAccessoryViewInsertStringBundle.h"
#define WKINPUTACCESSORYINSERTSTRINGVIEWCONTROLLER_NOTIFICATION_CLOSE_VIEWCONTROLLER @"WKINPUTACCESSORYINSERTSTRINGVIEWCONTROLLER_NOTIFICATION_CLOSE_VIEWCONTROLLER"
#define WKINPUTACCESSORYINSERTSTRINGVIEWCONTROLLER_NOTIFICATION_INSERTSTRING @"WKINPUTACCESSORYINSERTSTRINGVIEWCONTROLLER_NOTIFICATION_INSERTSTRING"
@interface WKInputAccessoryInsertStringViewController : UIViewController{
    
}
///当前正在使用的按钮的插入字符
@property (nonatomic,retain) WKInputAccessoryViewInsertString* insertString;
@end
