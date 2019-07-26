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

@interface YJMyOrdwerViewController ()<UISearchResultsUpdating,UISearchControllerDelegate>

@end

@implementation YJMyOrdwerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    // Do any additional setup after loading the view.
    
    self.TopView.hidden = NO;
    
    DNSPageStyle *style = [[DNSPageStyle alloc] init];
    style.titleViewScrollEnabled = YES;
    style.titleScaleEnabled = YES;
    
    // 设置标题内容
    NSArray <NSString *>*titles = @[@"头条", @"视频", @"娱乐", @"要问", @"体育" , @"科技" , @"汽车" , @"时尚" , @"图片" , @"游戏" , @"房产"];
    
    // 创建每一页对应的controller
    for (int i = 0; i < titles.count; i++) {
        YJAllOrderViewController *controller = [[YJAllOrderViewController alloc] init];
        controller.view.backgroundColor = [UIColor blueColor];
        [self addChildViewController:controller];
    }
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    
    // 创建对应的DNSPageView，并设置它的frame
    DNSPageView *pageView = [[DNSPageView alloc] initWithFrame:CGRectMake(0, kGHSafeAreaTopHeight+20, size.width, size.height) style:style titles:titles childViewControllers:self.childViewControllers startIndex:0];
    [self.view addSubview:pageView];
}
#pragma  mark --UISearchResultsUpdating
//UISearchResultsUpdating代理方法，跟新搜索结果界面
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSLog(@"更新结果222222 ");
    self.edgesForExtendedLayout = UIRectEdgeNone;
    NSString * inputStr = searchController.searchBar.text;
    //    if (self.resultArr.count > 0) {
    //        [self.resultArr removeAllObjects];
    //    }
    //    for (NSString * str in self.dataArr) {
    //        if ([str.lowercaseString rangeOfString:inputStr.lowercaseString].location != NSNotFound) {
    //            [self.resultArr addObject:str];
    //        }
    //    }
    //    [self.OrderTableview reloadData];
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
