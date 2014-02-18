//
//  WKInputAccessoryInsertStringViewController.m
//  WKInputAccessoryView
//
//  Created by 秦 道平 on 14-2-17.
//  Copyright (c) 2014年 秦 道平. All rights reserved.
//

#import "WKInputAccessoryInsertStringViewController.h"
#import "WKInputAccessoryViewInsertStringBundle.h"
@interface WKInputAccessoryInsertStringViewController ()<UITableViewDataSource,UITableViewDelegate>{
    
}
@property (nonatomic,retain) UITableView* tableView;
@end

@implementation WKInputAccessoryInsertStringViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationItem.title=@"选择符号";
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationItem.leftBarButtonItem=[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(onButtonCancel:)] autorelease];
    
    if (!_tableView){
        _tableView=[[UITableView alloc]initWithFrame:self.view.bounds];
        _tableView.dataSource=self;
        _tableView.delegate=self;
        [self.view addSubview:_tableView];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc{
    [_tableView release];
    [super dealloc];
}
-(IBAction)onButtonCancel:(id)sender{
    [self closeViewController];
}
-(void)closeViewController{
    [[NSNotificationCenter defaultCenter] postNotificationName:WKINPUTACCESSORYINSERTSTRINGVIEWCONTROLLER_NOTIFICATION_CLOSE_VIEWCONTROLLER object:nil];
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
#pragma mark - UITableViewDataSource and UITableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [WKInputAccessoryViewInsertStringBundle sharedInsertStringBundle].insertStringListForSelection.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* identity=@"insertstring-cell";
    UITableViewCell* cell=[tableView dequeueReusableCellWithIdentifier:identity];
    if (!cell){
        cell=[[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identity] autorelease];
        WKInputAccessoryViewInsertString* insertString=[WKInputAccessoryViewInsertStringBundle sharedInsertStringBundle].insertStringListForSelection[indexPath.row];
        cell.textLabel.text=insertString.titleString;
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
        cell.textLabel.textColor=[UIColor colorWithRed:0 green:0.46 blue:1 alpha:1];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [[WKInputAccessoryViewInsertStringBundle sharedInsertStringBundle] setInsertStringIndex:indexPath.row atPosition:self.insertStringPosition];
    [self closeViewController];
}
@end
