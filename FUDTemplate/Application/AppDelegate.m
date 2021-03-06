//
//  AppDelegate.m
//  FUDTemplate
//
//  Created by 兰福东 on 2018/3/30.
//  Copyright © 2018年 兰福东. All rights reserved.
//

#import "AppDelegate.h"
#import "FUDLoginViewController.h"
#import "FUDBaseNavigationController.h"
#import "FUDGuidePageViewController.h"
#import "FUDHomeViewController.h"
#import "FUDDiscoverViewController.h"
#import "FUDMeViewController.h"
#import "FUDTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] init];
    
    [self registeServices];
    [self managerRootViewController];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)registeServices {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(managerRootViewController) name:FUDGuidePageDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(managerRootViewController) name:FUDLoginStatusDidChangeNotification object:nil];
}

- (void)managerRootViewController {
    if ([FUDGuidePageViewController hasShown]) {
        if ([FUDAccountManager currentAccount].loginStatus == FUDLoginStatusLoggedIn) {
            FUDHomeViewController *homeViewController = [[FUDHomeViewController alloc] init];
            FUDBaseNavigationController *homeNavigationController = [[FUDBaseNavigationController alloc] initWithRootViewController:homeViewController];
            homeNavigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"首页" image:nil selectedImage:nil];
            
            FUDDiscoverViewController *discoverViewController = [[FUDDiscoverViewController alloc] init];
            FUDBaseNavigationController *discoverNavigationController = [[FUDBaseNavigationController alloc] initWithRootViewController:discoverViewController];
            discoverNavigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"发现" image:nil selectedImage:nil];
            
            FUDMeViewController *meViewController = [[FUDMeViewController alloc] init];
            FUDBaseNavigationController *meNavigationController = [[FUDBaseNavigationController alloc] initWithRootViewController:meViewController];
            meNavigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的" image:nil selectedImage:nil];
            
            FUDTabBarController *tabBarController = [[FUDTabBarController alloc] init];
            tabBarController.viewControllers = @[homeNavigationController,
                                                 discoverNavigationController,
                                                 meNavigationController];
            
            self.window.rootViewController = tabBarController;
            
        } else {
            FUDLoginViewController *loginVC = [[FUDLoginViewController alloc] init];
            FUDBaseNavigationController *navigationController = [[FUDBaseNavigationController alloc] initWithRootViewController:loginVC];
            self.window.rootViewController = navigationController;
        }
    } else {
        FUDGuidePageViewController *guideViewController = [[FUDGuidePageViewController alloc] init];
        self.window.rootViewController = guideViewController;
    }
}


@end
