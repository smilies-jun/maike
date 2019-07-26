//
//  YJHotShopViewController.m
//  maike
//
//  Created by Apple on 2019/7/24.
//  Copyright © 2019 yj. All rights reserved.
//

#import "YJHotShopViewController.h"
#import "WSDropMenuView.h"
#import "YJShowShopTableViewCell.h"
#import "TFPopup.h"
#import "WSDropMenuView.h"



@interface YJHotShopViewController ()<UITableViewDataSource,UITableViewDelegate,WSDropMenuViewDataSource,WSDropMenuViewDelegate>{
    UITableView *shophotListTableview;
    UIButton *moneyBtn;
    UIButton *allBtn;
    UIView *moneyView;
    UIView *allView;
    
}

@end

@implementation YJHotShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.TopView.hidden = NO;
    self.searchController.searchBar.hidden = YES;
    self.TopTitleLabel.text = @"热销列表";
    self.view.backgroundColor = colorWithRGB(0.83, 0.83, 0.83);
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.backgroundColor = [UIColor redColor];

    [rightBtn addTarget:self action:@selector(rightClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.TopView addSubview:rightBtn];
    [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.TopView.mas_right).offset(-20);
        make.top.mas_equalTo(self.TopView.mas_top).offset(20);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];
    [self.BackButton addTarget:self action:@selector(HotListBackClick) forControlEvents:UIControlEventTouchUpInside];
     [self SetUi];
}
- (void)rightClick:(UIButton *)btn{
    if (btn.selected) {
        [shophotListTableview setEditing:YES animated:YES];
    }else{
      [shophotListTableview setEditing:NO animated:YES];
    }
   
}
- (void)SetUi{
    shophotListTableview = [[UITableView alloc]init];
    shophotListTableview.frame = CGRectMake(0, StatusBarHeight+64+44, SCREEN_WIDTH, SCREEN_HEIGHT-StatusBarHeight-64-44);
    shophotListTableview.delegate = self;
    shophotListTableview.dataSource = self;
    [self.view addSubview:shophotListTableview];

    WSDropMenuView *dropMenu = [[WSDropMenuView alloc] initWithFrame:CGRectMake(0, StatusBarHeight+64, SCREEN_WIDTH, 40)];
    dropMenu.dataSource = self;
    dropMenu.delegate  =self;
    [self.view addSubview:dropMenu];
}


#pragma mark - WSDropMenuView DataSource -
- (NSInteger)dropMenuView:(WSDropMenuView *)dropMenuView numberWithIndexPath:(WSIndexPath *)indexPath{
    
    //WSIndexPath 类里面有注释
    
    if (indexPath.column == 0 && indexPath.row == WSNoFound) {
        
        return 10;
    }
    if (indexPath.column == 0 && indexPath.row != WSNoFound && indexPath.item == WSNoFound) {
        
        return 5;
    }
    
    if (indexPath.column == 0 && indexPath.row != WSNoFound && indexPath.item != WSNoFound && indexPath.rank == WSNoFound) {
        
        return 7;
    }
    
    if (indexPath.column == 1) {
        
        return 3;
    }
    
    return 0;
}

- (NSString *)dropMenuView:(WSDropMenuView *)dropMenuView titleWithIndexPath:(WSIndexPath *)indexPath{
    
    //return [NSString stringWithFormat:@"%ld",indexPath.row];
    
    //左边 第一级
    if (indexPath.column == 0 && indexPath.row != WSNoFound && indexPath.item == WSNoFound) {
        
        return [NSString stringWithFormat:@"第一级%ld",indexPath.row];
    }
    
    if (indexPath.column == 0 && indexPath.row != WSNoFound && indexPath.item != WSNoFound && indexPath.rank == WSNoFound) {
        
        return [NSString stringWithFormat:@"第二级%ld",indexPath.item];
    }
    
    if (indexPath.column == 0 && indexPath.row != WSNoFound && indexPath.item != WSNoFound && indexPath.rank != WSNoFound) {
        
        return [NSString stringWithFormat:@"第三级%ld",indexPath.rank];
    }
    
    if (indexPath.column == 1 && indexPath.row != WSNoFound ) {
        
        return [NSString stringWithFormat:@"右边%ld",indexPath.row];
    }
    
    return @"";
    
}

#pragma mark - WSDropMenuView Delegate -

- (void)dropMenuView:(WSDropMenuView *)dropMenuView didSelectWithIndexPath:(WSIndexPath *)indexPath{
    
    
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
    
    static NSString *identifier = @"showHotTopProidentifier";
    
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
    
    
}
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}
//删除点击方法，处理想要删除的数据
//这里有一个需要注意点，一定要先更新数据源，在更新UI
- (void)tableView:(UITableView*)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath*)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [self.dataArray removeObjectAtIndex: indexPath.row];
//        [self.tableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:indexPath]
//                              withRowAnimation:UITableViewRowAnimationFade];
//        [self.tableView reloadData];
        
    }
}
- (void)HotListBackClick{
    [self.navigationController   popToRootViewControllerAnimated:NO];
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
