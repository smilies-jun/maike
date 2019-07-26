//
//  YJBaseViewController.m
//  maike
//
//  Created by amin on 2019/7/13.
//  Copyright © 2019 yj. All rights reserved.
//

#import "YJBaseViewController.h"

@interface YJBaseViewController (){
     UIImageView *navBarHairlineImageView;
}

@end

@implementation YJBaseViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;
    _TopView = [[UIView alloc]init];
    _TopView.backgroundColor = [UIColor whiteColor];
    _TopView.hidden = YES;
    [self.view addSubview:_TopView];
    [_TopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.top.mas_equalTo(self.view.mas_top).offset(StatusBarHeight);
        make.height.mas_equalTo(64);
        make.width.mas_equalTo(SCREEN_WIDTH);
    }];
    _BackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_BackButton setImage:[UIImage imageNamed:@"identity_scan"] forState:UIControlStateNormal];
    [_TopView addSubview:_BackButton];
    [_BackButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->_TopView.mas_left).offset(20);
        make.top.mas_equalTo(self->_TopView.mas_top).offset(20);
        make.height.mas_equalTo(18);
        make.width.mas_equalTo(18);
    }];
    _TopTitleLabel = [[UILabel alloc]init];
    _TopTitleLabel.textAlignment = NSTextAlignmentCenter;
    _TopTitleLabel.font = [UIFont systemFontOfSize:16];
    _TopTitleLabel.textColor = [UIColor blackColor];
    [_TopView addSubview:_TopTitleLabel];
    [_TopTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self->_TopView.mas_centerX);
        make.top.mas_equalTo(self->_TopView.mas_top).offset(20);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(40);
    }];
    
    //创建UISearchController,初始化方法，传nil即为使用当前界面作为搜索结果界面
    UISearchController * searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
    
    //searchController.hidesNavigationBarDuringPresentation = NO;//是否隐藏navigationBar默认是YES，隐藏的
    searchController.dimsBackgroundDuringPresentation = NO;//默认是YES有一层蒙层，设置为NO就没有蒙层了
    //searchController.obscuresBackgroundDuringPresentation = NO;和dimsBackgroundDuringPresentation一样的效果，只是On tvOS, defaults to NO when contained in UISearchContainerViewController。
    
    //设置代理
    searchController.delegate = self;
    searchController.searchResultsUpdater = self;
    
    //将searchBar作为tableHeaderView
    searchController.searchBar.frame = CGRectMake(0, 0, SCREEN_WIDTH, 40);
    //self.tableview.tableHeaderView = searchController.searchBar;
    searchController.searchBar.placeholder = @"搜索";
    [searchController.searchBar sizeToFit];
    
    //添加一张白色的图片(方法自己上网搜索)
    [searchController.searchBar setBackgroundImage:[UIImage new]];
    self.edgesForExtendedLayout = UIRectEdgeNone;//属性使得搜索框不会紧紧贴着屏幕顶层的电池边缘
    self.navigationController.navigationBar.translucent = NO;
    
    self.definesPresentationContext =YES;
    
    //UIViewController中的属性，将UISearchViewController的view添加在了当前控制器View上。避免searchBar被遮挡，或者cell跳转时候依然在上面的情况
    searchController.searchBar.searchTextPositionAdjustment = UIOffsetMake(10, 0);
    CGFloat offsetX = 0;
    [searchController.searchBar setPositionAdjustment:UIOffsetMake(offsetX, 0) forSearchBarIcon:UISearchBarIconSearch];
    // 7.设置搜索按钮图片
    UIImage *searchImg = [[UIImage imageNamed:@"identity_scan"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [searchController.searchBar setImage:searchImg forSearchBarIcon:UISearchBarIconSearch state:UIControlStateNormal];
    // 9.设置取消按钮文字
    [searchController.searchBar setValue:@"取消" forKey:@"_cancelButtonText"];
    searchController.searchBar.tintColor = [UIColor blackColor];
    self.searchController = searchController;
    [self.TopView addSubview:self.searchController.searchBar];
 
}


//#pragma  mark --UISearchResultsUpdating
////UISearchResultsUpdating代理方法，跟新搜索结果界面
//-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{
//    NSLog(@"更新结果 ");
//    self.edgesForExtendedLayout = UIRectEdgeNone;
//    NSString * inputStr = searchController.searchBar.text;
//    //    if (self.resultArr.count > 0) {
//    //        [self.resultArr removeAllObjects];
//    //    }
//    //    for (NSString * str in self.dataArr) {
//    //        if ([str.lowercaseString rangeOfString:inputStr.lowercaseString].location != NSNotFound) {
//    //            [self.resultArr addObject:str];
//    //        }
//    //    }
//    //    [self.OrderTableview reloadData];
//}
//#pragma  mark --UISearchControllerDelegate
////UISearchControllerDelegate代理方法
//-(void)willPresentSearchController:(UISearchController *)searchController{
//    NSLog(@"------willPresentSearchController");
//    
//}
//
//-(void)didPresentSearchController:(UISearchController *)searchController{
//    NSLog(@"------didPresentSearchController");
//}
//
//-(void)willDismissSearchController:(UISearchController *)searchController{
//    NSLog(@"------willDismissSearchController");
//}
//
//-(void)didDismissSearchController:(UISearchController *)searchController{
//    NSLog(@"------didDismissSearchController");
//}
//
//-(void)presentSearchController:(UISearchController *)searchController{
//    NSLog(@"-------presentSearchController");
//}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}

@end
