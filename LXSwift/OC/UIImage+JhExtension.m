//
//  UIImage+JhExtension.m
//  JhSwiftDemo
//
//  Created by Jh on 2019/4/26.
//  Copyright © 2019 Jh. All rights reserved.
//

#import "UIImage+JhExtension.h"

@implementation UIImage (JhExtension)

#pragma mark - 图片重绘颜色

- (UIImage *)Jh_imageWithTintColor:(UIColor *)tintColor {
    //kCGBlendModeDestinationIn  保留透明度信息并绘制成目标色
    return [self Jh_imageWithTintColor:tintColor blendMode:kCGBlendModeDestinationIn];
}

- (UIImage *)Jh_imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode {
    //We want to keep alpha, set opaque to NO; Use 0.0f for scale to use the scale factor of the device’s main screen.
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    [tintColor setFill];
    CGRect bounds = CGRectMake(0, 0, self.size.width, self.size.height);
    UIRectFill(bounds);
    //Draw the tinted image in context
    [self drawInRect:bounds blendMode:blendMode alpha:1.0f];
    if (blendMode != kCGBlendModeDestinationIn) {
        [self drawInRect:bounds blendMode:kCGBlendModeDestinationIn alpha:1.0f];
    }
    UIImage *tintedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return tintedImage;
}

@end
