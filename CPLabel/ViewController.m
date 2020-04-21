//
//  ViewController.m
//  CPLabel
//
//  Created by 凌甜 on 21.4.20.
//  Copyright © 2020 凌甜. All rights reserved.
//

#import "ViewController.h"
#import "CPLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //UIMenuController *menuC = [UIMenuController sharedMenuController];
    //
    [self addSubViews];
}

- (void)addSubViews {
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 200, 50)];
    [self.view addSubview:textField];
    textField.backgroundColor = [UIColor redColor];
    CPLabel *cpLabel = [[CPLabel alloc] initWithFrame:CGRectMake(100, 300, 200, 50)];
    [self.view addSubview:cpLabel];
    cpLabel.text = @"长按复制粘贴哦";
    cpLabel.backgroundColor = [UIColor cyanColor];
    
}


@end
