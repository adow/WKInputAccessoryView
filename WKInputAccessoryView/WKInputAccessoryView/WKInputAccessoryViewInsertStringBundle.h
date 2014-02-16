//
//  WKInputAccessoryViewInsertString.h
//  WKInputAccessoryView
//
//  Created by 秦 道平 on 14-2-16.
//  Copyright (c) 2014年 秦 道平. All rights reserved.
//

#import <Foundation/Foundation.h>
#define WKINPUTACCESSORYVIEWINSERTSTRING_CURSOR_POSITION_ENDOFINSERTSTRING -1 ///在插入字符串的后面显示光标
#define WKINPUTACCESSORYVIEWINSERTSTRING_KEY_USINGINSERTSTRINGINDEXLIST @"adow.wkinputaccessoryview.usinginsertstringindexlist" ///存储的键值
@interface WKInputAccessoryViewInsertString:NSObject{
    
}
///按下时要插入的字符串
@property (nonatomic,copy) NSString* insertString;
///标题文字
@property (nonatomic,copy) NSString* titleString;
///插入字符串后光标锁在的位置
@property (nonatomic,assign) int cursorPositionInString;
-(instancetype)initWithInsertString:(NSString*)insertString titleString:(NSString*)titleString cursorPosition:(int)cursorPosition;
+(WKInputAccessoryViewInsertString*)insertString:(NSString*)insertString titleString:(NSString*)titleString cursorPosition:(int)cursorPosition;
///显示默认的光标位置
+(WKInputAccessoryViewInsertString*)insertString:(NSString*)insertString titleString:(NSString*)titleString;
@end
@interface WKInputAccessoryViewInsertStringBundle : NSObject{
    ///全部可用的插入符号
    NSMutableArray* _allInserStringList;
}
+(WKInputAccessoryViewInsertStringBundle*)sharedInsertStringBundle;
///正在使用的符号的位置
@property (nonatomic,retain) NSMutableArray* usingInsertStringIndexList;
#pragma mark - action
///写入
-(void)write;
///读取
-(void)read;
///设置指定位置按钮使用第几个符号
-(void)setInsertStringIndex:(int)index atPosition:(int)position;
///获取指定位置使用哪个符号
-(WKInputAccessoryViewInsertString*)insertStringAtPosition:(int)position;
///可供选择更换的符号列表
-(NSArray*)insertStringListForSelection;
@end
