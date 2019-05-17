//
//  RealmModel.m
//  ModuleDebugging
//
//  Created by edz on 2019/5/10.
//  Copyright © 2019年 wq. All rights reserved.
//

#import "RealmModel.h"

@implementation RealmModel

/** 主键 */
+ (NSString *)primaryKey {
    return @"realmid";
}

/** 副键 */
+ (NSString *)viceKey {
    return @"userid";
}
@end
