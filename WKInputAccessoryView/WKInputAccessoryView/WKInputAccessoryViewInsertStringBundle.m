//
//  WKInputAccessoryViewInsertString.m
//  WKInputAccessoryView
//
//  Created by 秦 道平 on 14-2-16.
//  Copyright (c) 2014年 秦 道平. All rights reserved.
//

#import "WKInputAccessoryViewInsertStringBundle.h"
@implementation WKInputAccessoryViewInsertString
-(instancetype)initWithInsertString:(NSString *)insertString titleString:(NSString*)titleString cursorPosition:(int)cursorPosition{
    self=[super init];
    if (self){
        self.insertString=insertString;
        self.titleString=titleString;
        self.cursorPositionInString=cursorPosition;
    }
    return self;
}
+(WKInputAccessoryViewInsertString*)insertString:(NSString *)insertString titleString:(NSString*)titleString cursorPosition:(int)cursorPosition{
    WKInputAccessoryViewInsertString* inputAccessoryViewInsertString=[[[WKInputAccessoryViewInsertString alloc]initWithInsertString:insertString titleString:titleString cursorPosition:cursorPosition] autorelease];
    return inputAccessoryViewInsertString;
}
+(WKInputAccessoryViewInsertString*)insertString:(NSString *)insertString titleString:(NSString *)titleString{
    WKInputAccessoryViewInsertString* inputAccessoryViewInsertString=[[[WKInputAccessoryViewInsertString alloc]initWithInsertString:insertString titleString:titleString cursorPosition:WKINPUTACCESSORYVIEWINSERTSTRING_CURSOR_POSITION_ENDOFINSERTSTRING] autorelease];
    return inputAccessoryViewInsertString;
}
-(void)dealloc{
    [_insertString release];
    [_titleString release];
    [super dealloc];
}
-(NSString*)description{
    return [NSString stringWithFormat:@"<0x%x %@ insertString=%@ titleString=%@ cursorPosition=%d",
            (NSUInteger)self,
            [self class],self.insertString,self.titleString,self.cursorPositionInString];
}
@end
@implementation WKInputAccessoryViewInsertStringBundle
static WKInputAccessoryViewInsertStringBundle* _insertStringBundle;
+(WKInputAccessoryViewInsertStringBundle*)sharedInsertStringBundle{
    if (!_insertStringBundle){
        _insertStringBundle=[[super allocWithZone:NULL]init];
        [_insertStringBundle startUp];
    }
    return _insertStringBundle;
}
-(void)startUp{
    _allInserStringList=[[NSMutableArray alloc]init];
    const int total=6;
    _usingInsertStringIndexList=[[NSMutableArray alloc]initWithCapacity:total];
    [_allInserStringList addObject:[WKInputAccessoryViewInsertString insertString:@"#" titleString:@"#"]];
    [_allInserStringList addObject:[WKInputAccessoryViewInsertString insertString:@"*" titleString:@"*"]];
    [_allInserStringList addObject:[WKInputAccessoryViewInsertString insertString:@"\"\"" titleString:@"\"" cursorPosition:1]];
    [_allInserStringList addObject:[WKInputAccessoryViewInsertString insertString:@"<>" titleString:@"<" cursorPosition:1]];
    [_allInserStringList addObject:[WKInputAccessoryViewInsertString insertString:@">" titleString:@">"]];
    [_allInserStringList addObject:[WKInputAccessoryViewInsertString insertString:@"`" titleString:@"`"]];
    [_allInserStringList addObject:[WKInputAccessoryViewInsertString insertString:@"()" titleString:@"(" cursorPosition:1]];
    [_allInserStringList addObject:[WKInputAccessoryViewInsertString insertString:@")" titleString:@")"]];
    [_allInserStringList addObject:[WKInputAccessoryViewInsertString insertString:@"[]" titleString:@"[" cursorPosition:1]];
    [_allInserStringList addObject:[WKInputAccessoryViewInsertString insertString:@"]" titleString:@"]"]];
    for (int a=0; a<total; a++) {
        _usingInsertStringIndexList[a]=[NSNumber numberWithInt:a];
    }
    [self read];
}
#pragma mark - default methods
+(id)allocWithZone:(struct _NSZone *)zone{
    return [[self sharedInsertStringBundle] retain];
}
+(id)copyWithZone:(struct _NSZone *)zone{
    return self;
}
-(id)retain{
    return self;
}
-(NSUInteger)retainCount{
    return NSUIntegerMax;
}
-(oneway void)release{
    return;
}
-(id)autorelease{
    return self;
}
-(void)dealloc{
    [_usingInsertStringIndexList release];
    [_allInserStringList release];
    [super dealloc];
}
#pragma mark - action
-(void)write{
    NSData* data=[NSJSONSerialization dataWithJSONObject:_usingInsertStringIndexList options:NSJSONWritingPrettyPrinted error:nil];
    NSString* string=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    [[NSUserDefaults standardUserDefaults] setObject:string forKey:WKINPUTACCESSORYVIEWINSERTSTRING_KEY_USINGINSERTSTRINGINDEXLIST];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
-(void)read{
    NSString* string=[[NSUserDefaults standardUserDefaults] stringForKey:WKINPUTACCESSORYVIEWINSERTSTRING_KEY_USINGINSERTSTRINGINDEXLIST];
    if (!string || string.length==0)
        return;
    NSData* data=[string dataUsingEncoding:NSUTF8StringEncoding];
    NSArray* array=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    [_usingInsertStringIndexList removeAllObjects];
    [_usingInsertStringIndexList addObjectsFromArray:array];
}
-(void)setInsertStringIndex:(int)index atPosition:(int)position{
    _usingInsertStringIndexList[position]=[NSNumber numberWithInt:index];
    [self write];
}
-(WKInputAccessoryViewInsertString*)insertStringAtPosition:(int)position{
    int index=[_usingInsertStringIndexList[position] intValue];
    return _allInserStringList[index];
}
-(NSArray*)insertStringListForSelection{
    NSMutableArray* array=[NSMutableArray array];
    for (WKInputAccessoryViewInsertString* insertString in _allInserStringList) {
        int index=[_allInserStringList indexOfObject:insertString];
        BOOL skip=NO;
        ///如果在使用中的位置就跳过
        for (id used_index in _usingInsertStringIndexList) {
            if ([used_index intValue]==index){
                skip=YES;
                break;
            }
        }
        if (!skip){
            [array addObject:insertString];
        }
    }
    return array;
}
@end
