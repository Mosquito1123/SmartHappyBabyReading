//
//  AppDelegate.m
//  WordRecognition
//
//  Created by Kino on 19/03/22.
//  Copyright © 2019年 Kino. All rights reserved.
//

#import "AppDelegate.h"
#import <iflyMSC/iflyMSC.h>
#import "Definition.h"
#import "UIConstants.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    //设置sdk的log等级，log保存在下面设置的工作路径中
    [IFlySetting setLogFile:LVL_NONE];
    //打开输出在console的log开关
    [IFlySetting showLogcat:YES];
    //设置sdk的工作路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [paths objectAtIndex:0];
    [IFlySetting setLogFilePath:cachePath];
    //创建语音配置,appid必须要传入，仅执行一次则可
    NSString *initString = [[NSString alloc] initWithFormat:@"appid=%@",APPID_VALUE];
    //所有服务启动前，需要确保执行createUtility
    [IFlySpeechUtility createUtility:initString];
    [SVProgressHUD setBackgroundColor:UIColorFromRGBA(253, 164, 160, 0.3)];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = [[self grabStoryboard] instantiateInitialViewController];
    [self.window makeKeyAndVisible];
    
    //后台注册
    [Bmob registerWithAppKey:@"a08ac7d25b17874eb9fb4f018d739a43"];
    
    return YES;
}

- (UIStoryboard *)grabStoryboard {
    
    UIStoryboard *storyboard;
    if (IS_IPHONE_5) {
        storyboard = [UIStoryboard storyboardWithName:@"Main_5s" bundle:nil];
    } else {
        storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    }
    return storyboard;
}

/*
 4.imageview 用户自己选取
 5.audio
*/


@end
