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
#import "YJLoginAndReginViewController.h"
#import "YJShopListViewController.h"

@interface YJHomeViewController ()<SDCycleScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
//shop列表N
@property (nonatomic,strong)UITableView *ShopTableView;
//Banner广告
@property(nonatomic,strong) SDCycleScrollView *bannerAd;
//九宫格
@property(nonatomic,strong) UIView *ShopTopView;


@end

@implementation YJHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.title = @"迈克杭州总店";
    //[self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor],
                                                                    //  NSFontAttributeName : [UIFont fontWithName:@"Helvetica-Bold" size:17]}];
    self.view.backgroundColor = [UIColor whiteColor];
    self.TopView.hidden = NO;
  
    YJLoginAndReginViewController *loginVC = [[YJLoginAndReginViewController alloc] init];
    UINavigationController *loginNagition = [[UINavigationController alloc]initWithRootViewController:loginVC];
    loginNagition.navigationBarHidden = YES;
    [self presentViewController:loginNagition animated:NO completion:nil];
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
- (UIView *)ShopTopView{
    if (!_ShopTopView) {
        _ShopTopView = [[UIView alloc]init];
        _ShopTopView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 120);
        _ShopTopView.backgroundColor = [UIColor whiteColor];
        UIButton *DoorBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        DoorBtn.backgroundColor = colorWithRGB(0.95, 0.6, 0.11);
        DoorBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [DoorBtn addTarget:self action:@selector(DoorBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_ShopTopView addSubview:DoorBtn];
        [DoorBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self->_ShopTopView.mas_left).offset(20);
            make.top.mas_equalTo(self->_ShopTopView.mas_top).offset(10);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(60);
        }];
       UILabel * dorLabel = [[UILabel alloc]init];
        dorLabel.text = @"门";
        dorLabel.textAlignment = NSTextAlignmentCenter;
        dorLabel.font = [UIFont systemFontOfSize:17];
        [_ShopTopView addSubview:dorLabel];
        [dorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self->_ShopTopView.mas_left).offset(20);
            make.top.mas_equalTo(DoorBtn.mas_bottom).offset(10);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(20);
        }];
        UIButton *Door1Btn = [UIButton buttonWithType:UIButtonTypeCustom];
        Door1Btn.backgroundColor = colorWithRGB(0.95, 0.6, 0.11);
        Door1Btn.titleLabel.font = [UIFont systemFontOfSize:16];
        [Door1Btn addTarget:self action:@selector(DoorBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_ShopTopView addSubview:Door1Btn];
        [Door1Btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(DoorBtn.mas_right).offset(20);
            make.top.mas_equalTo(self->_ShopTopView.mas_top).offset(10);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(60);
        }];
        UILabel * dor1Label = [[UILabel alloc]init];
        dor1Label.text = @"门";
        dor1Label.textAlignment = NSTextAlignmentCenter;
        dor1Label.font = [UIFont systemFontOfSize:17];
        [_ShopTopView addSubview:dor1Label];
        [dor1Label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Door1Btn.mas_left);
            make.top.mas_equalTo(Door1Btn.mas_bottom).offset(10);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(20);
        }];
        UIButton *Door2Btn = [UIButton buttonWithType:UIButtonTypeCustom];
        Door2Btn.backgroundColor = colorWithRGB(0.95, 0.6, 0.11);
        Door2Btn.titleLabel.font = [UIFont systemFontOfSize:16];
        [Door2Btn addTarget:self action:@selector(DoorBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_ShopTopView addSubview:Door2Btn];
        [Door2Btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Door1Btn.mas_right).offset(20);
            make.top.mas_equalTo(self->_ShopTopView.mas_top).offset(10);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(60);
        }];
        UILabel * dor2Label = [[UILabel alloc]init];
        dor2Label.text = @"门";
        dor2Label.textAlignment = NSTextAlignmentCenter;
        dor2Label.font = [UIFont systemFontOfSize:17];
        [_ShopTopView addSubview:dor2Label];
        [dor2Label mas_makeConstraints:^(MASConstraintMaker *make) {
           make.left.mas_equalTo(Door2Btn.mas_left);
            make.top.mas_equalTo(Door2Btn.mas_bottom).offset(10);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(20);
        }];
        UIButton *Door3Btn = [UIButton buttonWithType:UIButtonTypeCustom];
        Door3Btn.backgroundColor = colorWithRGB(0.95, 0.6, 0.11);
        Door3Btn.titleLabel.font = [UIFont systemFontOfSize:16];
        [Door3Btn addTarget:self action:@selector(DoorBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_ShopTopView addSubview:Door3Btn];
        [Door3Btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Door2Btn.mas_right).offset(20);
            make.top.mas_equalTo(self->_ShopTopView.mas_top).offset(10);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(60);
        }];
        UILabel * dor3Label = [[UILabel alloc]init];
        dor3Label.text = @"门";
        dor3Label.textAlignment = NSTextAlignmentCenter;
        dor3Label.font = [UIFont systemFontOfSize:17];
        [_ShopTopView addSubview:dor3Label];
        [dor3Label mas_makeConstraints:^(MASConstraintMaker *make) {
           make.left.mas_equalTo(Door3Btn.mas_left);
            make.top.mas_equalTo(Door3Btn.mas_bottom).offset(10);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(20);
        }];
        UIButton *Door4Btn = [UIButton buttonWithType:UIButtonTypeCustom];
        Door4Btn.backgroundColor = colorWithRGB(0.95, 0.6, 0.11);
        Door4Btn.titleLabel.font = [UIFont systemFontOfSize:16];
        [Door4Btn addTarget:self action:@selector(DoorBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_ShopTopView addSubview:Door4Btn];
        [Door4Btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Door3Btn.mas_right).offset(20);
            make.top.mas_equalTo(self->_ShopTopView.mas_top).offset(10);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(60);
        }];
        UILabel * dor4Label = [[UILabel alloc]init];
        dor4Label.text = @"门";
        dor4Label.textAlignment = NSTextAlignmentCenter;
        dor4Label.font = [UIFont systemFontOfSize:17];
        [_ShopTopView addSubview:dor4Label];
        [dor4Label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(Door4Btn.mas_left);
            make.top.mas_equalTo(Door4Btn.mas_bottom).offset(10);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(20);
        }];
        
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.backgroundColor = [UIColor grayColor];
        [_ShopTopView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self->_ShopTopView.mas_left).offset(20);
            make.top.mas_equalTo(dor1Label.mas_bottom).offset(10);
            make.width.mas_equalTo(SCREEN_WIDTH - 40);
            make.height.mas_equalTo(70);
        }];
        
        UILabel *HotLabel = [[UILabel alloc]init];
        HotLabel.text = @"热门推荐";
        HotLabel.textAlignment = NSTextAlignmentCenter;
        HotLabel.font = [UIFont systemFontOfSize:18];
        [_ShopTopView addSubview:HotLabel];
        [HotLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(imageView.mas_left);
            make.top.mas_equalTo(imageView.mas_bottom).offset(10);
            make.width.mas_equalTo(160);
            make.height.mas_equalTo(40);
        }];
    }
    
    return _ShopTopView;
    
}
- (void)SetUI{
    _ShopTableView = [[UITableView alloc]init];
    _ShopTableView.frame = CGRectMake(0, StatusBarHeight+64, SCREEN_WIDTH, SCREEN_HEIGHT-StatusBarHeight);
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
            return self.ShopTopView;
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
        return 220;
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
    YJShopListViewController *vc= [[YJShopListViewController alloc]init];
    [self.navigationController   pushViewController:vc animated:NO];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
   
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)DoorBtnClick:(UIButton *)btn{
    NSLog(@"按钮请求");
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
@end
