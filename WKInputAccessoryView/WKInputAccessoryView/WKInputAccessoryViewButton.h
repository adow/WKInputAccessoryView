//
//  WKInputAccessoryViewButton.h
//  WKInputAccessoryView
//
//  Created by 秦 道平 on 14-2-15.
//  Copyright (c) 2014年 秦 道平. All rights reserved.
//

#import <UIKit/UIKit.h>
#define WKINPUTACCESSORYVIEWBUTTON_CURSION_POSITION_ENDOFINSERTPOSITION -1 ///光标在插入字符串的后面
@interface WKInputAccessoryViewButton : UIButton{
    
}
///按下时要插入的字符串
@property (nonatomic,copy) NSString* insertString;
///插入字符串后光标锁在的位置
@property (nonatomic,assign) int cursorPositionInString;
-(instancetype)initWithFrame:(CGRect)frame titleString:(NSString*)titleString insertString:(NSString*)insertString;
@end
