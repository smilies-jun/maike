//
//  YJActivityViewController.m
//  maike
//
//  Created by amin on 2019/7/13.
//  Copyright © 2019 yj. All rights reserved.
//

#import "YJMyOrdwerViewController.h"
#import "DNSPageView_ObjC.h"

#import "YJAllOrderViewController.h"
#import "YJCreateOrderViewController.h"
#import "YJCompleteOrderViewController.h"
#import "YJSendOrderViewController.h"
#import "YJUseOrderViewController.h"
#import "YJReceivedOrderViewController.h"


@interface YJMyOrdwerViewController ()<UISearchResultsUpdating,UISearchControllerDelegate>{
    DNSPageView *pageView;
}
@end

@implementation YJMyOrdwerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    // Do any additional setup after loading the view.
    
    self.TopView.hidden = NO;
    [self CreateUI];
    
}
- (void)CreateUI{
    DNSPageStyle *style = [[DNSPageStyle alloc] init];
    style.titleViewScrollEnabled = YES;
    style.titleScaleEnabled = YES;
    style.titleFont = [UIFont systemFontOfSize:13];
    
    // 设置标题内容
    NSArray <NSString *>*titles = @[@"全部", @"已创建",@"已生效",@"已发货",@"已到货",@"已完成"];
    YJAllOrderViewController *allVC = [[YJAllOrderViewController alloc] init];
    allVC.view.backgroundColor = [UIColor blueColor];
    [self addChildViewController:allVC];
    
    YJCreateOrderViewController *recateVC = [[YJCreateOrderViewController alloc] init];
    recateVC.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:recateVC];
    
    YJCompleteOrderViewController *completeVC = [[YJCompleteOrderViewController alloc] init];
    completeVC.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:completeVC];
    
    YJSendOrderViewController *sendVC = [[YJSendOrderViewController alloc] init];
    sendVC.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:sendVC];
    
    YJUseOrderViewController *useVC = [[YJUseOrderViewController alloc] init];
    useVC.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:useVC];
    
    YJReceivedOrderViewController *receivedVC = [[YJReceivedOrderViewController alloc] init];
    receivedVC.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:receivedVC];
    
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    
    // 创建对应的DNSPageView，并设置它的frame
    pageView = [[DNSPageView alloc] initWithFrame:CGRectMake(0, kGHSafeAreaTopHeight+20, size.width, size.height) style:style titles:titles childViewControllers:self.childViewControllers startIndex:0];
    [self.view addSubview:pageView];
}
#pragma  mark --UISearchResultsUpdating
//UISearchResultsUpdating代理方法，跟新搜索结果界面
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSLog(@"更新结果222222 ");
    self.edgesForExtendedLayout = UIRectEdgeNone;
    NSString * inputStr = searchController.searchBar.text;
   // pageView.startIndex = @"3";
    
}
#pragma  mark --UISearchControllerDelegate
//UISearchControllerDelegate代理方法
-(void)willPresentSearchController:(UISearchController *)searchController{
    NSLog(@"------willPresentSearchController3333");
    
}

-(void)didPresentSearchController:(UISearchController *)searchController{
    NSLog(@"------didPresentSearchController4444");
}

-(void)willDismissSearchController:(UISearchController *)searchController{
    NSLog(@"------willDismissSearchController");
}

-(void)didDismissSearchController:(UISearchController *)searchController{
    NSLog(@"------didDismissSearchController");
}

-(void)presentSearchController:(UISearchController *)searchController{
    NSLog(@"-------presentSearchController");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
