//
//  CategoryViewController.m
//  SC2Book
//
//  Created by Wistone#1 on 12-11-15.
//  Copyright (c) 2012年 chenwei. All rights reserved.
//

#import "CategoryViewController.h"
#import "Global.h"

@implementation CategoryViewController
@synthesize CategoryTableView = _CategoryTableView;
@synthesize nav = _nav;
@synthesize First =_First;
@synthesize Second = _Second;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.First = [[UIViewController alloc]init];
    self.Second = [[UIViewController alloc]init];
	self.nav  = [[UINavigationController alloc]initWithRootViewController:self.First];
    [self.nav.view setFrame:CGRectMake(0, 0, 200, 300)];
    self.CategoryTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 180, 280) style:UITableViewStylePlain];
    self.CategoryTableView.dataSource = self;
    self.CategoryTableView.delegate = self;
    
    //[self.First.view setFrame:CGRectMake(0, 0, 300, 400)];
    [self.First.view addSubview:self.CategoryTableView];
    [self.view addSubview:self.nav.view];
    
    self.view.backgroundColor = [UIColor purpleColor];
    self.nav.view.backgroundColor = [UIColor whiteColor];
    self.CategoryTableView.backgroundColor = [UIColor yellowColor];
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
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indentifier = @"CategoryCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    /*
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 160, 20)];
    label.text = [NSString stringWithFormat:@"%d-%d",indexPath.section,indexPath.row];
    label.backgroundColor = [UIColor clearColor];
    [cell.contentView addSubview:label];
     */
    cell.contentView.backgroundColor = [UIColor orangeColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //self.curSelectSection = indexPath.section;
    //[self.tableView reloadData];
    //[self.nav pushViewController:self.Second animated:YES];
}
@end
