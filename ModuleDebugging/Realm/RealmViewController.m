//
//  RealmViewController.m
//  ModuleDebugging
//
//  Created by edz on 2019/5/10.
//  Copyright © 2019年 wq. All rights reserved.
//

#import "RealmViewController.h"
#import "CategoryHeader.h"
#import "WXMRealmManager.h"
#import "RealmModel.h"
#import "RealmModel2.h"

@interface RealmViewController ()

@end

@implementation RealmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"Realm";
    
    UIButton * nextButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 60, 60)];
    nextButton.backgroundColor = [UIColor redColor];
    [self.view addSubview:nextButton];
    [nextButton blockWithControlEventTouchUpInsideWithBlock:^{
        RealmModel * model = [RealmModel new];
        model.realmid = @"1";
        model.userid = @"10001";
        model.name = @"王小明2222";
        model.age = 18;
        
        RealmModel * model2 = [RealmModel new];
        model2.realmid = @"2";
        model2.userid = @"10002";
        model2.name = @"王小明33333";
        model2.age = 19;
        
        
        RealmModel * model3 = [RealmModel new];
        model3.realmid = @"3";
        model3.userid = @"10001";
        model3.name = @"王小明33333";
        model3.age = 19;
        
        RealmModel * model4 = [RealmModel new];
        model4.realmid = @"4";
        model4.userid = @"10001";
        model4.name = @"王小明33333";
        model4.age = 19;
        NSArray * arrays = @[model,model2,model3,model4];
//        [[WXMRealmManager sharedInstance] saveRLMObjectsWithArray:arrays];
//        [[WXMRealmManager sharedInstance] removeRLMObjectWithPrimaryKeyValue:@"4" class:RealmModel.class];
//        [[WXMRealmManager sharedInstance] removeRLMObjectWithViceKeyValue:@"10001" class:RealmModel.class];
        [[WXMRealmManager sharedInstance] removeRLMObjectWithViceKey:@"userid" viceKeyValue:@"10001" class:RealmModel.class];
//        [WXMRealmInstance removeRLMObjectWithPrimaryKeyValue:@"3" class:RealmModel.class];
        
        
        
//        RealmModel2 * model20 = [RealmModel2 new];
//        model20.realmid2 = 2;
//        model20.userid = @"10001";
//        [WXMRealmInstance saveRLMObjectWithObj:model20];
//        RealmModel2 * m2 = [WXMRealmInstance objWithPrimaryKeyValue:@2 class:RealmModel2.class];
//        NSLog(@"%@",m2);
        
//        RealmModel * m = [[WXMRealmManager sharedInstance] objWithClass:RealmModel.class primaryKey:@"4"];
//        NSLog(@"%@",m);
//        RealmModel * model5 = [WXMRealmInstance objWithPrimaryKeyValue:@"4" class:RealmModel.class];
//        NSLog(@"%@",model5);
//        NSLog(@"--------------");
        //
//        NSArray * array = [WXMRealmInstance objWithViceKey:@"userid" viceKeyValue:@"10001" class:RealmModel.class];
//
//
//
//        //NSArray * array = [WXMRealmInstance objWithViceKeyValue:@"10001"   class:RealmModel.class];
//        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            NSLog(@"%@",obj);
//        }];
       
    }];
}

@end
