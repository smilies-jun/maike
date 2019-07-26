//
//  YJShopDetailViewController.m
//  maike
//
//  Created by Apple on 2019/7/24.
//  Copyright © 2019 yj. All rights reserved.
//

#import "YJShopDetailViewController.h"
#import "YJShowShopTableViewCell.h"
#import "UserAdresssTableViewCell.h"
#import "ShopTableViewCell.h"
#import "YJPayViewController.h"


@interface YJShopDetailViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView *shopListTableview;
    UILabel *moneyLabel;
    UIButton *payBtn;
    
}

@end

@implementation YJShopDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.TopView.hidden = NO;
    self.searchController.searchBar.hidden = YES;
    self.TopTitleLabel.text = @"提交订单";
    self.view.backgroundColor = colorWithRGB(0.83, 0.83, 0.83);
    [self.BackButton addTarget:self action:@selector(ShopListBackClick) forControlEvents:UIControlEventTouchUpInside];
    [self SetUi];
}
- (void)SetUi{
    shopListTableview = [[UITableView alloc]init];
    shopListTableview.frame = CGRectMake(0, StatusBarHeight+64, SCREEN_WIDTH, SCREEN_HEIGHT-StatusBarHeight-64- 100);
    shopListTableview.delegate = self;
    shopListTableview.dataSource = self;
    [self.view addSubview:shopListTableview];
    
    UIView *bottomView = [[UIView alloc]init];
    bottomView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.bottom.mas_equalTo(self.view.mas_bottom);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(80);
    }];
    moneyLabel = [[UILabel alloc]init];
    moneyLabel.text = @"定金金额：￥7788999";
    [bottomView addSubview:moneyLabel];
    [moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(bottomView.mas_left).offset(20);
        make.bottom.mas_equalTo(bottomView.mas_bottom).offset(-40);
        make.width.mas_equalTo(180);
        make.height.mas_equalTo(30);
    }];
    payBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    payBtn.backgroundColor = [UIColor redColor];
    [payBtn addTarget:self action:@selector(payClick) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:payBtn];
    [payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(bottomView.mas_right).offset(-20);
        make.bottom.mas_equalTo(bottomView.mas_bottom).offset(-40);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(30);
    }];
    
    
}
- (void)payClick{
    YJPayViewController *vc = [[YJPayViewController alloc]init];
    [self.navigationController pushViewController:vc animated:NO];
}
- (void)ShopListBackClick{
    [self.navigationController popToRootViewControllerAnimated:NO];
}
//设置行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section ==0) {
          return 1;
    }else if (section == 1){
          return 5;
    }else{
          return 2;
    }
    
  
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
//组头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
//cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
         return 160;
    }else if (indexPath.section == 1){
         return 140;
    }else{
         return 60;
    }
    
   
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        static NSString *identifier = @"TopProidentifier";
        
        UserAdresssTableViewCell   *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[UserAdresssTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            [cell configUI:indexPath];
        }
        
        cell.backgroundColor = [UIColor whiteColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        return cell;
    }else if (indexPath.section == 1)
    {
        static NSString *identifier = @"shopTopProidentifier";
        
        YJShowShopTableViewCell   *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[YJShowShopTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            [cell configUI:indexPath];
        }
        
        cell.backgroundColor = [UIColor whiteColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        return cell;
    }else{
        static NSString *identifier = @"detailTopProidentifier";
        
        ShopTableViewCell   *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[ShopTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            [cell configUI:indexPath];
        }
        
        cell.backgroundColor = [UIColor whiteColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        return cell;
    }
    
    
    
    
    
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
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
