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
@interface WKInputAccessoryView(){
    
}

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
        CGRect buttonFrame=CGRectMake(2.0f, 2.0f, 40.0f, 40.0f);
        
        
        _button_1=[[WKInputAccessoryViewButton alloc]initWithFrame:buttonFrame indexOfInsertStringBundle:0];
        _button_1.tag=0;
        [_button_1 addTarget:self action:@selector(onButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_button_1];
        UILongPressGestureRecognizer* longPressGesture_1=[[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(onLongPressGesture:)] autorelease];
        longPressGesture_1.cancelsTouchesInView=YES;
        [_button_1 addGestureRecognizer:longPressGesture_1];
        
        _button_2=[[WKInputAccessoryViewButton alloc]initWithFrame:CGRectOffset(buttonFrame, 44.0f, 0.0f) indexOfInsertStringBundle:1];
        _button_2.tag=1;
        [_button_2 addTarget:self action:@selector(onButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_button_2];
        UILongPressGestureRecognizer* longPressGesture_2=[[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(onLongPressGesture:)] autorelease];
        longPressGesture_2.cancelsTouchesInView=YES;
        [_button_2 addGestureRecognizer:longPressGesture_2];
        
        _button_3=[[WKInputAccessoryViewButton alloc]initWithFrame:CGRectOffset(buttonFrame, 88.0f, 0.0f) indexOfInsertStringBundle:2];
        _button_3.tag=2;
        [_button_3 addTarget:self action:@selector(onButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_button_3];
        UILongPressGestureRecognizer* longPressGesture_3=[[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(onLongPressGesture:)] autorelease];
        longPressGesture_3.cancelsTouchesInView=YES;
        [_button_3 addGestureRecognizer:longPressGesture_3];
        
        UIView* touchPadView=[[[UIView alloc]initWithFrame:CGRectMake(132.0f, 2.0f, 56.0f, 40.0f)] autorelease];
        touchPadView.backgroundColor=[UIColor grayColor];
        [self addSubview:touchPadView];
        UIPanGestureRecognizer* panGesture=[[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(onPanGesture:)] autorelease];
        [touchPadView addGestureRecognizer:panGesture];
        
        buttonFrame=CGRectMake(320.0f-42.0f, 2.0f, 40.0f, 40.0f);
        _button_4=[[WKInputAccessoryViewButton alloc]initWithFrame:buttonFrame indexOfInsertStringBundle:3];
        _button_4.tag=3;
        [_button_4 addTarget:self action:@selector(onButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_button_4];
        UILongPressGestureRecognizer* longPressGesture_4=[[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(onLongPressGesture:)] autorelease];
        longPressGesture_4.cancelsTouchesInView=YES;
        [_button_4 addGestureRecognizer:longPressGesture_4];
        
        _button_5=[[WKInputAccessoryViewButton alloc]initWithFrame:CGRectOffset(buttonFrame, -44.0f, 0.0f) indexOfInsertStringBundle:4];
        _button_5.tag=4;
        [_button_5 addTarget:self action:@selector(onButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_button_5];
        UILongPressGestureRecognizer* longPressGesture_5=[[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(onLongPressGesture:)] autorelease];
        longPressGesture_5.cancelsTouchesInView=YES;
        [_button_5 addGestureRecognizer:longPressGesture_5];
        
        _button_6=[[WKInputAccessoryViewButton alloc]initWithFrame:CGRectOffset(buttonFrame, -88.0f, 0.0f) indexOfInsertStringBundle:5];
        _button_6.tag=5;
        [_button_6 addTarget:self action:@selector(onButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_button_6];
        UILongPressGestureRecognizer* longPressGesture_6=[[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(onLongPressGesture:)] autorelease];
        longPressGesture_6.cancelsTouchesInView=YES;
        [_button_6 addGestureRecognizer:longPressGesture_6];
        
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
        
    }
    return self;
}
-(void)dealloc{
    [_button_1 release];
    [_button_2 release];
    [_button_3 release];
    [_button_4 release];
    [_button_5 release];
    [_button_6 release];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
///按钮上内容刷新
-(void)refreshbutton{
    [_button_1 refreshButtonTitle];
    [_button_2 refreshButtonTitle];
    [_button_3 refreshButtonTitle];
    [_button_4 refreshButtonTitle];
    [_button_5 refreshButtonTitle];
    [_button_6 refreshButtonTitle];
}
-(IBAction)onButton:(id)sender{
    WKInputAccessoryViewButton* button=(WKInputAccessoryViewButton*)sender;
    int index=button.indexOfInsertStringBundle;
    WKInputAccessoryViewInsertString* insertString=[[WKInputAccessoryViewInsertStringBundle sharedInsertStringBundle] insertStringAtPosition:index];
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
//    [self showInsertStringViewControllerForButonPosition:button.tag];
}
-(void)onLongPressGesture:(UIGestureRecognizer*)recognizer{
    if (recognizer.state==UIGestureRecognizerStateBegan){
        NSLog(@"longpress");
        WKInputAccessoryViewButton* button=(WKInputAccessoryViewButton*)recognizer.view;
        int index=button.indexOfInsertStringBundle;
        [self showInsertStringViewControllerForButonPosition:index];
    }
}
///显示字符选择界面，为哪个按钮设置
-(void)showInsertStringViewControllerForButonPosition:(int)position{
    _storeTextViewRange=self.targetTextView.selectedRange;
    WKInputAccessoryInsertStringViewController* insertViewController=[[[WKInputAccessoryInsertStringViewController alloc]init] autorelease];
    insertViewController.insertStringPosition=position;
    UINavigationController* navigationViewController=[[[UINavigationController alloc]initWithRootViewController:insertViewController] autorelease];
    [self.parentViewControler presentViewController:navigationViewController animated:YES completion:^{
        
    }];
}
-(void)onPanGesture:(UIPanGestureRecognizer*)recognizer{
    if (recognizer.state==UIGestureRecognizerStateBegan){
        _storeTextViewRange=self.targetTextView.selectedRange;
    }
    if (recognizer.state==UIGestureRecognizerStateChanged){
        CGPoint tranlate=[recognizer translationInView:self];
        NSLog(@"translate:%@",NSStringFromCGPoint(tranlate));
        if (fabsf(tranlate.y>=20.0f)){
            NSLog(@"move keyboard");
        }
        else if (fabsf(tranlate.x)>=10.0f){
            int move=tranlate.x/30.0f;
            NSRange range=_storeTextViewRange;
            range.location+=move;
            self.targetTextView.selectedRange=range;
        }
    }
}
#pragma mark - Notification
#pragma mark keyboard
-(void)keyboardWillShow:(NSNotification*)notification{
    NSLog(@"keyboardWillShow");
    [self refreshbutton];
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
@end
