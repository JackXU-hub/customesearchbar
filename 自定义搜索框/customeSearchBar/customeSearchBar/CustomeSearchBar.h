//
//  CustomeSearchBar.h
//  customeSearchBar
//
//  Created by 奎章 on 16/6/1.
//  Copyright © 2016年 daquan. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol customeTablebarDelegate<NSObject>
@optional
- (void)changeText:(NSString*)chanageText;

- (void)clickEvent;
@end

@interface CustomeSearchBar : UIView
@property (nonatomic,assign)id <customeTablebarDelegate>delegate;

+ (instancetype)searchBarWithframe:(CGRect)frame;

- (void)setSearchBarWithTextFieldBgimage:(NSString*)TextFieldBgimage WithSearchIcon:(NSString*)SearchIcon WithButtonTitle:(NSString *)buttonTitle;

@end
