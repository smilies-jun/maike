//
//  YJBaseViewController.h
//  maike
//
//  Created by amin on 2019/7/13.
//  Copyright © 2019 yj. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YJBaseViewController : UIViewController
@property (nonatomic,strong)UIView *TopView;
@property (nonatomic,strong)UIButton *BackButton;
@property (nonatomic,strong)UILabel  *TopTitleLabel;
@property (nonatomic , strong)UISearchController * searchController;


@end

NS_ASSUME_NONNULL_END
