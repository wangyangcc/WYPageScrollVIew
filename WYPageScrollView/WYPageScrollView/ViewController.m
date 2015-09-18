//
//  ViewController.m
//  WYPageScrollView
//
//  Created by wangyangyang on 15/9/17.
//  Copyright (c) 2015年 wang yangyang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - event method

- (IBAction)noPagingEnabledTaped:(id)sender
{
    [self.navigationController pushViewController:[NSClassFromString(@"OneViewController") new] animated:YES];
}

- (IBAction)pagingEnabledSmallTaped:(id)sender
{
    [self.navigationController pushViewController:[NSClassFromString(@"TwoViewController") new] animated:YES];
}

- (IBAction)pageingEnabledBigTaped:(id)sender
{
    [self.navigationController pushViewController:[NSClassFromString(@"ThreeViewController") new] animated:YES];
}

@end
