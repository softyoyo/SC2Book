//
//  RaceViewController.h
//  SC2Book
//
//  Created by Wistone#1 on 12-11-14.
//  Copyright (c) 2012年 chenwei. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RaceHeadView;
@protocol RaceHeadViewDelegate <NSObject>
-(void)OnButtonClicked:(RaceHeadView *)view;
@end

@interface RaceViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,RaceHeadViewDelegate>
{
    UITableView *_tableView;
    NSInteger _curSelectSection;
    NSMutableArray* _RaceHeadViewArrays;
    UIView *_footerView;
}
@property(strong,nonatomic) UITableView *tableView;
@property(nonatomic) NSInteger curSelectSection;
@property(strong,nonatomic) NSMutableArray* RaceHeadViewArrays;
@property(strong,nonatomic) UIView *footerView;
@end

@interface RaceHeadView : UIView
{
    id<RaceHeadViewDelegate> _delegate;
    NSInteger _section;
    UIButton* _button;
    BOOL _isSelect;
}
@property(nonatomic) id<RaceHeadViewDelegate> delegate;
@property(nonatomic) NSInteger section;
@property(nonatomic, retain) UIButton* button;
@property(nonatomic) BOOL isSelect;
@end

