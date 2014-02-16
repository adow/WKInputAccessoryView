//
//  WKInputAccessoryView.h
//  WKInputAccessoryView
//
//  Created by 秦 道平 on 14-2-15.
//  Copyright (c) 2014年 秦 道平. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WKInputAccessoryViewButton.h"
@interface WKInputAccessoryView : UIView{
    
}
-(instancetype)initWithTargetTextView:(UITextView*)textView;
@property (nonatomic,assign) UITextView* targetTextView;
@property (nonatomic,retain) WKInputAccessoryViewButton* button_1;
@property (nonatomic,retain) WKInputAccessoryViewButton* button_2;
@property (nonatomic,retain) WKInputAccessoryViewButton* button_3;
@property (nonatomic,retain) WKInputAccessoryViewButton* button_4;
@property (nonatomic,retain) WKInputAccessoryViewButton* button_5;
@property (nonatomic,retain) WKInputAccessoryViewButton* button_6;
@end
