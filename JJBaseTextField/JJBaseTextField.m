//
//  JJBaseTextField.m
//  JJBaseTextField
//
//  Created by 金晓浩 on 16/6/6.
//  Copyright © 2016年 XiaoHaoJin. All rights reserved.
//

#import "JJBaseTextField.h"

#define VIEW_HEIGHT 44.0f
#define FONT [UIFont systemFontOfSize:14]
#define FOREGROUND_COLOR [UIColor grayColor]
//#define FOREGROUND_COLOR [UIColor whiteColor]
#define CORNER_RADIUS 10

@interface JJBaseTextField ()

@property (nonatomic, strong) UIImageView *leftImageView;

@end

@implementation JJBaseTextField


#pragma mark - init
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initSelf];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initSelf];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initSelf];
    }
    return self;
}

- (instancetype)initWithLeftImage:(UIImage *)leftImage placeholder:(NSString *)placeHolder {
    self = [super init];
    if (self) {
        [self initSelfWithLeftImage:leftImage placeholder:placeHolder borderColor:nil cornerRadius:CORNER_RADIUS];
    }
    return self;
}

- (instancetype)initWithLeftImage:(UIImage *)leftImage
                      placeholder:(NSString *)placeHolder
                      borderColor:(UIColor *)borderColor {
    self = [super init];
    if (self) {
        
        [self initSelfWithLeftImage:leftImage placeholder:placeHolder borderColor:borderColor cornerRadius:CORNER_RADIUS];
    }
    return self;
}

- (instancetype)initWithLeftImage:(UIImage *)leftImage
                      placeholder:(NSString *)placeHolder
                      borderColor:(UIColor *)borderColor
                     cornerRadius:(CGFloat)cornerRadius {
    self = [super init];
    if (self) {
        [self initSelfWithLeftImage:leftImage placeholder:placeHolder borderColor:borderColor cornerRadius:cornerRadius];
    }
    return self;
}

- (void)initSelfWithLeftImage:(UIImage *)leftImage
                  placeholder:(NSString *)placeHolder
                  borderColor:(UIColor *)borderColor
                 cornerRadius:(CGFloat)cornerRadius{
    
    [self initSelf];
    
    if (leftImage) {
        self.leftImage = leftImage;
    }
    
    if (placeHolder && placeHolder.length) {
        self.placeHolderString = placeHolder;
    }
    
    if (borderColor) {
        self.borderColor = borderColor;
    }
    
    [self.layer setCornerRadius:cornerRadius];
}

- (void)initSelf {
    
    _foregroundColor = FOREGROUND_COLOR;
    
    // 圆角
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:18];
    // 边框宽度
    [self.layer setBorderWidth:1];
    // 输入字体大小
    self.font = FONT;
    // 提示字体大小
    self.placeHolderFont = FONT;
    
    // 边框
    self.borderColor = FOREGROUND_COLOR;
    // 光标颜色
    self.tintColor = FOREGROUND_COLOR;
    // 输入文字颜色
    self.textColor = FOREGROUND_COLOR;
    
    // 总是显示leftView
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 在init的时候设置这个值没有效果，所以在这里设置了
    if (!_placeHolderColor) {
        self.placeHolderColor = FOREGROUND_COLOR;
    }
}

#pragma mark - set method

- (void)setLeftImage:(UIImage *)leftImage {
    _leftImage = leftImage;
    
    self.leftImageView.image = _leftImage;
    _leftImageView.bounds = CGRectMake(0, 0, VIEW_HEIGHT, VIEW_HEIGHT);
    self.leftView = _leftImageView;
}

- (void)setPlaceHolderString:(NSString *)placeHolderString {
    _placeHolderString = placeHolderString;
    
    self.placeholder = _placeHolderString;
}

- (void)setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    [self.layer setBorderColor:_borderColor.CGColor];
}

- (void)setPlaceHolderColor:(UIColor *)placeHolderColor {
    _placeHolderColor = placeHolderColor;
    
    [self setValue:_placeHolderColor forKeyPath:@"placeholderLabel.textColor"];
}

- (void)setPlaceHolderFont:(UIFont *)placeHolderFont {
    _placeHolderFont = placeHolderFont;
    
    [self setValue:_placeHolderFont forKeyPath:@"_placeholderLabel.font"];
    
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    
    [self.layer setCornerRadius:_cornerRadius];
}

- (void)setForegroundColor:(UIColor *)foregroundColor {
    _foregroundColor = foregroundColor;
    
    // 边框
    self.borderColor = _foregroundColor;
    // 光标颜色
    self.tintColor = _foregroundColor;
    // 提示文字颜色
    self.placeHolderColor = _foregroundColor;
    // 输入文字颜色
    self.textColor = _foregroundColor;
}

#pragma mark - lazy laod

- (UIImageView *)leftImageView {
    if (!_leftImageView) {
        _leftImageView = [UIImageView new];
        _leftImageView.contentMode = UIViewContentModeCenter;
    }
    return _leftImageView;
}

- (CGFloat)defaultHeight {
    return VIEW_HEIGHT;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
