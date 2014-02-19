//
//  WKInputAccessoryView.h
//  WKInputAccessoryView
//
//  Created by 秦 道平 on 14-2-15.
//  Copyright (c) 2014年 秦 道平. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WKInputAccessoryViewButton.h"
@protocol WKInputAccessoryViewDelegate<NSObject>
@optional
///完成编辑时发出的回调
-(void)targetTextViewDidCompleteEdit;
@end
@interface WKInputAccessoryView : UIView{
    ///在键盘退出时记录光标的位置
    NSRange _storeTextViewRange;
    ///记录键盘位置
    CGRect _storeKeyboardFrame;
    ///键盘
    UIView* _keyboardView;
    ///键盘是否在被移除
    BOOL _keyboardRemoving;
}
-(instancetype)initWithTargetTextView:(UITextView*)textView;
@property (nonatomic,assign) UITextView* targetTextView;
@property (nonatomic,assign) UIViewController* parentViewControler;
@property (nonatomic,retain) WKInputAccessoryViewButton* button_1;
@property (nonatomic,retain) WKInputAccessoryViewButton* button_2;
@property (nonatomic,retain) WKInputAccessoryViewButton* button_3;
@property (nonatomic,retain) WKInputAccessoryViewButton* button_4;
@property (nonatomic,retain) WKInputAccessoryViewButton* button_5;
@property (nonatomic,retain) WKInputAccessoryViewButton* button_6;
@property (nonatomic,assign) id<WKInputAccessoryViewDelegate> delegate;
@end
