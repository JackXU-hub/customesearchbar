//
//  CustomeSearchBar.m
//  customeSearchBar
//
//  Created by daquan xu on 16/6/1.
//  Copyright © 2016年 daquan. All rights reserved.
//
#define HEIGHT 40
#define WIDTH  [UIScreen mainScreen].bounds.size.width
#import "CustomeSearchBar.h"
#import "UIView+Extension.h"

@implementation CustomeSearchBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.size = CGSizeMake(WIDTH, HEIGHT);
        //self.backgroundColor = [UIColor blueColor];
      
    }
    return self;
}

+ (instancetype)searchBarWithframe:(CGRect)frame
{
    return [[self alloc] initWithFrame:frame];
}


- (void)setSearchBarWithTextFieldBgimage:(NSString*)TextFieldBgimage WithSearchIcon:(NSString*)SearchIcon WithButtonTitle:(NSString *)buttonTitle{
    UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(20, 5, WIDTH - 100, 30)];
    //textfield.background = [UIImage imageNamed:@"android-template"];
    textfield.font = [UIFont systemFontOfSize:15];
    textfield.placeholder = @"请输入查询条件";
    //textfield.backgroundColor = [UIColor orangeColor];
    // 提前在Xcode上设置图片中间拉伸
    textfield.background = [UIImage imageNamed:TextFieldBgimage];
    
    // 通过init初始化的控件大多都没有尺寸
    UIImageView *searchIcon = [[UIImageView alloc] init];
    searchIcon.image = [UIImage imageNamed:SearchIcon];
    // contentMode：default is UIViewContentModeScaleToFill，要设置为UIViewContentModeCenter：使图片居中，防止图片填充整个imageView
    searchIcon.contentMode = UIViewContentModeCenter;
    searchIcon.size = CGSizeMake(30, 30);
    
    textfield.leftView = searchIcon;
    textfield.leftViewMode = UITextFieldViewModeAlways;
    [self addSubview:textfield];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:buttonTitle forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(WIDTH - 70, 5, 50, 30);
    //button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(action:) name:UITextFieldTextDidChangeNotification object:nil];
}
- (void)action:(NSNotification*)noti{
    
    UITextField *textfield=[noti object];
    if (self.delegate&&[self.delegate respondsToSelector:@selector(changeText:)]) {
        [self.delegate changeText:textfield.text];
    }
}

- (void)cancel:(UIButton*)sender{
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(clickEvent)]){
        [self.delegate clickEvent];

    }
   }


- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}



@end
