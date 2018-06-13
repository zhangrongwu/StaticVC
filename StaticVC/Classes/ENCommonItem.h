//
//  ENCommonItem.h
//  Pods-StaticVC_Example
//
//  Created by zhangrongwu on 2018/6/13.
//

#import <Foundation/Foundation.h>

typedef void(^ENItemOption)();

@interface ENCommonItem : NSObject
@property (nonatomic, strong)NSString *icon;
@property (nonatomic, strong)NSString *title;
@property (nonatomic, strong)NSString *subtitle;

@property (nonatomic, copy)ENItemOption option;

@property (nonatomic, assign)Class detailClass;

@property (nonatomic, strong)id parameter;

/** 便利构造器 生成一个cell对应的item
 *  icon  左侧图标名称或者你需要的url路径
 *  title 左侧标题
 *  subtitle 右侧标题
 *  detailClass cell点击进入的详情页面控制器
 *  parameter cell点击需要传递的参数
*/
+(id)itemWithIcon:(NSString *)icon title:(NSString *)title  subtitle:(NSString *)subtitle detailClass:(Class)detailClass parameter:(id)parameter;


@end
