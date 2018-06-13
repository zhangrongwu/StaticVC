//
//  ENCommonItem.m
//  Pods-StaticVC_Example
//
//  Created by zhangrongwu on 2018/6/13.
//

#import "ENCommonItem.h"

@implementation ENCommonItem

+(id)itemWithIcon:(NSString *)icon title:(NSString *)title  subtitle:(NSString *)subtitle detailClass:(Class)detailClass parameter:(id)parameter {
    ENCommonItem *item = [[ENCommonItem alloc] init];
    item.icon = icon;
    item.title = title;
    item.subtitle = subtitle;
    item.detailClass = detailClass;
    item.parameter = parameter;
    return item;
}


@end
