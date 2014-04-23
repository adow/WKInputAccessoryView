//
//  WKInputAccessoryView.m
//  WKInputAccessoryView
//
//  Created by 秦 道平 on 14-2-15.
//  Copyright (c) 2014年 秦 道平. All rights reserved.
//

#import "WKInputAccessoryView.h"
#import "WKInputAccessoryViewInsertStringBundle.h"
#import "WKInputAccessoryInsertStringViewController.h"
#define WKInputAccessoryViewTouchPadMoveKeyboardMaxY 100.0f ///移动键盘到这个位置就让键盘小时
#define WKInputAccessoryViewTouchPadMoveKeyboardMinY 20.0f ///只有Y移动超过这么多才认为是在移动键盘
#define WKInputAccessoryViewTouchPadMoveCursorMinX 20.0f ///只有x移动查过这么多才认为是在移动光标
#define WKInputAccessoryViewTouchPadMoveCursorStep 30.0f ///每个字符的光标的移动距离
@interface WKInputAccessoryView(){
    
}
@property (nonatomic,retain) UIView *touchPadView;
@end
@implementation WKInputAccessoryView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(instancetype)initWithTargetTextView:(UITextView *)textView{
    self=[super initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 44.0f)];
    if (self){
        self.targetTextView=textView;
        self.backgroundColor=[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
        

        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillShow:)
                                                     name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardWillHide:)
                                                     name:UIKeyboardWillHideNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardDidShow:)
                                                     name:UIKeyboardDidShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(keyboardDidHide:)
                                                     name:UIKeyboardDidHideNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(notificationInsertStringViewControllerClose:)
                                                     name:WKINPUTACCESSORYINSERTSTRINGVIEWCONTROLLER_NOTIFICATION_CLOSE_VIEWCONTROLLER object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationInsertString:) name:WKINPUTACCESSORYINSERTSTRINGVIEWCONTROLLER_NOTIFICATION_INSERTSTRING object:nil];
        [self rebuildButtons];
        
    }
    return self;
}
-(void)dealloc{
    [_buttons release];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}
