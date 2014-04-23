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
@end
