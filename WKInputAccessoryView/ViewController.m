//
//  ViewController.m
//  WKInputAccessoryView
//
//  Created by 秦 道平 on 14-2-15.
//  Copyright (c) 2014年 秦 道平. All rights reserved.
//

#import "ViewController.h"
#import "WKInputAccessoryView.h"
#import "WKInputAccessoryViewInsertStringBundle.h"
@interface ViewController ()<WKInputAccessoryViewDelegate>
@property (nonatomic,retain) UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CGRect frame=CGRectInset(self.view.bounds, 3.0f, 10.0f);
    _textView=[[UITextView alloc]initWithFrame:frame];
    _textView.font=[UIFont systemFontOfSize:32.0f];
    _textView.textColor=[UIColor darkGrayColor];
    _textView.text=@"WKInputAccessoryView";
    _textView.autoresizingMask=UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_textView];
    [_textView becomeFirstResponder];
    
    WKInputAccessoryView* inputAcccessoryView=[[[WKInputAccessoryView alloc]initWithTargetTextView:_textView] autorelease];
    inputAcccessoryView.parentViewControler=self;
    inputAcccessoryView.delegate=self;
    _textView.inputAccessoryView=inputAcccessoryView;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    WKInputAccessoryView *inputAccessoryView=(WKInputAccessoryView*)_textView.inputAccessoryView;
    [inputAccessoryView rebuildButtons];
}
#pragma mark - WKInputAccessoryViewDelegate
-(void)targetTextViewDidCompleteEdit{
    NSLog(@"targetTextViewDidCompleteEdit");
}
-(void)saveOnTargetTextView:(UITextView *)textView{
    NSLog(@"save:%@",textView.text);
}
-(void)cancelOnTargetTextView:(UITextView *)textView{
    NSLog(@"cancel:%@",textView.text);
}
@end
