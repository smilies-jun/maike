//
//  YJOrderTableViewCell.m
//  maike
//
//  Created by Apple on 2019/7/21.
//  Copyright © 2019 yj. All rights reserved.
//

#import "YJOrderTableViewCell.h"

@implementation YJOrderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)configUI:(NSIndexPath *)indexPath{
    _OrderNumberLabel  = [[UILabel alloc]init];
    _OrderNumberLabel.text= @"订单号:123728738217839";
    _OrderNumberLabel.textColor = colorWithRGB(0.27, 0.27, 0.27);
    _OrderNumberLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_OrderNumberLabel];
    [_OrderNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(20);
        make.left.mas_equalTo(self.contentView.mas_left).offset(20);
        make.width.mas_equalTo(SCREEN_WIDTH-100);
        make.height.mas_equalTo(30);
    }];
    _OrderNumberLabelSate = [[UILabel alloc]init];
    _OrderNumberLabelSate.text= @"已创建";
    _OrderNumberLabelSate.textColor = colorWithRGB(0.27, 0.27, 0.27);
    _OrderNumberLabelSate.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_OrderNumberLabelSate];
    [_OrderNumberLabelSate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_OrderNumberLabel.mas_top);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-20);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(30);
    }];
    UIImageView *lineImageView = [[UIImageView alloc]init];
    lineImageView.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:lineImageView];
    [lineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_OrderNumberLabel.mas_bottom).offset(10);
        make.left.mas_equalTo(self->_OrderNumberLabel.mas_left);
        make.width.mas_equalTo(SCREEN_WIDTH-40);
        make.height.mas_equalTo(1);
    }];
    
    _OrderNameLabel = [[UILabel alloc]init];
    _OrderNameLabel.text= @"客户信息:";
    _OrderNameLabel.textColor = colorWithRGB(0.27, 0.27, 0.27);
    _OrderNameLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_OrderNameLabel];
    [_OrderNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineImageView.mas_bottom).offset(10);
        make.left.mas_equalTo(self.contentView.mas_left).offset(20);
        make.width.mas_equalTo(90);
        make.height.mas_equalTo(20);
    }];
    
    _OrderNamePhoneLabel = [[UILabel alloc]init];
    _OrderNamePhoneLabel.text= @"余军-达达手机打开撒娇的";
    _OrderNamePhoneLabel.textColor = colorWithRGB(0.27, 0.27, 0.27);
    _OrderNamePhoneLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_OrderNamePhoneLabel];
    [_OrderNamePhoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_OrderNameLabel.mas_top);
        make.left.mas_equalTo(self->_OrderNameLabel.mas_right).offset(10);
        make.width.mas_equalTo(SCREEN_WIDTH-140);
        make.height.mas_equalTo(20);
    }];
    _OrderNameAdresssLabel = [[UILabel alloc]init];
    _OrderNameAdresssLabel.text= @"就撒客户登记卡萨很快就的哈手机客户端科技撒谎的:";
    _OrderNameAdresssLabel.textColor = colorWithRGB(0.27, 0.27, 0.27);
    _OrderNameAdresssLabel.font = [UIFont systemFontOfSize:15];
    _OrderNameAdresssLabel.numberOfLines = 0;
    [self.contentView addSubview:_OrderNameAdresssLabel];
    [_OrderNameAdresssLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_OrderNamePhoneLabel.mas_bottom);
        make.left.mas_equalTo(self->_OrderNameLabel.mas_right).offset(10);
        make.width.mas_equalTo(SCREEN_WIDTH-140);
        make.height.mas_equalTo(40);
    }];
    
    _OrderMoneyLabel = [[UILabel alloc]init];
    _OrderMoneyLabel.text= @"订单金额:";
    _OrderMoneyLabel.textColor = colorWithRGB(0.27, 0.27, 0.27);
    _OrderMoneyLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_OrderMoneyLabel];
    [_OrderMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_OrderNameAdresssLabel.mas_bottom).offset(30);
        make.left.mas_equalTo(self.contentView.mas_left).offset(20);
        make.width.mas_equalTo(90);
        make.height.mas_equalTo(20);
    }];
    
    _OrderAllMoneyLabel = [[UILabel alloc]init];
    _OrderAllMoneyLabel.text= @"￥899999";
    _OrderAllMoneyLabel.textColor = colorWithRGB(0.27, 0.27, 0.27);
    _OrderAllMoneyLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:_OrderAllMoneyLabel];
    [_OrderAllMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_OrderMoneyLabel.mas_top);
        make.left.mas_equalTo(self->_OrderMoneyLabel.mas_right);
        make.width.mas_equalTo(SCREEN_WIDTH-140);
        make.height.mas_equalTo(20);
    }];
    
    _OrderPayMoneyLabel = [[UILabel alloc]init];
    _OrderPayMoneyLabel.text= @"已支付";
    _OrderPayMoneyLabel.textColor = colorWithRGB(0.27, 0.27, 0.27);
    _OrderPayMoneyLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:_OrderPayMoneyLabel];
    [_OrderPayMoneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self->_OrderAllMoneyLabel.mas_bottom);
        make.left.mas_equalTo(self->_OrderAllMoneyLabel.mas_left);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(20);
    }];
    
    

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
