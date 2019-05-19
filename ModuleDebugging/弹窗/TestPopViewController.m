//
//  TestPopViewController.m
//  ModuleDebugging
//
//  Created by edz on 2019/5/6.
//  Copyright © 2019年 wq. All rights reserved.
//

#import "TestPopViewController.h"
#import "WXMPopupHelp.h"
#import "CategoryHeader.h"

@interface TestPopViewController ()
@property (nonatomic, strong) WXMPopupHelp *popupHelp;
@property (nonatomic, strong) WXMPopupHelp *popupHelp2;
@end

@implementation TestPopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"弹窗";
       
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 270, 300)];
    view.backgroundColor = [UIColor greenColor];
    
    UIView * view2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 270, 300)];
    view2.backgroundColor = [UIColor purpleColor];
    
    UITextField * tf = [[UITextField alloc] initWithFrame:CGRectMake(0, 100, 270, 45)];
    tf.backgroundColor = [UIColor yellowColor];
    [view addSubview:tf];
    
    _popupHelp = [WXMPopupHelp wxmpopupHelpWithContentView:view];
    _popupHelp2 = [WXMPopupHelp wxmpopupHelpWithContentView:view2];
    _popupHelp.viewController = self.navigationController;
    _popupHelp2.viewController = self.navigationController;
    
    UIButton * nextButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 60, 60)];
    nextButton.backgroundColor = [UIColor redColor];
    [self.view addSubview:nextButton];
    [nextButton blockWithControlEventTouchUpInsideWithBlock:^{
        [_popupHelp showPopupView];
    }];
}
- (BOOL)interactivePop {
    return YES;
}
@end
