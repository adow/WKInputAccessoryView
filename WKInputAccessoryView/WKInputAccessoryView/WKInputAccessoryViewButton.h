//
//  WKInputAccessoryViewButton.h
//  WKInputAccessoryView
//
//  Created by 秦 道平 on 14-2-15.
//  Copyright (c) 2014年 秦 道平. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WKInputAccessoryViewInsertStringBundle.h"
#define WKINPUTACCESSORYVIEWBUTTON_CURSION_POSITION_ENDOFINSERTPOSITION -1 ///光标在插入字符串的后面
@class WKInputAccessoryViewButton;
@protocol WKInputAccessoryViewButtonDelegate <NSObject>
///触发按钮时
-(void)touchOnButton:(WKInputAccessoryViewButton*)button;
///长按时
-(void)longPressOnButton:(WKInputAccessoryViewButton*)button;
@end
@interface WKInputAccessoryViewButton : UIButton{
    
}
///符号列表中的第几个元素
@property (nonatomic,assign) int indexOfInsertStringBundle;
@property (nonatomic,retain) WKInputAccessoryViewInsertString *insertString;
@property (nonatomic,assign) id<WKInputAccessoryViewButtonDelegate> delegate;
///指定使用符号列表中的第几个元素
-(instancetype)initWithFrame:(CGRect)frame indexOfInsertStringBundle:(int)index;
///更新按钮
-(void)refreshButtonTitle;
@end
