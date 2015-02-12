//
//  DetailViewController.m
//  DayX
//
//  Created by Gamaliel Tellez on 2/9/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "DetailViewController.h"


@interface DetailViewController () <UITextFieldDelegate,UITextViewDelegate>
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic,strong) UITextView *textView;
@property (nonatomic, strong) UIButton *clearButton;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textField= [[UITextField alloc] initWithFrame:CGRectMake(20, 70, 200,40)];
    [self.view addSubview:self.textField];
    //self.textField.backgroundColor = [UIColor redColor];
    self.textField.delegate = self;
    [self.textField setBorderStyle:UITextBorderStyleRoundedRect];
    
    self.textView= [[UITextView alloc] initWithFrame:CGRectMake(20, 120, 280, 250)];
    [self.view addSubview:self.textView];
    //self.textView.backgroundColor = [UIColor blueColor];
    self.textView.delegate = self;
    
    self.clearButton = [[UIButton alloc] initWithFrame:CGRectMake(220,70 , 100,40)];
    [self.view addSubview:self.clearButton];
    //self.clearButton.backgroundColor = [UIColor orangeColor];
    [self.clearButton setTitle:@"CLEAR" forState:UIControlStateNormal];
    [self.clearButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.clearButton addTarget:self action:@selector(clearTextFieldAndTextView) forControlEvents: (UIControlEventTouchUpInside)];

}

- (void)clearTextFieldAndTextView {
    //UIButton *clear = sender;
    [self.textField setText:@""];
    [self.textView setText:@""];
}



-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
