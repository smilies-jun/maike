//
//  YJPayViewController.m
//  maike
//
//  Created by Apple on 2019/7/24.
//  Copyright © 2019 yj. All rights reserved.
//

#import "YJPayViewController.h"
#import "YJPayStyleTableViewCell.h"
#import "YJPayTopTableViewCell.h"

@interface YJPayViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView *shopListTableview;
    UIButton *payBtn;
    
}

@end

@implementation YJPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.TopView.hidden = NO;
    self.searchController.searchBar.hidden = YES;
    self.TopTitleLabel.text = @"支付定金";
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
    payBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    payBtn.backgroundColor = [UIColor redColor];
    [payBtn addTarget:self action:@selector(sureClick) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:payBtn];
    [payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(bottomView.mas_right).offset(-30);
        make.bottom.mas_equalTo(bottomView.mas_bottom).offset(-20);
        make.width.mas_equalTo(SCREEN_WIDTH-60 );
        make.height.mas_equalTo(40);
    }];
}
- (void)sureClick{
    
}
- (void)ShopListBackClick{
    [self.navigationController popToRootViewControllerAnimated:NO];
}
//设置行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section ==0) {
        return 1;
    }else if (section == 1){
        return 2;
    }else{
        return 3;
    }
    
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        UIView *titleView = [[UIView alloc]init];
        titleView.backgroundColor = [UIColor grayColor];
        titleView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 40);
        return titleView;
    }else if (section ==2){
        UIView *titleView = [[UIView alloc]init];
        titleView.backgroundColor = [UIColor grayColor];
        titleView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 40);
        return titleView;
    }else{
        return nil;
        
    }
    
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
//组头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
         return 40;
    }else if (section == 2){
        return 40;
    }else{
         return 0;
    }
   
}
//cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 160;
    }else{
        return 60;
    }
    
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        static NSString *identifier = @"payTopProidentifier";
        
        YJPayTopTableViewCell   *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[YJPayTopTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            [cell configUI:indexPath];
        }
        
        cell.backgroundColor = [UIColor whiteColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        return cell;
    }else{
        static NSString *identifier = @"paydetailTopProidentifier";
        
        YJPayStyleTableViewCell   *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (!cell) {
            cell = [[YJPayStyleTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
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
