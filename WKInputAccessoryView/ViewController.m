//
//  ViewController.m
//  WKInputAccessoryView
//
//  Created by 秦 道平 on 14-2-15.
//  Copyright (c) 2014年 秦 道平. All rights reserved.
//

#import "ViewController.h"
#import "WKInputAccessoryView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    CGRect frame=CGRectInset(self.view.bounds, 3.0f, 10.0f);
    UITextView* textView=[[[UITextView alloc]initWithFrame:frame] autorelease];
    textView.font=[UIFont systemFontOfSize:32.0f];
    textView.textColor=[UIColor darkGrayColor];
    textView.text=@"WKInputAccessoryView";
    [self.view addSubview:textView];
    [textView becomeFirstResponder];
    
    WKInputAccessoryView* inputAcccessoryView=[[[WKInputAccessoryView alloc]initWithTargetTextView:textView] autorelease];
    textView.inputAccessoryView=inputAcccessoryView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
