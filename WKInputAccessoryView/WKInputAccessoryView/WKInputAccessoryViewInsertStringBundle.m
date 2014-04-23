//
//  WKInputAccessoryViewInsertString.m
//  WKInputAccessoryView
//
//  Created by 秦 道平 on 14-2-16.
//  Copyright (c) 2014年 秦 道平. All rights reserved.
//

#import "WKInputAccessoryViewInsertStringBundle.h"

@implementation WKInputAccessoryViewInsertString
-(instancetype)initWithInsertString:(NSString *)insertString
                        titleString:(NSString*)titleString
                     cursorPosition:(int)cursorPosition
                                key:(NSString *)key{
    self=[super init];
    if (self){
        self.insertString=insertString;
        self.titleString=titleString;
        self.cursorPositionInString=cursorPosition;
        self.key=key;
    }
    return self;
}
+(WKInputAccessoryViewInsertString*)insertString:(NSString *)insertString
                                     titleString:(NSString*)titleString
                                  cursorPosition:(int)cursorPosition
                                             key:(NSString *)key{
    WKInputAccessoryViewInsertString* inputAccessoryViewInsertString=[[[WKInputAccessoryViewInsertString alloc]initWithInsertString:insertString titleString:titleString cursorPosition:cursorPosition key:key] autorelease];
    return inputAccessoryViewInsertString;
}
+(WKInputAccessoryViewInsertString*)insertString:(NSString *)insertString
                                     titleString:(NSString *)titleString
                                             key:(NSString *)key{
    WKInputAccessoryViewInsertString* inputAccessoryViewInsertString=[[[WKInputAccessoryViewInsertString alloc]initWithInsertString:insertString titleString:titleString cursorPosition:WKINPUTACCESSORYVIEWINSERTSTRING_CURSOR_POSITION_ENDOFINSERTSTRING key:key] autorelease];
    return inputAccessoryViewInsertString;
}
-(void)dealloc{
    [_insertString release];
    [_titleString release];
    [_key release];
    [super dealloc];
}
-(NSString*)description{
    return [NSString stringWithFormat:@"<0x%x %@ insertString=%@ titleString=%@ cursorPosition=%d key=%@>",
            (NSUInteger)self,
            [self class],self.insertString,self.titleString,self.cursorPositionInString,self.key];
}
@end
@implementation WKInputAccessoryViewInsertStringBundle

