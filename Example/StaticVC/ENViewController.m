//
//  ENViewController.m
//  StaticVC
//
//  Created by zhangrongwu on 06/13/2018.
//  Copyright (c) 2018 zhangrongwu. All rights reserved.
//

#import "ENViewController.h"
#import "Masonry.h"
#import "ENStaticVCHeader.h"
#import "ENDemoViewController.h"
#import "ENBaseTableViewCell.h"

@interface ENViewController()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *dataList;

@end
@implementation ENViewController
#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
    [self setNav];
    [self getData];
}


#pragma mark - UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    ENCommonGroup *group = [self.dataList objectAtIndex:section];
    
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ENCommonGroup *group = [self.dataList objectAtIndex:indexPath.section];
    ENCommonItem *item = [group.items objectAtIndex:indexPath.row];
    static NSString *identifier = @"ENBaseTableViewCell";
    ENBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[ENBaseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.item = item;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ENCommonGroup *group = [self.dataList objectAtIndex:indexPath.section];
    ENCommonItem *item = [group.items objectAtIndex:indexPath.row];
    if (item.option) {
        item.option();
        return;
    } else {
        // 其他操作
    }
    
}

#pragma mark - CustomDelegate
// 外部代理
#pragma mark - event response
// 按钮点击方法
#pragma mark - private methods
// 设置页面布局
- (void)setUI {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}
// 设置navigation
- (void)setNav {
    
}
// 网络请求
- (void)getData {
    
}

#pragma mark - getters and setters
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.userInteractionEnabled = YES;
        _tableView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

-(NSMutableArray *)dataList {
    if (!_dataList) {
        _dataList = [[NSMutableArray alloc] init];
        __weak typeof(self) weakSelf = self;
        ENCommonGroup *groupSection1 = [[ENCommonGroup alloc] init];
        ENCommonItem *none = [ENSettingNoneItem itemWithIcon:@"" title:@"无状态" subtitle:@"" detailClass:nil parameter:@""];
       
        ENCommonItem *settingItem = [ENSettingArrowItem itemWithIcon:@"" title:@"点击进入详情" subtitle:@"副标题" detailClass:[ENDemoViewController class] parameter:nil];
     
        settingItem.option = ^{
            NSLog(@"点击进入相关操作settingItem");
            ENDemoViewController *VC = [[ENDemoViewController alloc] init];
            [weakSelf presentViewController:VC animated:YES completion:nil];
        };
        
        ENCommonItem *switchView = [ENSettingSwitchItem itemWithIcon:@"" title:@"右侧选择" subtitle:@"" detailClass:nil parameter:@{@"type":@"2"}];
        ENCommonItem *switchView2 = [ENSettingSwitchItem itemWithIcon:@"" title:@"右侧选择2" subtitle:@"" detailClass:nil parameter:@{@"type":@"1"}];

        
        groupSection1.items  = @[none,settingItem,switchView,switchView2];
        
        
        ENCommonGroup *groupSection2 = [[ENCommonGroup alloc] init];
        ENNormailItem *input = [ENSettingInputItem itemWithIcon:@"" title:@"可输入内容" subtitle:@"副标题" detailClass:nil
                                                      parameter:nil];
        
        input.option = ^{
            NSLog(@"点击进入相关操作input");
        };
        
        ENCommonGroup *normal = [ENNormailItem itemWithIcon:@"" title:@"title" subtitle:@"输入副标题" detailClass:nil
                                                      parameter:nil];

        
        
        groupSection2.items = @[normal,input];
        
        
        
        
        [_dataList addObject:groupSection1];
        [_dataList addObject:groupSection2];
    }
    return _dataList;
}

@end
