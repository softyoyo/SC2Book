//
//  RaceViewController.m
//  SC2Book
//
//  Created by Wistone#1 on 12-11-14.
//  Copyright (c) 2012年 chenwei. All rights reserved.
//

#import "RaceViewController.h"
#import "CategoryViewController.h"
#import "Global.h"

@implementation RaceViewController
@synthesize tableView = _tableView;
@synthesize curSelectSection = _curSelectRow;
@synthesize RaceHeadViewArrays = _RaceHeadViewArrays;
@synthesize footerView = _footerView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(10, 10, 160, 740) style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.curSelectSection = 0;
    [self.view addSubview:self.tableView];
    
    self.RaceHeadViewArrays = [NSMutableArray array];
    for(int i = 0;i<MAX_RACEROW_NUM ;i++)
	{
		RaceHeadView* headview = [[RaceHeadView alloc] init];
        headview.delegate = self;
		headview.section = i;
        [headview.button setTitle:[NSString stringWithFormat:@"第%d组",i] forState:UIControlStateNormal];
		[self.RaceHeadViewArrays addObject:headview];
	}
    
    self.footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 160, 10)];
    self.footerView.backgroundColor = [UIColor clearColor];
    
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldAutorotate
{
    return YES;
}

-(NSUInteger)supportedInterfaceOrientations
{
    return  UIInterfaceOrientationMaskLandscape;
}

-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return  (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

#pragma mark - TableViewdelegate&&TableViewdataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 38;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [self.RaceHeadViewArrays objectAtIndex:section];
}

- (UIView*)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return self.footerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    RaceHeadView* headView = [self.RaceHeadViewArrays objectAtIndex:section];
    return headView.isSelect?1:0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
     return MAX_RACEROW_NUM;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indentifier = @"RaceCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    if([[cell.contentView subviews] count] != 0)
    {
        int count = [[cell.contentView subviews] count];
        for(int i=0; i<count; i++)
        {
            UIView *uv = [[cell.contentView subviews] objectAtIndex:i];
            [uv removeFromSuperview];
        }
    }
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 160, 20)];
    label.text = [NSString stringWithFormat:@"%d-%d",indexPath.section,indexPath.row];
    label.backgroundColor = [UIColor clearColor];
    [cell.contentView addSubview:label];
    cell.contentView.backgroundColor = [UIColor blueColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.curSelectSection = indexPath.section;
    [self.tableView reloadData];
    CategoryViewController *vc = [[CategoryViewController alloc]init];
    //[vc.view setFrame:CGRectMake(200, 10, 300, 400)];
    [self.view addSubview:vc.view];    
}

#pragma mark - RaceHeadViewDelegate
-(void)OnButtonClicked:(RaceHeadView*)view
{
    if (!view.isSelect)
    {
        view.isSelect = YES;
        for(int i = 0;i<[self.RaceHeadViewArrays count];i++)
        {
            RaceHeadView *head = [self.RaceHeadViewArrays objectAtIndex:i];
            if(head.isSelect && head.section!=view.section)
            {
                head.isSelect = NO;
                //[head.button setBackgroundImage:[UIImage imageNamed:@"btn_momal"] forState:UIControlStateNormal];
            }
        }
        [self.tableView reloadData];
    }
}
@end

#pragma mark
@implementation RaceHeadView
@synthesize delegate = _delegate;
@synthesize section = _section;
@synthesize button = _button;
@synthesize isSelect = _isSelect;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = nil;
        self.section = 0;
        self.isSelect = NO;
        UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame = CGRectMake(0, 0, 160, 30);
        [btn addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];        
        //[btn setBackgroundImage:[UIImage imageNamed:@"btn_momal"] forState:UIControlStateNormal];
        //[btn setBackgroundImage:[UIImage imageNamed:@"btn_on"] forState:UIControlStateHighlighted];
        [self addSubview:btn];
        self.button = btn;
    }
    return self;
}

-(void)action
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(OnButtonClicked:)])
    {
     	[self.delegate OnButtonClicked:self];
    }
}
@end