//
//  ViewController.m
//  ModuleDebugging
//
//  Created by edz on 2019/4/30.
//  Copyright © 2019年 wq. All rights reserved.
//
#define KWidth [UIScreen mainScreen].bounds.size.width
#define KHeight [UIScreen mainScreen].bounds.size.height
#define KIPHONE_X ((KHeight == 812.0f) ? YES : NO)
#define KBarHeight ((KIPHONE_X) ? 88.0f : 64.0f)
#import "ViewController.h"
#import "CategoryHeader.h"
#import "WQComponentHeader.h"
#import "WXMWKWebViewController.h"
#import "CTMediator+WXMScanInterface.h"
#import "WXMPhotoViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) NSArray *dataSource;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"组件调试";
    [self.view addSubview:self.mainTableView];
    
    [self.navigationController setNavigationBarColor:[UIColor whiteColor] alpha:1];
    self.navigationController.navigationBar.translucent = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    if (@available(iOS 11.0, *)) {
        self.mainTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }

}

#pragma mark --------------------------------- tableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString * iden = NSStringFromClass(self.class);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden forIndexPath:indexPath];
    cell.textLabel.text = [self.dataSource objectAtIndex:indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString * title = [self.dataSource objectAtIndex:indexPath.row];
    NSString * viewcontroller = @"";
    
    if ([title isEqualToString:@"扫码"]) {
        if ([[CTMediator sharedInstance] cameraPermission]) {
            viewcontroller = @"WXMScanViewController";
            UIViewController * vc =  [[CTMediator sharedInstance] achieveWXMScanViewController];
            [self.navigationController pushViewController:vc animated:YES];
            return;
        }
    }
    
    if ([title isEqualToString:@"相册"]) {
        NSString * urlPermission = @"parameter://WXMPhotoInterFaceProtocol/photoPermission";
        NSString * urlPhotoAlbum = @"present://WXMPhotoInterFaceProtocol/routeAchieveWXMPhotoViewController";
        //if (![[WXMCPRouter resultsOpenUrl:urlPermission] boolValue]) return;
        [WXMCPRouter openUrl:urlPhotoAlbum event_id:^(id _Nullable obj) {
            NSLog(@"%@",obj);
        }];
    }
    
    if ([title isEqualToString:@"弹窗"]) {
        viewcontroller = @"TestPopViewController";
        
    }
    
    if ([title isEqualToString:@"WIFI"]) {
        viewcontroller = @"ViewController";
        [self openSystemSetting];
        return;
    }
    
    if ([title isEqualToString:@"WKWebView"]) {
        viewcontroller = @"ViewController";
        WXMWKWebViewController * wk = [WXMWKWebViewController wkWebViewControllerWithTitle:@"" urlString:@"https://github.com/XiaoMing-Wang?tab=repositories"];
        [self.navigationController pushViewController:wk animated:YES];
        return;
    }
    
    if ([title isEqualToString:@"SELF_MSG"]) {
//        viewcontroller = @"ViewController";
        [WXMCPManger sendEventModule:@"BModule" event:1000 eventObj:@"haha"];
        
        return;
    }
    if ([title isEqualToString:@"Realm"]) {
        viewcontroller = @"RealmViewController";
 
    }
    if ([title isEqualToString:@"相册2"]) {
        WXMPhotoViewController * vc = [WXMPhotoViewController new];
        vc.photoType = WXMPhotoDetailTypeMultiSelect;
        UINavigationController * nav = [[UINavigationController alloc] initWithRootViewController:vc];
        [self.navigationController presentViewController:nav animated:YES completion:nil];
    }
    
    
    UIViewController *vc = [NSClassFromString(viewcontroller) new];
    if (!vc) return;
    if ([title isEqualToString:@"相册"]) {
        UINavigationController * na = [[UINavigationController alloc] initWithRootViewController:vc];
        [self.navigationController presentViewController:na animated:YES completion:nil];
    } else {
        [self.navigationController pushViewController:vc animated:YES];
    }
}
- (void)openSystemSetting {
    //iOS8 才有效
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_8_0
#define SETTING_URL @"app-settings:"
#else
#define SETTING_URL   UIApplicationOpenSettingsURLString
#endif
    
    //  NSLog(UIApplicationOpenSettingsURLString);
    if (version >= 8.0){
        [[UIApplication sharedApplication] openURL:
         [NSURL URLWithString:SETTING_URL]];
    }
}
- (UITableView *)mainTableView {
    if (!_mainTableView) {
        NSString * iden = NSStringFromClass(self.class);
        CGFloat height = KHeight - KBarHeight;
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, KBarHeight, KWidth, height)];
        _mainTableView.rowHeight = 65;
        _mainTableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _mainTableView.tableFooterView = [UIView new];
        _mainTableView.showsVerticalScrollIndicator = NO;
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
        [_mainTableView registerClass:UITableViewCell.class forCellReuseIdentifier:iden];
    }
    return _mainTableView;
}
- (NSArray *)dataSource {
    return @[@"扫码",
             @"相册",
             @"弹窗",
             @"WIFI",
             @"WKWebView",
             @"SELF_MSG",
             @"Realm",
             @"相册2",
             @"SELF",
             @"SELF",
             @"SELF",
             @"SELF",
             @"SELF",
             @"SELF",
             @"SELF"];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSDictionary *attributes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];
}
@end
