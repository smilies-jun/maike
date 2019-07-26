
//
//  YJLoginAndReginViewController.m
//  maike
//
//  Created by Apple on 2019/7/22.
//  Copyright © 2019 yj. All rights reserved.
//

#import "YJLoginAndReginViewController.h"
#import "PooCodeView.h"
#import "YJAuthenticationViewController.h"

@interface YJLoginAndReginViewController ()<UITextFieldDelegate>{
    UIButton *loginBtn;
    UIImageView *loginImage;
    
    UIButton *reginBtn;
    UIImageView *reginImage;
    
    
    UITextField *phoneNumberTextField;
    
    UILabel *phoneAndPasswordLabel;
    UITextField *passWordAndCodeNumberTextField;
    
    
    UILabel *phonecodeLabel;
    UITextField *phoneCodeNumberTextField;
    UIImageView *PhoneCodelineImageView;
    
    UILabel *passWordcodeLabel;
    UITextField *passWordNumberTextField;
    UIImageView *PassWordlineImageView;
    
    PooCodeView *pooCodeView;
    

}

@end
@implementation YJLoginAndReginViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.TopView.hidden = YES;

    [self InitUI];
}
-(void)InitUI{
    loginBtn = [[UIButton alloc]init];
    loginBtn.layer.masksToBounds = YES;
    loginBtn.layer.cornerRadius = 5.0f;
    loginBtn.tag = 100;
    loginBtn.selected = YES;
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(LoginClicked:) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [loginBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(20);
        make.top.mas_equalTo(self.view.mas_top).offset(StatusBarHeight+64);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(20);
    }];
    
    loginImage = [[UIImageView alloc]init];
    loginImage.backgroundColor = [UIColor grayColor];
    [self.view addSubview:loginImage];
    [loginImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->loginBtn.mas_left);
        make.top.mas_equalTo(self->loginBtn.mas_bottom);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(2);
    }];
    
    reginBtn = [[UIButton alloc]init];
    reginBtn.tag = 101;
    reginBtn.selected = NO;
    reginBtn.layer.masksToBounds = YES;
    reginBtn.layer.cornerRadius = 5.0f;
    [reginBtn setTitle:@"注册" forState:UIControlStateNormal];
    [reginBtn addTarget:self action:@selector(reginClicked:) forControlEvents:UIControlEventTouchUpInside];
    [reginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [reginBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.view addSubview:reginBtn];
    [reginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->loginBtn.mas_right).offset(10);
        make.top.mas_equalTo(self.view.mas_top).offset(StatusBarHeight+64);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(20);
    }];
    reginImage = [[UIImageView alloc]init];
    reginImage.backgroundColor = [UIColor grayColor];
    [self.view addSubview:reginImage];
    [reginImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->reginBtn.mas_left);
        make.top.mas_equalTo(self->reginBtn.mas_bottom);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(2);
    }];
    UILabel *phoneLabel = [[UILabel alloc]init];
    phoneLabel.text = @"手机号码";
    phoneLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:phoneLabel];
    [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->loginBtn.mas_left).offset(10);
        make.top.mas_equalTo(self->reginImage.mas_bottom).offset(40);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(20);
    }];
    phoneNumberTextField = [[UITextField alloc]init];
    phoneNumberTextField.placeholder = @"请输入手机号码";
    phoneNumberTextField.delegate = self;
    phoneNumberTextField.keyboardType = UIKeyboardTypeNumberPad;
    phoneNumberTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入手机号码" attributes:@{NSForegroundColorAttributeName: colorWithRGB(0.71, 0.75, 0.72)}];
    [self.view addSubview:phoneNumberTextField];
    [phoneNumberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->loginBtn.mas_left).offset(10);
        make.top.mas_equalTo(phoneLabel.mas_bottom).offset(20);
        make.width.mas_equalTo(SCREEN_WIDTH - 60);
        make.height.mas_equalTo(25);
    }];
    UIImageView *PhonelineImageView = [[UIImageView alloc]init];
    PhonelineImageView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:PhonelineImageView];
    [PhonelineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->phoneNumberTextField.mas_left);
        make.top.mas_equalTo(self->phoneNumberTextField.mas_bottom);
        make.width.mas_equalTo(SCREEN_WIDTH - 60);
        make.height.mas_equalTo(0.5);
    }];
    
    phoneAndPasswordLabel = [[UILabel alloc]init];
    phoneAndPasswordLabel.text = @"密码";
    phoneAndPasswordLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:phoneAndPasswordLabel];
    [phoneAndPasswordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->loginBtn.mas_left).offset(10);
        make.top.mas_equalTo(self->phoneNumberTextField.mas_bottom).offset(20);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(20);
    }];
    passWordAndCodeNumberTextField = [[UITextField alloc]init];
    passWordAndCodeNumberTextField.placeholder = @"请输入密码";
    passWordAndCodeNumberTextField.delegate = self;
    passWordAndCodeNumberTextField.keyboardType = UIKeyboardTypeNumberPad;
    passWordAndCodeNumberTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入手机号码" attributes:@{NSForegroundColorAttributeName: colorWithRGB(0.71, 0.75, 0.72)}];
    [self.view addSubview:passWordAndCodeNumberTextField];
    [passWordAndCodeNumberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->loginBtn.mas_left).offset(10);
        make.top.mas_equalTo(self->phoneAndPasswordLabel.mas_bottom).offset(20);
        make.width.mas_equalTo(SCREEN_WIDTH - 60-80);
        make.height.mas_equalTo(25);
    }];
    
    UIImageView *PasslineImageView = [[UIImageView alloc]init];
    PasslineImageView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:PasslineImageView];
    [PasslineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->passWordAndCodeNumberTextField.mas_left);
        make.top.mas_equalTo(self->passWordAndCodeNumberTextField.mas_bottom);
        make.width.mas_equalTo(SCREEN_WIDTH - 60);
        make.height.mas_equalTo(0.5);
    }];
    NSArray *randomArr = @[@"H",@"j",@"q",@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    pooCodeView = [[PooCodeView alloc] initWithFrame:CGRectMake(140, 100, 120, 50) andChangeArray:randomArr];
    //注意:文字高度不能大于poocodeview高度,否则crash
    pooCodeView.textSize = 25;
    //不设置为blackColor
    pooCodeView.textColor = [UIColor redColor];
    [self.view addSubview:pooCodeView];
    [pooCodeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->passWordAndCodeNumberTextField.mas_right);
        make.bottom.mas_equalTo(self->passWordAndCodeNumberTextField.mas_bottom);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(40);
    }];
    
    
    phonecodeLabel = [[UILabel alloc]init];
    phonecodeLabel.text = @"手机验证码";
    phonecodeLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:phonecodeLabel];
    [phonecodeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->loginBtn.mas_left).offset(10);
        make.top.mas_equalTo(self->passWordAndCodeNumberTextField.mas_bottom).offset(20);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(20);
    }];
    phoneCodeNumberTextField = [[UITextField alloc]init];
    phoneCodeNumberTextField.placeholder = @"请输入手机验证码";
    phoneCodeNumberTextField.delegate = self;
    phoneCodeNumberTextField.keyboardType = UIKeyboardTypeNumberPad;
    phoneCodeNumberTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入手机验证码" attributes:@{NSForegroundColorAttributeName: colorWithRGB(0.71, 0.75, 0.72)}];
    [self.view addSubview:phoneCodeNumberTextField];
    [phoneCodeNumberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->loginBtn.mas_left).offset(10);
        make.top.mas_equalTo(self->phonecodeLabel.mas_bottom).offset(20);
        make.width.mas_equalTo(SCREEN_WIDTH - 60-80);
        make.height.mas_equalTo(25);
    }];
    
    PhoneCodelineImageView = [[UIImageView alloc]init];
    PhoneCodelineImageView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:PhoneCodelineImageView];
    [PhoneCodelineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->phoneCodeNumberTextField.mas_left);
        make.top.mas_equalTo(self->phoneCodeNumberTextField.mas_bottom);
        make.width.mas_equalTo(SCREEN_WIDTH - 60);
        make.height.mas_equalTo(0.5);
    }];
    
    passWordcodeLabel = [[UILabel alloc]init];
    passWordcodeLabel.text = @"密码";
    passWordcodeLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:passWordcodeLabel];
    [passWordcodeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->loginBtn.mas_left).offset(10);
        make.top.mas_equalTo(self->phoneCodeNumberTextField.mas_bottom).offset(20);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(20);
    }];
    passWordNumberTextField = [[UITextField alloc]init];
    passWordNumberTextField.placeholder = @"请输入密码";
    passWordNumberTextField.delegate = self;
    passWordNumberTextField.keyboardType = UIKeyboardTypeNumberPad;
    passWordNumberTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入密码" attributes:@{NSForegroundColorAttributeName: colorWithRGB(0.71, 0.75, 0.72)}];
    [self.view addSubview:passWordNumberTextField];
    [passWordNumberTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->loginBtn.mas_left).offset(10);
        make.top.mas_equalTo(self->passWordcodeLabel.mas_bottom).offset(20);
        make.width.mas_equalTo(SCREEN_WIDTH - 60-80);
        make.height.mas_equalTo(25);
    }];
    
    PassWordlineImageView = [[UIImageView alloc]init];
    PassWordlineImageView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:PassWordlineImageView];
    [PassWordlineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self->passWordNumberTextField.mas_left);
        make.top.mas_equalTo(self->passWordNumberTextField.mas_bottom);
        make.width.mas_equalTo(SCREEN_WIDTH - 60);
        make.height.mas_equalTo(0.5);
    }];
    
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];

    [sureBtn setTitle:@"登录" forState:UIControlStateNormal];
    sureBtn.layer.masksToBounds = YES;
    sureBtn.layer.cornerRadius = 5.0f;
    sureBtn.backgroundColor =colorWithRGB(0.95, 0.6, 0.11);
    [sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [sureBtn addTarget:self action:@selector(LoginNextBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view   addSubview:sureBtn];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(20);
        make.right.mas_equalTo(self.view.mas_right).offset(-20);
        make.top.mas_equalTo(self->PassWordlineImageView.mas_bottom);
        make.height.mas_equalTo(40);
    }];
    phonecodeLabel.hidden = YES;
    phoneCodeNumberTextField.hidden = YES;
    PhoneCodelineImageView.hidden = YES;
    passWordcodeLabel.hidden = YES;
    passWordNumberTextField.hidden = YES;
    PassWordlineImageView.hidden = YES;
    pooCodeView.hidden = YES;
}
- (void)LoginClicked:(UIButton *)sender{
    phonecodeLabel.hidden = YES;
    phoneCodeNumberTextField.hidden = YES;
    PhoneCodelineImageView.hidden = YES;
    loginBtn.selected = YES;
    reginBtn.selected = NO;
    passWordcodeLabel.hidden = YES;
    passWordNumberTextField.hidden = YES;
    PassWordlineImageView.hidden = YES;
    pooCodeView.hidden = YES;
    phoneAndPasswordLabel.text = @"密码";
    passWordAndCodeNumberTextField.placeholder = @"请输入密码";
     passWordAndCodeNumberTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入图形验证码" attributes:@{NSForegroundColorAttributeName: colorWithRGB(0.71, 0.75, 0.72)}];
}
- (void)reginClicked:(UIButton *)sender{
    phonecodeLabel.hidden = NO;
    phoneCodeNumberTextField.hidden = NO;
    PhoneCodelineImageView.hidden = NO;
    loginBtn.selected = NO;
    reginBtn.selected = YES;
    passWordcodeLabel.hidden = NO;
    passWordNumberTextField.hidden = NO;
    PassWordlineImageView.hidden = NO;
    pooCodeView.hidden = NO;
    phoneAndPasswordLabel.text = @"验证码";
    passWordAndCodeNumberTextField.placeholder = @"请输入验证码";
    passWordAndCodeNumberTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入验证码" attributes:@{NSForegroundColorAttributeName: colorWithRGB(0.71, 0.75, 0.72)}];
}
- (void)LoginNextBtn{
    if (loginBtn.selected) {
        NSLog(@"login");
    }else{
         NSLog(@"regin");
        YJAuthenticationViewController *vc = [[YJAuthenticationViewController alloc]init];
        [self.navigationController pushViewController:vc animated:NO];
    }
}
@end
