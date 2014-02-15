//
//  WKInputAccessoryViewButton.h
//  WKInputAccessoryView
//
//  Created by 秦 道平 on 14-2-15.
//  Copyright (c) 2014年 秦 道平. All rights reserved.
//

#import <UIKit/UIKit.h>
///插入字符串后的光标所在位置
typedef enum WKInputAccessoryViewButtonCursorPositionInString:NSUInteger{
    ///插入字符串开始的位置
    WKInputAccessoryViewButtonCursorPositionInStringStartOfString=0,
    ///插入字符串的第一个字符后面
    WKInputAccessoryViewButtonCursorPositionInStringNextOfStartOfString=1,
    ///插入字符串的中间位置
    WKInputAccessoryViewButtonCursorPositionInStringMiddleOfString=2,
    ///插入字符串的最后一个字符的后面
    WKInputAccessoryViewButtonCursorPositionInStringNextOfEndOfString=3,
    ///整个TextView的全部字符串后面
    WKInputAccessoryViewButtonCursorPositionInStringNextEndOfTextView=4,
} WKInputAccessoryViewButtonCursorPositionInString;
@interface WKInputAccessoryViewButton : UIButton{
    
}
///按下时要插入的字符串
@property (nonatomic,copy) NSString* insertString;
///插入字符串后光标锁在的位置
@property (nonatomic,assign) int cursorPositionInString;
@end