+(WKInputAccessoryViewInsertStringBundle*)sharedInsertStringBundle{
    static WKInputAccessoryViewInsertStringBundle* _insertStringBundle=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _insertStringBundle=[[super allocWithZone:NULL]init];
        [_insertStringBundle startUp];
    });
    return _insertStringBundle;
}
-(void)addInsertString:(NSString*)insertString titleString:(NSString*)titleString cursorPosition:(int)cursorPosition
                   key:(NSString*)key{
    WKInputAccessoryViewInsertString *string=[WKInputAccessoryViewInsertString insertString:insertString titleString:titleString cursorPosition:cursorPosition key:key];
    [_allStringList addObject:string];
}
-(void)addInsertString:(NSString*)insertString titleString:(NSString*)titleString key:(NSString*)key{
    WKInputAccessoryViewInsertString *string=[WKInputAccessoryViewInsertString insertString:insertString titleString:titleString key:key];
    [_allStringList addObject:string];
}
-(void)startUp{
    _allStringList=[[NSMutableArray alloc]init];
    [self addInsertString:@"#" titleString:@"#" key:@"sharp"];
    [self addInsertString:@"*" titleString:@"*" key:@"star"];
    [self addInsertString:@"\"\"" titleString:@"\"" cursorPosition:1 key:@"double-quotation"];
    [self addInsertString:@"''" titleString:@"'" cursorPosition:1 key:@"single-quotation"];
    [self addInsertString:@"<>" titleString:@"<" cursorPosition:1 key:@"less"];
    [self addInsertString:@">" titleString:@">" key:@"more"];
    [self addInsertString:@"`" titleString:@"`" key:@"back-quotation"];
    [self addInsertString:@"()" titleString:@"(" cursorPosition:1 key:@"open-paren"];
    [self addInsertString:@")" titleString:@")" key:@"close-paren"];
    [self addInsertString:@"[]" titleString:@"[" cursorPosition:1 key:@"open-bracket"];
    [self addInsertString:@"]" titleString:@"]" key:@"close-bracket"];
    [self addInsertString:@":" titleString:@":" key:@"colon"];
    [self addInsertString:@"-" titleString:@"-" key:@"hyphen"];
    [self addInsertString:@"_" titleString:@"_" key:@"under"];
    [self addInsertString:@"    " titleString:@"Tab" key:@"Tab"];
    [self addInsertString:@"/" titleString:@"/" key:@"slash"];
    [self addInsertString:@"\\" titleString:@"\\" key:@"backslash"];
    [self addInsertString:@"+" titleString:@"+" key:@"plus"];
    [self addInsertString:@"|" titleString:@"|" key:@"vertical"];
    [self addInsertString:@"{}" titleString:@"{" cursorPosition:1 key:@"open-brace"];
    [self addInsertString:@"}" titleString:@"}" key:@"close-brace"];
    [self addInsertString:@"@" titleString:@"@" key:@"at"];
    [self addInsertString:@"%" titleString:@"%" key:@"percent"];
    [self addInsertString:@";" titleString:@";" key:@"semicolon"];
    [self addInsertString:@"." titleString:@"." key:@"dot"];
    [self addInsertString:@"," titleString:@"," key:@"comma"];
    [self addInsertString:@"。" titleString:@"。" key:@"dot-cn"];
    [self addInsertString:@"?" titleString:@"?" key:@"question"];
    [self addInsertString:@"✓" titleString:@"✓" key:@"finish"];
    [self addInsertString:@"✕" titleString:@"✕" key:@"nofinish"];
    [self addInsertString:@"$" titleString:@"$" key:@"dollar"];
    [self addInsertString:@"￥" titleString:@"￥" key:@"rmb"];
    [self addInsertString:@"€" titleString:@"€" key:@"euro"];
    [self addInsertString:@"→" titleString:@"→" key:@"right-arrow"];
    [self addInsertString:@"←" titleString:@"←" key:@"left-arrow"];
    [self addInsertString:@"↑" titleString:@"↑" key:@"up-arrow"];
    [self addInsertString:@"↓" titleString:@"↓" key:@"down-arrow"];
    [self addInsertString:@"" titleString:@"" key:@"apple"];
    [self addInsertString:@"®" titleString:@"®" key:@"registed"];
    [self addInsertString:@"©" titleString:@"©" key:@"copyright"];
    [self addInsertString:@"™" titleString:@"™" key:@"trademark"];
    [self addInsertString:@"•" titleString:@"•" key:@"circle-small"];
    [self addInsertString:@"◉" titleString:@"◉" key:@"circle-big"];
    [self addInsertString:nil titleString:@"保存" key:@"cmd-save"];
    [self addInsertString:nil titleString:@"取消" key:@"cmd-cancel"];

    _visibleStringList=[[NSMutableArray alloc]init];
    for (int a=0; a<VISIBLE_BUTTONS_TOTAL; a++) {
        WKInputAccessoryViewInsertString* string=_allStringList[a];
        [_visibleStringList addObject:string];
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
    [_allStringList release];
    [_visibleStringList release];
    [super dealloc];
}
#pragma mark - action
-(void)write{
    NSMutableArray* array=[NSMutableArray array];
    for (WKInputAccessoryViewInsertString* string in _visibleStringList) {
        [array addObject:string.key];
    }
    NSData* data=[NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:nil];
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
    [_visibleStringList removeAllObjects];
    for (NSString *key in array) {
        WKInputAccessoryViewInsertString* insertString=[self insertStringForKey:key];
        if (insertString){
            [_visibleStringList addObject:insertString];
        }
        
    }
}

-(NSArray*)invisibleStringList{
    NSMutableArray* array=[NSMutableArray array];
    for (WKInputAccessoryViewInsertString* insert_string_in_all in _allStringList) {
        BOOL skip=NO;
        for (WKInputAccessoryViewInsertString* insert_string_in_visible in _visibleStringList) {
            if (insert_string_in_all ==insert_string_in_visible){
                skip=YES;
                break;
            }
        }
        if (!skip){
            [array addObject:insert_string_in_all];
        }
        
    }
    return array;
}
-(WKInputAccessoryViewInsertString*)insertStringForKey:(NSString *)key{
    for (WKInputAccessoryViewInsertString *insertString in _allStringList) {
        if ([insertString.key isEqualToString:key]){
            return insertString;
        }
    }
    return nil;
}
-(NSArray*)visibleStringList{
    return _visibleStringList;
}
-(NSArray*)allStringList{
    return _allStringList;
}
-(void)replaceStringInVisible:(WKInputAccessoryViewInsertString *)stringInVisible
        withStringInInvisible:(WKInputAccessoryViewInsertString *)stringInInvisible{
    ///位置
    int pos=[_visibleStringList indexOfObject:stringInVisible];
    ///更换内容
    _visibleStringList[pos]=stringInInvisible;
    [self write];
}
@end
