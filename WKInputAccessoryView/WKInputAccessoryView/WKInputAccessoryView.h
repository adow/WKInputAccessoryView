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
///点击保存时的回调
-(void)saveOnTargetTextView:(UITextView*)textView;
///点击取消时的回调
-(void)cancelOnTargetTextView:(UITextView*)textView;
///下来键盘完成保存时的回调
-(void)saveAndCompleteOnTargetTextView:(UITextView*)textView;
@end
@interface WKInputAccessoryView : UIView<WKInputAccessoryViewButtonDelegate>{
    ///在键盘退出时记录光标的位置
    NSRange _storeTextViewRange;
    ///记录键盘位置
    CGRect _storeKeyboardFrame;
    ///键盘
    UIView* _keyboardView;
    ///键盘是否在被移除
    BOOL _keyboardRemoving;
    NSArray* _buttons;
}
-(instancetype)initWithTargetTextView:(UITextView*)textView;
@property (nonatomic,assign) UITextView* targetTextView;
@property (nonatomic,assign) UIViewController* parentViewControler;
@property (nonatomic,assign) id<WKInputAccessoryViewDelegate> delegate;
///重建全部按钮,在旋转的时候重建全部按钮
-(void)rebuildButtons;
@end
