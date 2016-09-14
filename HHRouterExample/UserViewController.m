//
//  UserViewController.m
//  HHRouterExample
//
//  Created by Light on 14-3-14.
//  Copyright (c) 2014年 Huohua. All rights reserved.
//

#import "UserViewController.h"
#import "HHRouter.h"

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
- (void)storyAction
{
    UIViewController * viewController = [[HHRouter shared] matchController:@"/story/222/mystory"];
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
