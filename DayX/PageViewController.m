//
//  PageViewController.m
//  DayX
//
//  Created by Gamaliel Tellez on 2/12/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "PageViewController.h"
#import <UIKit/UIKit.h>


@interface PageViewController ()

@property (nonatomic, strong) UIButton *backButton;

@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.backButton = [[UIButton alloc] initWithFrame:CGRectMake(250, 20, 60, 30)];
    [self.backButton setTitle:@"Back" forState:UIControlStateNormal];
    [self.view addSubview:self.backButton];
    [self.backButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(dismissView) forControlEvents:UIControlEventTouchDown];

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismissView {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
