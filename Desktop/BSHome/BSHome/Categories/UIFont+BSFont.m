//
//  UIFont+BSFont.m
//  BSHome
//
//  Created by DING on 17/2/20.
//  Copyright © 2017年 DING. All rights reserved.
//

#import "UIFont+BSFont.h"

@implementation UIFont (BSFont)

+ (UIFont *)bsFontWithName:(NSString *)fontName size:(CGFloat)fontSize {
    BOOL isSystemFont = YES;
    if (fontName.length == 0 ||
        [fontName isEqualToString:@""] ||
        [fontName isKindOfClass:[NSNull class]] ||
        !fontName) {
        isSystemFont = NO;
        return [UIFont fontWithName:fontName size:fontSize];
    }
    return [UIFont systemFontOfSize:fontSize];
}

+ (UIFont *)bsNavigationBarTitleFont {
    return [self bsFontWithName:nil size:16.0];
}

+ (UIFont *)bsProfileTitleFont {
    return [self bsFontWithName:nil size:13.0];
}
+ (UIFont *)bsProfileSubTitleFont {
    return [self bsFontWithName:nil size:12.0];
}

+ (UIFont *)bsTextFont {
    return [self bsFontWithName:nil size:15.0];
}
@end
