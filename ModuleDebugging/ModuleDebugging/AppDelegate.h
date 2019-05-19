//
//  AppDelegate.h
//  ModuleDebugging
//
//  Created by edz on 2019/4/30.
//  Copyright © 2019年 wq. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) AVCaptureDevice *device;

@end

