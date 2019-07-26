//
//  YJAuthenticationViewController.m
//  maike
//
//  Created by Apple on 2019/7/22.
//  Copyright © 2019 yj. All rights reserved.
//

#import "YJAuthenticationViewController.h"
#import "CustomView.h"
#import "CustomChooseView.h"
#import "YJAutherTableViewCell.h"
#import "TFPopup.h"

@interface YJAuthenticationViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>{
    CustomChooseView *choseShopTypeView;
    CustomView *choseShopNameView;
    CustomView *choseShopSortShopView;
    CustomChooseView *choseShopAdressView;
    CustomChooseView *ShopTypeView;
    
    UIButton *userBtn;
    UIButton *shopBtn;
    
    CustomView *bankCardView;
    CustomView *bankNameView;
    CustomView *bankAdressView;
    CustomChooseView *PayTypeView;
    
    UITableView *choseTableview;
    
    UIView *choseView;//弹出视图
}

@end

@implementation YJAuthenticationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.TopView.hidden = NO;
    self.searchController.searchBar.hidden = YES;
    self.TopTitleLabel.text = @"门店入驻";
    [self.BackButton addTarget:self action:@selector(AuthenticationBackClick) forControlEvents:UIControlEventTouchUpInside];
    [self InitUI];
}
- (void)AuthenticationBackClick{
    [self dismissViewControllerAnimated:NO completion:^{
        
    }];
}
- (UIView *)getChoseView{
    UIView *TypeView= [[UIView alloc]init];
    TypeView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 300);
    TypeView.backgroundColor = [UIColor whiteColor];
    UILabel *TitleLabel = [[UILabel alloc]init];
    TitleLabel.text = @"选择结算账户";
    TitleLabel.textAlignment = NSTextAlignmentCenter;
    [TypeView addSubview:TitleLabel];
    [TitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(TypeView.mas_centerX);
        make.top.mas_equalTo(TypeView.mas_top).offset(10);
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(30);
    }];
    UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [cancelBtn addTarget:self action:@selector(cancelClick) forControlEvents:UIControlEventTouchUpInside];
    cancelBtn.backgroundColor = [UIColor redColor];
    [TypeView addSubview:cancelBtn];
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(TypeView.mas_right).offset(-20);
        make.top.mas_equalTo(TypeView.mas_top).offset(20);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];
    choseTableview  = [[UITableView alloc]init];
    choseTableview.dataSource = self;
    choseTableview.delegate = self;
    [TypeView addSubview:choseTableview];
    [choseTableview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(TypeView.mas_left);
        make.top.mas_equalTo(TitleLabel.mas_bottom).offset(10);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(180);
    }];
    UILabel *bottomLabel = [[UILabel alloc]init];
    bottomLabel.text = @"使用微信或支付宝结算需要完成一笔0.99支付认证。";
    bottomLabel.font = [UIFont systemFontOfSize:12];
    bottomLabel.textAlignment = NSTextAlignmentCenter;
    [TypeView addSubview:bottomLabel];
    [bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(TypeView.mas_centerX);
        make.top.mas_equalTo(self->choseTableview.mas_bottom).offset(2);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(30);
    }];
    return TypeView;
}
- (void)InitUI{
    self.view.backgroundColor = colorWithRGB(0.83, 0.83, 0.83);
    
    choseShopTypeView = [[CustomChooseView alloc]init];
    choseShopTypeView.ChooseLabel.hidden = YES;
    choseShopTypeView.NameLabel.text = @"门店类型";
    [self.view addSubview:choseShopTypeView];
    [choseShopTypeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(self.TopView.mas_bottom).offset(2);
        make.height.mas_equalTo(60);
    }];
    userBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    userBtn.backgroundColor = [UIColor blueColor];
    [choseShopTypeView addSubview:userBtn];
    [userBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->choseShopTypeView.NameLabel.mas_right).offset(20);
        make.top.mas_equalTo(self->choseShopTypeView.mas_top).offset(20);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];
    UILabel *userLabe = [[UILabel alloc]init];
    userLabe.text = @"个人";
    [choseShopTypeView addSubview:userLabe];
    [userLabe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->userBtn.mas_right).offset(5);
        make.top.mas_equalTo(self->choseShopTypeView.mas_top).offset(20);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(20);
    }];
    shopBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    shopBtn.backgroundColor = [UIColor blueColor];
    [choseShopTypeView addSubview:shopBtn];
    [shopBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(userLabe.mas_right).offset(60);
        make.top.mas_equalTo(self->choseShopTypeView.mas_top).offset(20);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];
    UILabel *shopLabe = [[UILabel alloc]init];
    shopLabe.text = @"商户";
    [choseShopTypeView addSubview:shopLabe];
    [shopLabe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->shopBtn.mas_right).offset(5);
        make.top.mas_equalTo(self->choseShopTypeView.mas_top).offset(20);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(20);
    }];
    choseShopNameView = [[CustomView alloc]init];
    choseShopNameView.NameLabel.text = @"门店全称";
    [self.view addSubview:choseShopNameView];
    [choseShopNameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(self->choseShopTypeView.mas_bottom).offset(2);
        make.height.mas_equalTo(60);
    }];
    choseShopSortShopView = [[CustomView alloc]init];
    choseShopSortShopView.NameLabel.text = @"门店简称";
    [self.view addSubview:choseShopSortShopView];
    [choseShopSortShopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(self->choseShopNameView.mas_bottom).offset(2);
        make.height.mas_equalTo(60);
    }];
   
    ShopTypeView = [[CustomChooseView alloc]init];
    ShopTypeView.NameLabel.text = @"入驻类型";
    ShopTypeView.ChooseLabel.text = @"请选择";
    [self.view addSubview:ShopTypeView];
    [ShopTypeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(self->choseShopSortShopView.mas_bottom).offset(2);
        make.height.mas_equalTo(60);
    }];
    choseShopAdressView = [[CustomChooseView alloc]init];
    choseShopAdressView.NameLabel.text = @"入驻区域";
    [self.view addSubview:choseShopAdressView];
    [choseShopAdressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(self->ShopTypeView.mas_bottom).offset(2);
        make.height.mas_equalTo(60);
    }];
    bankCardView = [[CustomView alloc]init];
    bankCardView.NameLabel.text = @"账号";
    [self.view addSubview:bankCardView];
    [bankCardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(self->choseShopAdressView.mas_bottom).offset(2);
        make.height.mas_equalTo(60);
    }];
    bankNameView = [[CustomView alloc]init];
    bankNameView.NameLabel.text = @"持卡人";
    [self.view addSubview:bankNameView];
    [bankNameView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(self->bankCardView.mas_bottom).offset(2);
        make.height.mas_equalTo(60);
    }];
    bankAdressView = [[CustomView alloc]init];
    bankAdressView.NameLabel.text = @"开户行";
    [self.view addSubview:bankAdressView];
    [bankAdressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(self->bankNameView.mas_bottom).offset(2);
        make.height.mas_equalTo(60);
    }];
    
    PayTypeView = [[CustomChooseView alloc]init];
    PayTypeView.NameLabel.text = @"结算账户";
    PayTypeView.ChooseLabel.text = @"选择结算方式";
    PayTypeView.ChooseLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *choseType = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(choseType)];
    [PayTypeView.ChooseLabel addGestureRecognizer:choseType];
    [self.view addSubview:PayTypeView];
    [PayTypeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(self->bankAdressView.mas_bottom).offset(2);
        make.height.mas_equalTo(60);
    }];
    
}
//弹出视图
- (void)choseType{
    TFPopupParam *param = [TFPopupParam new];
    param.disuseBackgroundTouchHide = NO;
    param.popupSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 300);//设置弹框的尺寸
    param.offset = CGPointZero;//在计算好的位置上偏移
    choseView = [self getChoseView];
    [choseView tf_showSlide:self.view direction:PopupDirectionBottom popupParam:param];
}
- (void)cancelClick{
     [choseView tf_hide];
}
//设置行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return 3;
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
    
    return 60;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"yjAutheProidentifier";
    
    YJAutherTableViewCell   *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[YJAutherTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell configUI:indexPath];
    }
    
    cell.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
@end
