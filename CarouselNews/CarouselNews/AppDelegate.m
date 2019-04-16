//
//  AppDelegate.m
//  CarouselNews
//
//  Created by Mac on 2019/4/16.
//  Copyright © 2019 BFL. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "FirstVC.h"
#import "SecondVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
    self.window.backgroundColor = UIColor.whiteColor;
    [self.window makeKeyAndVisible];
    
    SecondVC *vc1 = [[SecondVC alloc] init];
    UINavigationController *naVC1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    naVC1.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:0];
    
    FirstVC *vc2 = [[FirstVC alloc] init];
    UINavigationController *naVC2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    naVC2.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:1];
    
    ViewController *vc3 = [[ViewController alloc] init];
    UINavigationController *naVC3 = [[UINavigationController alloc] initWithRootViewController:vc3];
    naVC3.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:2];
    
    ViewController *vc4= [[ViewController alloc] init];
    UINavigationController *naVC4 = [[UINavigationController alloc] initWithRootViewController:vc4];
    naVC4.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemSearch tag:3];
    
    UITabBarController *tab = [[UITabBarController alloc] init];
    tab.viewControllers = @[naVC1, naVC2, naVC3, naVC4];
    self.window.rootViewController = tab;
    return YES;
}

@end
