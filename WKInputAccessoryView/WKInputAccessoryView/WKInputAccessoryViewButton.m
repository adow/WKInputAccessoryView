//
//  WKInputAccessoryViewButton.m
//  WKInputAccessoryView
//
//  Created by 秦 道平 on 14-2-15.
//  Copyright (c) 2014年 秦 道平. All rights reserved.
//

#import "WKInputAccessoryViewButton.h"
#import "WKInputAccessoryViewInsertStringBundle.h"
@interface WKInputAccessoryViewButton()


@end
@implementation WKInputAccessoryViewButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame indexOfInsertStringBundle:(int)index{
    self=[super initWithFrame:frame];
    if (self){
        self.backgroundColor=[UIColor lightGrayColor];
        self.indexOfInsertStringBundle=index;
        
        [self refreshButtonTitle];
        [self addTarget:self action:@selector(onButton:) forControlEvents:UIControlEventTouchUpInside];
        UILongPressGestureRecognizer* longGesture=[[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(onLongPressGesture:)] autorelease];
        longGesture.cancelsTouchesInView=YES;
        [self addGestureRecognizer:longGesture];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
-(void)dealloc{
    [_insertString release];
    [super dealloc];
}
-(void)refreshButtonTitle{
    self.insertString=[WKInputAccessoryViewInsertStringBundle sharedInsertStringBundle].visibleStringList[self.indexOfInsertStringBundle];
    [self setTitle:self.insertString.titleString forState:UIControlStateNormal];
}
#pragma mark - UILongPressGesture
-(void)onLongPressGesture:(UIGestureRecognizer*)recognizer{
    if (recognizer.state==UIGestureRecognizerStateBegan){
        NSLog(@"longpress");
//        WKInputAccessoryViewButton* button=(WKInputAccessoryViewButton*)recognizer.view;
        if ([self.delegate respondsToSelector:@selector(longPressOnButton:)]){
            [self.delegate longPressOnButton:self];
        }
    }
}
-(IBAction)onButton:(id)sender{
    if ([self.delegate respondsToSelector:@selector(touchOnButton:)]){
        [self.delegate touchOnButton:self];
    }
}
@end
