//
//  ViewController.m
//  customeSearchBar
//
//  Created by 奎章 on 16/6/1.
//  Copyright © 2016年 daquan. All rights reserved.
//

#import "ViewController.h"
#import "CustomeSearchBar.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CustomeSearchBar *custome = [CustomeSearchBar searchBarWithframe:CGRectMake(0, 100, 10, 40)];
    [custome setSearchBarWithTextFieldBgimage:@"baidulogo" WithSearchIcon:@"icon_age_midle" WithButtonTitle:@"取消"];
    custome.delegate = self;
    [self.view addSubview:custome];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)changeText:(NSString*)chanageText{
    NSLog(@"++++++++++%@",chanageText);
}

- (void)clickEvent{
    NSLog(@"11111111111111111111");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
