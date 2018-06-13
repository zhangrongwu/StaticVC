//
//  ENBaseTableViewCell.m
//  StaticVC_Example
//
//  Created by zhangrongwu on 2018/6/13.
//  Copyright © 2018年 zhangrongwu. All rights reserved.
//

#import "ENBaseTableViewCell.h"
#import "Masonry.h"

@interface ENBaseTableViewCell ()

@property (nonatomic, strong)UISwitch *switchView;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UILabel *subTitleLabel;
@property (nonatomic, strong)UITextField *textField;

@end
@implementation ENBaseTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.subTitleLabel];
        [self.contentView addSubview:self.switchView];
        [self.contentView addSubview:self.textField];
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView.mas_left).offset(15);
    }];
    
    [self.subTitleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
    }];
    
    if([_item isKindOfClass:[ENSettingSwitchItem class]]) {
        [self.switchView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.right.equalTo(self.contentView.mas_right).offset(-15);
        }];
    }
    
    [self.textField mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.right.equalTo(self.mas_right).offset(-15);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(30);
    }];
}

- (void)setItem:(ENCommonItem *)item {
    _item = item;
    [self setUpData];
    [self setUpSwitchView];
}

- (void)setUpData
{
    self.titleLabel.text = self.item.title;
    self.subTitleLabel.text = self.item.subtitle;
}

- (void)setUpSwitchView {
    self.subTitleLabel.hidden = YES;
    if ([_item isKindOfClass:[ENSettingArrowItem class]]) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else if ([_item isKindOfClass:[ENNormailItem class]]) {
        self.subTitleLabel.hidden = NO;
        self.accessoryView = self.subTitleLabel;
    }else if([_item isKindOfClass:[ENSettingSwitchItem class]]) {
        self.accessoryView = self.switchView;
    } else if ([_item isKindOfClass:[ENSettingInputItem class]]) {
        self.accessoryView = self.textField;
        self.textField.hidden = NO;
    } else if ([_item isKindOfClass:[ENSettingNoneItem class]]) {
        self.accessoryView = nil;
    }
}

+(BOOL)isObjEmpty:(id)obj {
    if ([obj isKindOfClass:[NSNull class]] || [obj isEqual:@"null"] || obj == nil || obj == [NSNull null] || [obj isEqual:[NSNull null]] || ![obj isKindOfClass:[NSDictionary class]]) {
        return YES;
    }
    return NO;
}

- (void)topStatusChanged:(UISwitch *)swtch
{
    if (swtch.on) {
        NSLog(@"开1");
    } else {
        NSLog(@"关1");
    }
}

- (void)busyStatusChanged:(UISwitch *)swtch
{
    if (swtch.on) {
        NSLog(@"开2");
    } else {
        NSLog(@"关2");
    }
}

-(UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel
{
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] init];
        _subTitleLabel.font     = [UIFont systemFontOfSize:14];
        _subTitleLabel.textColor = [UIColor blackColor];
        _subTitleLabel.textAlignment = NSTextAlignmentRight;
    }
    return _subTitleLabel;
}

-(UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.layer.borderWidth = 1;
        _textField.layer.borderColor = [UIColor cyanColor].CGColor;
        _textField.layer.masksToBounds = YES;
        _textField.layer.cornerRadius = 5;
        _textField.hidden = YES;
    }
    return _textField;
}

- (UISwitch *)switchView
{
    if (![ENBaseTableViewCell isObjEmpty:_item.parameter]) {
        if (!_switchView) {
            if ([_item.parameter[@"type"] isEqualToString:@"1"]) {
                _switchView = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 40.5, 22)];
                _switchView.on = YES;
                [_switchView addTarget:self action:@selector(topStatusChanged:) forControlEvents:UIControlEventValueChanged];
                _switchView.onTintColor = [UIColor cyanColor];
            } else if ([_item.parameter[@"type"] isEqualToString:@"2"]) {
                _switchView = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 40.5, 22)];
                _switchView.on = YES;
                _switchView.onTintColor = [UIColor redColor];
                [_switchView addTarget:self action:@selector(busyStatusChanged:) forControlEvents:UIControlEventValueChanged];
            }
        }
        return _switchView;
    }
    return nil;
}


@end









