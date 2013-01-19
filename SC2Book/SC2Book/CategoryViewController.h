//
//  CategoryViewController.h
//  SC2Book
//
//  Created by Wistone#1 on 12-11-15.
//  Copyright (c) 2012年 chenwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_CategoryTableView;
    UINavigationController *_nav;
    UIViewController *_First;
    UIViewController *_Second;
}
@property(strong,nonatomic) UITableView* CategoryTableView;
@property(strong,nonatomic) UINavigationController *nav;
@property(strong,nonatomic) UIViewController *First;
@property(strong,nonatomic) UIViewController *Second;
@end
