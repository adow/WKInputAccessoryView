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
///符号列表中的第几个元素
@property (nonatomic,assign) int indexOfInsertStringBundle;
///指定使用符号列表中的第几个元素
-(instancetype)initWithFrame:(CGRect)frame indexOfInsertStringBundle:(int)index;
@end
