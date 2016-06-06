//
//  JJBaseTextField.h
//  JJBaseTextField
//
//  Created by 金晓浩 on 16/6/6.
//  Copyright © 2016年 XiaoHaoJin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JJBaseTextField : UITextField

/** 左边显示的图片 */
@property (nonatomic, strong) UIImage *leftImage;
/** 提示文字 */
@property (nonatomic, strong) NSString *placeHolderString;
/** 边框颜色 */
@property (nonatomic, strong) UIColor *borderColor;

/** 圆角大小 */
@property (nonatomic, assign) CGFloat cornerRadius;

/** 提示语的颜色 */
@property (nonatomic, strong) UIColor *placeHolderColor;
/** 提示语的字体大小 */
@property (nonatomic, strong) UIFont *placeHolderFont;

/** 前景色(边框、光标、提示文字和输入文字的颜色) */
@property (nonatomic, strong) UIColor *foregroundColor;

/** 默认的高度 */
@property (nonatomic, readonly, assign) CGFloat defaultHeight;

- (instancetype)initWithLeftImage:(UIImage *)leftImage
                      placeholder:(NSString *)placeHolder;

- (instancetype)initWithLeftImage:(UIImage *)leftImage
                      placeholder:(NSString *)placeHolder
                      borderColor:(UIColor *)borderColor;

- (instancetype)initWithLeftImage:(UIImage *)leftImage
                      placeholder:(NSString *)placeHolder
                      borderColor:(UIColor *)borderColor
                     cornerRadius:(CGFloat)cornerRadius;


@end
