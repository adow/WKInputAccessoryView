//
//  WKInputAccessoryViewInsertString.h
//  WKInputAccessoryView
//
//  Created by 秦 道平 on 14-2-16.
//  Copyright (c) 2014年 秦 道平. All rights reserved.
//

#import <Foundation/Foundation.h>
#define WKINPUTACCESSORYVIEWINSERTSTRING_CURSOR_POSITION_ENDOFINSERTSTRING -1 ///在插入字符串的后面显示光标
#define WKINPUTACCESSORYVIEWINSERTSTRING_KEY_USINGINSERTSTRINGINDEXLIST @"adow.wkinputaccessoryview.usinginsertstringindexlist.2" ///存储的键值
@interface WKInputAccessoryViewInsertString:NSObject{
    
}
///按下时要插入的字符串
@property (nonatomic,copy) NSString* insertString;
///标题文字
@property (nonatomic,copy) NSString* titleString;
///用来搜索
@property (nonatomic,copy) NSString* key;
///插入字符串后光标锁在的位置
@property (nonatomic,assign) int cursorPositionInString;
-(instancetype)initWithInsertString:(NSString*)insertString
                        titleString:(NSString*)titleString
                     cursorPosition:(int)cursorPosition
                                key:(NSString*)key;
+(WKInputAccessoryViewInsertString*)insertString:(NSString*)insertString
                                     titleString:(NSString*)titleString
                                  cursorPosition:(int)cursorPosition
                                             key:(NSString*)key;
///显示默认的光标位置
+(WKInputAccessoryViewInsertString*)insertString:(NSString*)insertString
                                     titleString:(NSString*)titleString
                                             key:(NSString*)key;

@end
@interface WKInputAccessoryViewInsertStringBundle : NSObject{
    ///全部可用的插入符号
    NSMutableArray* _allStringList;
    NSMutableArray* _visibleStringList;
}
+(WKInputAccessoryViewInsertStringBundle*)sharedInsertStringBundle;
///正在使用的字符串
@property (nonatomic,readonly) NSArray* visibleStringList;
///可以用来替换的字符串
@property (nonatomic,readonly) NSArray* invisibleStringList;
@property (nonatomic,readonly) NSArray* allStringList;
#pragma mark - action
///写入
-(void)write;
///读取
-(void)read;
///根据key去的符号
-(WKInputAccessoryViewInsertString*)insertStringForKey:(NSString*)key;
-(void)replaceStringInVisible:(WKInputAccessoryViewInsertString*)stringInVisible
        withStringInInvisible:(WKInputAccessoryViewInsertString*)stringInInvisible;
@end
