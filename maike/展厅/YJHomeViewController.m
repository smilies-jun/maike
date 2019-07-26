//
//  YJHomeViewController.m
//  maike
//
//  Created by amin on 2019/7/13.
//  Copyright © 2019 yj. All rights reserved.
//

#import "YJHomeViewController.h"
#import "SDCycleScrollView.h"
#import "YJShowShopTableViewCell.h"


@interface YJHomeViewController ()<SDCycleScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
//shop列表N
@property (nonatomic,strong)UITableView *ShopTableView;
//Banner广告
@property(nonatomic,strong) SDCycleScrollView *bannerAd;
//九宫格
@property(nonatomic,strong) UIView *TopView;


@end

@implementation YJHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.title = @"迈克杭州总店";
    //[self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor],
                                                                    //  NSFontAttributeName : [UIFont fontWithName:@"Helvetica-Bold" size:17]}];
    self.view.backgroundColor = [UIColor whiteColor];

    UIView *iconBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    UIButton * leftButton = [[UIButton alloc]init];
    leftButton.layer.masksToBounds = YES;
    leftButton.frame = CGRectMake(0, 0, 30, 30);
    leftButton.layer.cornerRadius = 12.5;
    [iconBgView addSubview:leftButton];
    UILabel *adresslabel = [[UILabel alloc]init];
    adresslabel.text = @"城西银泰";
    adresslabel.frame = CGRectMake(0, 30, 80, 20);
    [iconBgView addSubview:adresslabel];
    
    [leftButton addTarget:self action:@selector(leftBtnCilck) forControlEvents:UIControlEventTouchUpInside];
     [leftButton setImage:[UIImage imageNamed:@"identity_scan"] forState:UIControlStateNormal];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:iconBgView];
    self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc]initWithCustomView:iconBgView];
   self.navigationItem.leftBarButtonItems  = @[leftItem];
    
    UIButton *informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [informationCardBtn addTarget:self action:@selector(RightBtnCLick:) forControlEvents:UIControlEventTouchUpInside];
    [informationCardBtn setImage:[UIImage imageNamed:@"identity_scan"] forState:UIControlStateNormal];
    
    [informationCardBtn sizeToFit];
    UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn];

    UIButton *settingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [settingBtn addTarget:self action:@selector(RightBtnCLick:) forControlEvents:UIControlEventTouchUpInside];
    [settingBtn setImage:[UIImage imageNamed:@"identity_scan"] forState:UIControlStateNormal];
    [settingBtn sizeToFit];
    UIBarButtonItem *settingBtnItem = [[UIBarButtonItem alloc] initWithCustomView:settingBtn];
    
    
    
    self.navigationItem.rightBarButtonItems  = @[informationCardItem,settingBtnItem];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self SetUI];
}
#pragma mark - 懒加载

-(SDCycleScrollView *)bannerAd {
    
    NSArray *imagesURLStrings = @[@"http://eimg.smzdm.com/201706/21/5949c794a058193.png",
                                  @"http://eimg.smzdm.com/201706/20/594872b3ce4897616.png",
                                  @"http://eimg.smzdm.com/201706/21/5949c759c9ec75211.png",
                                  @"http://eimg.smzdm.com/201706/20/59490304c13471312.jpg",
                                  @"http://eimg.smzdm.com/201706/20/5948c8333d5242625.png"];
    
    if (!_bannerAd) {
        _bannerAd = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 180) delegate:self placeholderImage:[UIImage imageNamed:@"default"]];
        _bannerAd.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        _bannerAd.currentPageDotColor = [UIColor whiteColor];
        _bannerAd.imageURLStringsGroup = imagesURLStrings;
    }
    
    return _bannerAd;
}
//九宫格
- (UIView *)TopView{
    if (!_TopView) {
        _TopView = [[UIView alloc]init];
        _TopView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 120);
        _TopView.backgroundColor = [UIColor whiteColor];
        UIButton *DoorBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        DoorBtn.backgroundColor = colorWithRGB(0.95, 0.6, 0.11);
        DoorBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [DoorBtn addTarget:self action:@selector(DoorBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_TopView addSubview:DoorBtn];
        [DoorBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self->_TopView.mas_left).offset(20);
            make.top.mas_equalTo(self->_TopView.mas_top).offset(10);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(60);
        }];
       UILabel * dorLabel = [[UILabel alloc]init];
        dorLabel.text = @"￥80000";
        dorLabel.font = [UIFont systemFontOfSize:17];
        [_TopView addSubview:dorLabel];
        [dorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self->_TopView.mas_left).offset(20);
            make.top.mas_equalTo(self->_TopView.mas_top).offset(10);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(60);
        }];
        
        
    }
    
    return _TopView;
    
}
- (void)SetUI{
    _ShopTableView = [[UITableView alloc]init];
    _ShopTableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    _ShopTableView.delegate = self;
    _ShopTableView.dataSource = self;
    [self.view addSubview:_ShopTableView];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
             return self.bannerAd;
            break;
        case 1:
            return self.TopView;
            break;
        default:
            return nil;
            break;
    }
    
    
}
//设置行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 2) {
        return 20;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
//组头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
         return 180;
    }else if (section == 1){
        return 120;
    }
    else{
         return 0;
    }
   
}
//cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    return 140;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

        static NSString *identifier = @"YetTopProidentifier";
        
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
- (void)leftBtnCilck{
    NSLog(@"left");
}
-(void)RightBtnCLick:(UIButton*)btn{
    NSLog(@"right");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)DoorBtnClick:(UIButton *)btn{
    NSLog(@"按钮请求");
}
@end
