//
//  AppDelegate.m
//  HHRouterExample
//
//  Created by Light (lightory@gmail.com) on 2014-03-13.
//  Copyright (c) 2014 Huohua. All rights reserved.
//

#import "AppDelegate.h"
#import "HHRouter.h"
#import "StoryViewController.h"
#import "StoryListViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //self.window.backgroundColor = [UIColor whiteColor];
    //self.window.rootViewController = [[UserViewController alloc] init];
    //[self.window makeKeyAndVisible];
    

    
    /**
     默认情况下，map可以不带scheme，但是若考虑从其他软件/网站跳转到本应用，则注册controller的时候map必须为 scheme:///.../.../...
     测试：可以在Safari中输入  hhrouter2:///fromHtml/story/222/333 回车
     */
    //注册代码布局的页面
    [[HHRouter shared] map:@"hhrouter2:///fromHtml/story/:userId/:userName/" toControllerClass:NSClassFromString(@"StoryViewController")];
    //注册故事版布局的页面
    [[HHRouter shared] map:@"hhrouter2:/storyList/:userId/:userName/" toControllerClass:NSClassFromString(@"StoryListViewController") withStoryBoard:@":storyList"];
    
    return YES;
}
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *, id> *)options {
    
    if ([[HHRouter shared] canRoute:url.absoluteString]) {
        UIViewController * controller = [[HHRouter shared] matchController:[url absoluteString]];
        
        UINavigationController * fuckController = nil;
        if ([self.window.rootViewController isKindOfClass:[UINavigationController class]]) {
            fuckController = (UINavigationController*)self.window.rootViewController;
            
            [fuckController pushViewController:controller animated:YES];
        }
    }
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
