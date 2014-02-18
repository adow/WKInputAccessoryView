//
//  WKInputAccessoryInsertStringViewController.h
//  WKInputAccessoryView
//
//  Created by 秦 道平 on 14-2-17.
//  Copyright (c) 2014年 秦 道平. All rights reserved.
//

#import <UIKit/UIKit.h>
#define WKINPUTACCESSORYINSERTSTRINGVIEWCONTROLLER_NOTIFICATION_CLOSE_VIEWCONTROLLER @"WKINPUTACCESSORYINSERTSTRINGVIEWCONTROLLER_NOTIFICATION_CLOSE_VIEWCONTROLLER"
@interface WKInputAccessoryInsertStringViewController : UIViewController{
    
}
///正在使用的第几个按钮
@property (nonatomic,assign) int insertStringPosition;
@end
