//
//  WKInputAccessoryViewButton.m
//  WKInputAccessoryView
//
//  Created by 秦 道平 on 14-2-15.
//  Copyright (c) 2014年 秦 道平. All rights reserved.
//

#import "WKInputAccessoryViewButton.h"

@implementation WKInputAccessoryViewButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame titleString:(NSString *)titleString insertString:(NSString *)insertString{
    self=[super initWithFrame:frame];
    if (self){
        self.backgroundColor=[UIColor lightGrayColor];
        self.cursorPositionInString=WKINPUTACCESSORYVIEWBUTTON_CURSION_POSITION_ENDOFINSERTPOSITION;
        self.insertString=insertString;
        [self setTitle:titleString forState:UIControlStateNormal];
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
@end
