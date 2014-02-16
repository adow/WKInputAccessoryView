//
//  WKInputAccessoryView.m
//  WKInputAccessoryView
//
//  Created by 秦 道平 on 14-2-15.
//  Copyright (c) 2014年 秦 道平. All rights reserved.
//

#import "WKInputAccessoryView.h"
#import "WKInputAccessoryViewInsertStringBundle.h"
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
        [_button_1 addTarget:self action:@selector(onButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_button_1];
        _button_2=[[WKInputAccessoryViewButton alloc]initWithFrame:CGRectOffset(buttonFrame, 44.0f, 0.0f) indexOfInsertStringBundle:1];
        [_button_2 addTarget:self action:@selector(onButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_button_2];
        _button_3=[[WKInputAccessoryViewButton alloc]initWithFrame:CGRectOffset(buttonFrame, 88.0f, 0.0f) indexOfInsertStringBundle:2];
        [_button_3 addTarget:self action:@selector(onButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_button_3];
        buttonFrame=CGRectMake(320.0f-42.0f, 2.0f, 40.0f, 40.0f);
        _button_4=[[WKInputAccessoryViewButton alloc]initWithFrame:buttonFrame indexOfInsertStringBundle:3];
        [_button_4 addTarget:self action:@selector(onButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_button_4];
        _button_5=[[WKInputAccessoryViewButton alloc]initWithFrame:CGRectOffset(buttonFrame, -44.0f, 0.0f) indexOfInsertStringBundle:4];
        [_button_5 addTarget:self action:@selector(onButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_button_5];
        _button_6=[[WKInputAccessoryViewButton alloc]initWithFrame:CGRectOffset(buttonFrame, -88.0f, 0.0f) indexOfInsertStringBundle:5];
        [_button_6 addTarget:self action:@selector(onButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_button_6];
        
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
}
@end
