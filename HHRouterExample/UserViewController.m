//
//  UserViewController.m
//  HHRouterExample
//
//  Created by Light on 14-3-14.
//  Copyright (c) 2014年 Huohua. All rights reserved.
//

#import "UserViewController.h"
#import "HHRouter.h"
#import "StoryViewController.h"

@interface UserViewController ()

@end

@implementation UserViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"User";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Story" style:UIBarButtonItemStylePlain target:self action:@selector(storyAction)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"StoryList" style:UIBarButtonItemStylePlain target:self action:@selector(storyListAction)];
	// Do any additional setup after loading the view.
}
//特别需要注意：由于跳转有可能是init/storyboard，还有可能是routter跳转的init/storyboard，故需要通过param是否为空来区分是否是routter过来的
- (void)storyAction
{
    UIViewController * viewController = [[HHRouter shared] matchController:@"/fromHtml/story/2222/fuckyou?mimei=222"];
    //UIViewController * viewController = [[StoryViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}
- (void)storyListAction
{
    UIViewController * viewController = [[HHRouter shared] matchController:@"/storyList/333/mystoryList"];
    [self.navigationController pushViewController:viewController animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