-(void)rebuildButtons{
    for (WKInputAccessoryViewButton *button in _buttons) {
        [button removeFromSuperview];
    }
    [_buttons release];
    _buttons=nil;
    [_touchPadView removeFromSuperview];
    [_touchPadView release];
    _touchPadView=nil;
    
    int button_total=6;
    CGFloat margin=2.0f;
    CGFloat button_height=40.0f;
    CGFloat pad_width=56.0f;
    CGFloat pad_height=40.0f;
    CGFloat button_width=(self.frame.size.width-pad_width-margin*(button_total+2))/button_total;
    
    _touchPadView=[[UIView alloc]initWithFrame:CGRectMake((self.frame.size.width-pad_width)/2, margin,
                                                                  pad_width, pad_height)];
    _touchPadView.backgroundColor=[UIColor grayColor];
    [self addSubview:_touchPadView];
    UIPanGestureRecognizer* panGesture=[[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(onPanGesture:)] autorelease];
    [_touchPadView addGestureRecognizer:panGesture];
    
    NSMutableArray *buttons=[NSMutableArray array];
    for (int a=0; a<button_total; a++) {
        CGFloat left=margin;
        if (a<button_total/2){
            left=(margin+button_width)*a+margin;
        }
        else{
            left=self.frame.size.width-(margin+button_width)*(button_total-a);
        }
        CGRect buttonFrame=CGRectMake(left, margin, button_width, button_height);
        WKInputAccessoryViewButton* button=[[WKInputAccessoryViewButton alloc]initWithFrame:buttonFrame indexOfInsertStringBundle:a];
        button.delegate=self;
        [self addSubview:button];
        [buttons addObject:button];
    }
    _buttons=[[NSArray alloc]initWithArray:buttons];
}
///按钮上内容刷新
-(void)refreshbuttonTitle{
    for (WKInputAccessoryViewButton* button in _buttons) {
        [button refreshButtonTitle];
    }
}
#pragma mark - WKInputAccessoryViewButtonDelegate
-(void)touchOnButton:(WKInputAccessoryViewButton *)button{
    [self insertStringInText:button.insertString];
}
-(void)longPressOnButton:(WKInputAccessoryViewButton *)button{
    [self showInsertStringViewControllerForInsertString:button.insertString];
}
-(void)insertStringInText:(WKInputAccessoryViewInsertString*)insertString{
    self.targetTextView.scrollEnabled=NO;
    NSRange range=self.targetTextView.selectedRange;
    NSString* string_1=[self.targetTextView.text substringToIndex:range.location];
    NSString* string_2=[self.targetTextView.text substringFromIndex:range.location];
    NSString* string_3=[NSString stringWithFormat:@"%@%@%@",string_1,insertString.insertString,string_2];
    if (insertString.cursorPositionInString==WKINPUTACCESSORYVIEWBUTTON_CURSION_POSITION_ENDOFINSERTPOSITION){
        range.location+=insertString.insertString.length;
    }
    else{
        range.location+=insertString.cursorPositionInString;
    }
    self.targetTextView.text=string_3;
    self.targetTextView.selectedRange=range;
    self.targetTextView.scrollEnabled=YES;
}
///显示字符选择界面，为哪个按钮设置
-(void)showInsertStringViewControllerForInsertString:(WKInputAccessoryViewInsertString*)insertString{
    _storeTextViewRange=self.targetTextView.selectedRange;
    WKInputAccessoryInsertStringViewController* insertViewController=[[[WKInputAccessoryInsertStringViewController alloc]init] autorelease];
    insertViewController.insertString=insertString;
    UINavigationController* navigationViewController=[[[UINavigationController alloc]initWithRootViewController:insertViewController] autorelease];
    [self.parentViewControler presentViewController:navigationViewController animated:YES completion:^{
        
    }];
}
///Touch pad 移动
-(void)onPanGesture:(UIPanGestureRecognizer*)recognizer{
    if (recognizer.state==UIGestureRecognizerStateBegan){
        _keyboardRemoving=NO;
        ///保存开始的光标的位置
        _storeTextViewRange=self.targetTextView.selectedRange;
        ///保存开始的键盘位置
        for (UIWindow *window in [UIApplication sharedApplication].windows) {
            for (UIView *keyBoard in window.subviews) {
                if ([[keyBoard description] hasPrefix:@"<UIPeripheralHostView"]){
                    _keyboardView=keyBoard;
                    _storeKeyboardFrame=keyBoard.frame;
                    break;
                }
            }
        }
        
    }
    else if (recognizer.state==UIGestureRecognizerStateChanged){
        CGPoint tranlate=[recognizer translationInView:self];
//        NSLog(@"translate:%@",NSStringFromCGPoint(tranlate));
        if (_keyboardRemoving)
            return;
        ///移动键盘
        if (fabsf(tranlate.y>=WKInputAccessoryViewTouchPadMoveKeyboardMinY)){
//            NSLog(@"move keyboard");
            _keyboardView.frame=CGRectOffset(_storeKeyboardFrame, 0.0f, tranlate.y-WKInputAccessoryViewTouchPadMoveKeyboardMinY);
            ///移动键盘很多了就直接取消键盘
            if (tranlate.y>=WKInputAccessoryViewTouchPadMoveKeyboardMaxY){
                ///确保只会调用一次
                    _keyboardRemoving=YES;
                    [UIView animateWithDuration:0.1f animations:^{
                        _keyboardView.frame=CGRectOffset(_storeKeyboardFrame, 0.0f, _storeKeyboardFrame.size.height);
                    } completion:^(BOOL finished) {
                        ///先让键盘隐藏
                        _keyboardView.hidden=YES;
                        [self.targetTextView resignFirstResponder];
                        
                        ///恢复
                        double delayInSeconds = 0.5;
                        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
                        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                            _keyboardView.hidden=NO;
                            _keyboardView=nil;
                        });
                        if ([self.delegate respondsToSelector:@selector(targetTextViewDidCompleteEdit)]){
                            [self.delegate targetTextViewDidCompleteEdit];
                        }
                        
                    }];
                }
                
            
            
        }
        ///横向移动光标位置
        else if (fabsf(tranlate.x)>=WKInputAccessoryViewTouchPadMoveCursorMinX){
            int move=tranlate.x/WKInputAccessoryViewTouchPadMoveCursorStep;
            NSRange range=_storeTextViewRange;
            range.location+=move;
            self.targetTextView.selectedRange=range;
        }
    }
    else if (recognizer.state==UIGestureRecognizerStateEnded){
        ///如果键盘移动位置不够就返回原来位置
        CGPoint translate=[recognizer translationInView:self];
        if (translate.y<WKInputAccessoryViewTouchPadMoveKeyboardMaxY){
            [UIView animateWithDuration:0.1f animations:^{
                _keyboardView.frame=_storeKeyboardFrame;
            } completion:^(BOOL finished) {
                _keyboardView=nil;
            }];
        }
        else{
            
        }
    }
}
#pragma mark - Notification
#pragma mark keyboard
-(void)keyboardWillShow:(NSNotification*)notification{
    NSLog(@"keyboardWillShow");
    [self refreshbuttonTitle];
}
-(void)keyboardDidShow:(NSNotification*)notification{
    NSLog(@"keyboardDidShow");
    ///恢复键盘光标位置
    if (!NSEqualRanges(_storeTextViewRange, NSMakeRange(0, 0))){
        self.targetTextView.selectedRange=_storeTextViewRange;
    }
    
}
-(void)keyboardWillHide:(NSNotification*)notification{
    NSLog(@"keyboardWillHide");
    
}
-(void)keyboardDidHide:(NSNotification*)notification{
    NSLog(@"keyboardDidHide");
}
#pragma mark insertstring view controller
-(void)notificationInsertStringViewControllerClose:(NSNotification*)notification{
    double delayInSeconds = 0.1;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self.targetTextView becomeFirstResponder];
    });
    
}
-(void)notificationInsertString:(NSNotification*)notification{
    WKInputAccessoryViewInsertString* insertString=notification.object;
    [self insertStringInText:insertString];
}
@end
