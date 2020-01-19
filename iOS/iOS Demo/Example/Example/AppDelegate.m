//
//  AppDelegate.m
//  Example
//
//  Created by fp on 2019/11/19.
//  Copyright © 2019 FunPlus. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setRootViewController:[ViewController new]];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
