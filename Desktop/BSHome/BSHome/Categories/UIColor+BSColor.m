//
//  UIColor+BSColor.m
//  BSHome
//
//  Created by DING on 17/2/20.
//  Copyright © 2017年 DING. All rights reserved.
//

#import "UIColor+BSColor.h"

@implementation UIColor (BSColor)

+ (UIColor *)bsBarTintColor {
    return [UIColor colorWithRed:0.99 green:0.19 blue:0.35 alpha:1.00];
}

+ (UIColor *)bsNavigationBarTitleTextColor {
    return [UIColor whiteColor];
}

+ (UIColor *)bsProfileTitleNormalColor {
    return [UIColor colorWithRed:0.96 green:0.29 blue:0.26 alpha:1.00];
}
+ (UIColor *)bsProfileTitleHighlightedColor {
    return [UIColor colorWithRed:0.29 green:0.49 blue:0.67 alpha:1.00];
}

+ (UIColor *)bsLightGrayColor {
    return [UIColor colorWithRed:0.73 green:0.73 blue:0.73 alpha:1.00];
}
+ (UIColor *)bsDarkGrayColor {
    return [UIColor colorWithRed:0.73 green:0.73 blue:0.73 alpha:1.00];
}
@end
