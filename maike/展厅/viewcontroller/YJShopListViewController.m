//
//  YJShopListViewController.m
//  maike
//
//  Created by Apple on 2019/7/23.
//  Copyright © 2019 yj. All rights reserved.
//

#import "YJShopListViewController.h"
#import "YJShowShopTableViewCell.h"
#import "GHDropMenu.h"
#import "GHDropMenuModel.h"
#import "YJShopDetailViewController.h"
#import "YJHotShopViewController.h"



@interface YJShopListViewController ()<UITableViewDataSource,UITableViewDelegate,GHDropMenuDelegate>{
    UITableView *shopListTableview;
    
}
@property (nonatomic , strong)GHDropMenu *dropMenu;

@end

@implementation YJShopListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.TopView.hidden = NO;
      [self.BackButton addTarget:self action:@selector(ShopListBackClick) forControlEvents:UIControlEventTouchUpInside];
    [self SetUi];
}
- (void)SetUi{
    GHDropMenuModel *configuration = [[GHDropMenuModel alloc]init];
    /** 配置筛选菜单是否记录用户选中 默认NO */
    configuration.recordSeleted = NO;
    
    /** 设置数据源 */
    configuration.titles = [configuration creaDropMenuData];
    /** 创建dropMenu 配置模型 && frame */
    weakself(self);
    GHDropMenu *dropMenu = [GHDropMenu creatDropMenuWithConfiguration:configuration frame:CGRectMake(0, kGHSafeAreaTopHeight,kGHScreenWidth, 44) dropMenuTitleBlock:^(GHDropMenuModel * _Nonnull dropMenuModel) {
        weakSelf.navigationItem.title = [NSString stringWithFormat:@"筛选结果: %@",dropMenuModel.title];
    } dropMenuTagArrayBlock:^(NSArray * _Nonnull tagArray) {
        [weakSelf getStrWith:tagArray];
    }];
    dropMenu.titleSeletedImageName = @"up_normal";
    dropMenu.titleNormalImageName = @"down_normal";
    dropMenu.delegate = self;
    dropMenu.durationTime = 0.5;
    self.dropMenu = dropMenu;
    [self.view addSubview:dropMenu];
    shopListTableview = [[UITableView alloc]init];
    shopListTableview.frame = CGRectMake(0, StatusBarHeight+64+44, SCREEN_WIDTH, SCREEN_HEIGHT-StatusBarHeight);
    shopListTableview.delegate = self;
    shopListTableview.dataSource = self;
    [self.view addSubview:shopListTableview];
}
#pragma mark - 代理方法;
- (void)dropMenu:(GHDropMenu *)dropMenu dropMenuTitleModel:(GHDropMenuModel *)dropMenuTitleModel {
    self.navigationItem.title = [NSString stringWithFormat:@"筛选结果: %@",dropMenuTitleModel.title];
}
- (void)dropMenu:(GHDropMenu *)dropMenu tagArray:(NSArray *)tagArray {
    [self getStrWith:tagArray];
}

- (void)getStrWith: (NSArray *)tagArray {
    NSMutableString *string = [NSMutableString string];
    if (tagArray.count) {
        for (GHDropMenuModel *dropMenuTagModel in tagArray) {
            if (dropMenuTagModel.tagSeleted) {
                if (dropMenuTagModel.tagName.length) {
                    [string appendFormat:@"%@",dropMenuTagModel.tagName];
                }
            }
            if (dropMenuTagModel.maxPrice.length) {
                [string appendFormat:@"最大价格%@",dropMenuTagModel.maxPrice];
            }
            if (dropMenuTagModel.minPrice.length) {
                [string appendFormat:@"最小价格%@",dropMenuTagModel.minPrice];
            }
            if (dropMenuTagModel.singleInput.length) {
                [string appendFormat:@"%@",dropMenuTagModel.singleInput];
            }
        }
    }
    self.navigationItem.title = [NSString stringWithFormat:@"筛选结果: %@",string];
}
- (void)ShopListBackClick{
    [self.navigationController popToRootViewControllerAnimated:NO];
}
//设置行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return 20;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//组头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
//cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 140;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"showTopProidentifier";
    
    YJShowShopTableViewCell   *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[YJShowShopTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell configUI:indexPath];
    }
    
    cell.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    return cell;
    
    
    
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    YJShopDetailViewController *vc = [[YJShopDetailViewController alloc]init];
//    [self.navigationController pushViewController:vc animated:NO];
    
    YJHotShopViewController *vc = [[YJHotShopViewController alloc]init];
    [self.navigationController pushViewController:vc animated:NO];
}
#pragma  mark --UISearchResultsUpdating
//UISearchResultsUpdating代理方法，跟新搜索结果界面
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSLog(@"更新结果 ");
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
    NSLog(@"------willPresentSearchController");
    
}

-(void)didPresentSearchController:(UISearchController *)searchController{
    NSLog(@"------didPresentSearchController");
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
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[self rdv_tabBarController] setTabBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
     [super viewWillDisappear:animated];
    [[self rdv_tabBarController] setTabBarHidden:NO animated:YES];
 
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
