//
//  ViewController.m
//  JJBaseTextField
//
//  Created by 金晓浩 on 16/6/6.
//  Copyright © 2016年 XiaoHaoJin. All rights reserved.
//

#import "ViewController.h"
#import "JJBaseTextField.h"

@interface ViewController () <UITextFieldDelegate, UITextViewDelegate>
@property (nonatomic, strong) JJBaseTextField *loginNameTextField;

@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UILabel *markLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    self.view.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:self.loginNameTextField];
    
    
    _textField = [UITextField new];
    _textField.backgroundColor = [UIColor redColor];
    _textField.frame = CGRectMake(10, 300, 150, 30);
    _textField.tintColor = [UIColor whiteColor];
    [_textField setTextColor:[UIColor whiteColor]];
    [self.view addSubview:_textField];
    
    [self.view addSubview:self.textView];
    [_textView addSubview:self.markLabel];
//    [self showOrHideMarkLabel];
    
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    _loginNameTextField.frame = CGRectMake(10, 250, 200, 30);
    // textView
    CGSize size = self.view.bounds.size;
    CGFloat margin = 12;
    _textView.frame = CGRectMake(margin, margin, size.width - margin*2, 120);
    _markLabel.frame = CGRectMake(10, 50, CGRectGetWidth(_textView.frame), 20);
}

#pragma mark - textView
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:true];
}
#pragma mark - textViewDelegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    
    if ([text isEqualToString:@"\n"])
    { // 判断输入的字是否是回车，即按下return
        // 在这里做响应return键的代码

        return NO; //这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
    }
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView
{
    
    [self showOrHideMarkLabel];
}

- (void)showOrHideMarkLabel
{
    
    if (_textView.text.length)
    {
        _markLabel.hidden = true;
    }
    else
    {
        _markLabel.hidden = false;
    }
}


- (JJBaseTextField *)loginNameTextField
{
    if (!_loginNameTextField) {
        _loginNameTextField = [[JJBaseTextField alloc] initWithLeftImage:[UIImage imageNamed:@"user_white"] placeholder:@"请输入手机号"];
        _loginNameTextField.keyboardType = UIKeyboardTypeNumberPad;
        _loginNameTextField.cornerRadius = 8;
        _loginNameTextField.foregroundColor = [UIColor whiteColor];
        _loginNameTextField.delegate = self;
    }
    return _loginNameTextField;
}

#pragma mark - textView
- (UITextView *)textView
{
    if (!_textView)
    {
        _textView = [UITextView new];
        _textView.delegate = self;
        _textView.backgroundColor = [UIColor grayColor];
        [_textView.layer setMasksToBounds:YES];
        [_textView.layer setCornerRadius:4];
        _textView.returnKeyType = UIReturnKeyDone;
//       [ _textField addTarget:<#(nullable id)#> action:<#(nonnull SEL)#> forControlEvents:UIControlEventEditingChanged]
        
    }
    return _textView;
}

// UIControlEventEditingChanged 内容改变 即执行的方法
//UIControlEventValueChanged
/**
 *  UITextField的UIControlEventValueChanged事件单独注册，你会发现根本不执行，需要多注册一个通知事件，才可以监听到UITextField的值改变事件

 */

- (UILabel *)markLabel
{
    if (!_markLabel)
    {
        _markLabel = [UILabel new];
        _markLabel.text = @"请点击输入";
        _markLabel.textColor = [UIColor blueColor];
        _markLabel.font = [UIFont systemFontOfSize:14];
    }
    return _markLabel;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
