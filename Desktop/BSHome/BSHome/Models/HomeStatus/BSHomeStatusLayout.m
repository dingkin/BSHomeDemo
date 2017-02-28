//
//  BSHomeStatusLayout.m
//  BSHome
//
//  Created by DING on 17/2/20.
//  Copyright © 2017年 DING. All rights reserved.
//

#import "BSHomeStatusLayout.h"

NSString *const kBSHomeCellAttributedFont = @"BSHomeCellAttributedFont";
NSString *const kBSHomeCellAttributedColor = @"BSHomeCellAttributedColor";
NSString *const kBSHomeCellAttributedText = @"BSHomeCellAttributedText";
NSString *const kBSHomeCellAttributedFrame = @"BSHomeCellAttributedFrame";

NSString *const kBSHomeCellPerviewTypeText = @"text";
NSString *const kBSHomeCellPerviewTypeImage = @"image";
NSString *const kBSHomeCellPerviewTypeVideo = @"video";
NSString *const kBSHomeCellPerviewTypeGif = @"gif";

@implementation BSHomeStatusLayout

- (instancetype)initWithStatus:(BSHomeStatus *)status {
    self = [super init];
    if (self) {
        self.status = status;
        
        [self _layout];
    }
    return self;
}

- (void)_layout {
    [self profileLayout];
    [self textLayout];
    [self perviewLayout];
    [self toolbarLayout];
    [self commentLayout];
}

- (void)profileLayout {
    // 计算avatar frame
    self.avatarFrame = CGRectMake(kBSHomeCellProfileViewMargin,
                                  kBSHomeCellProfileViewPadding,
                                  kBSHomeCellAvatarSize,
                                  kBSHomeCellAvatarSize);
    
    // VIP frame
    self.VIPFrame = CGRectMake(CGRectGetMaxX(self.avatarFrame) - (kBSHomeCellVIPSize / 1.5),
                               CGRectGetMaxY(self.avatarFrame) - kBSHomeCellVIPSize,
                               kBSHomeCellVIPSize,
                               kBSHomeCellVIPSize);
    // 过滤nickname
    NSString *nickname = nil;
    BSUser *user = self.status.u;
    if (user.name.length == 0 ||
        [user.name isKindOfClass:[NSNull class]] ||
        [user.name isEqualToString:@""] ||
        !user.name) {
        nickname = @"";
    } else {
        nickname = user.name;
    }
    
    // 创建nickname的textAttributed
    BOOL isV = self.status.u.is_v;
    NSMutableAttributedString *nicknameText = nil;
    UIColor *nicknameColor = nil;
    NSRange range = NSMakeRange(0, nickname.length);
    UIFont *nicknameFont = [UIFont bsProfileTitleFont];
    NSMutableDictionary *nicknameAttributeds = [NSMutableDictionary dictionary];
    if (isV) {
        nicknameColor = [UIColor bsProfileTitleHighlightedColor];
        
        nicknameText = [[NSMutableAttributedString alloc] initWithString:nickname];
        [nicknameText addAttributes:@{NSForegroundColorAttributeName : nicknameColor,
                                      NSFontAttributeName : nicknameFont}
                              range:range];
        
        NSTextAttachment *nicknameAttachment = [[NSTextAttachment alloc] init];
        nicknameAttachment.image = [UIImage imageNamed:@"nav_title_vip_icon"];
        nicknameAttachment.bounds = CGRectMake(0, 0, kBSHomeCellNicknameHeight - 8, kBSHomeCellNicknameHeight - 10);
        NSAttributedString *imageAttrubuted = [NSAttributedString attributedStringWithAttachment:nicknameAttachment];
        
        [nicknameText appendAttributedString:[[NSAttributedString alloc] initWithString:@" "]];
        [nicknameText appendAttributedString:imageAttrubuted];
    } else {
        nicknameColor = [UIColor bsProfileTitleNormalColor];
        nicknameText = [[NSMutableAttributedString alloc] initWithString:nickname];
        [nicknameText addAttributes:@{NSForegroundColorAttributeName : nicknameColor,
                                      NSFontAttributeName : nicknameFont}
                              range:range];
    }
    // 计算nickname frame
    CGFloat nicknameWidth = 0.0;
    CGFloat nicknameMaxWidth = kScreenWidth / 2;
    CGFloat nicknameTextWidth = [nicknameText boundingRectWithSize:CGSizeMake(HUGE, 0)
                                                           options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                           context:nil].size.width;
    if (nicknameTextWidth >= nicknameMaxWidth) {
        nicknameWidth = nicknameMaxWidth;
    } else {
        nicknameWidth = nicknameTextWidth;
    }
    self.nicknameFrame = CGRectMake(CGRectGetMaxX(self.avatarFrame) + kBSHomeCellProfileViewPadding,
                                    kBSHomeCellProfileViewPadding,
                                    nicknameWidth,
                                    kBSHomeCellNicknameHeight);
    
    // 保存 nickname 的 text、color、font。
    [nicknameAttributeds setValue:nicknameColor forKey:kBSHomeCellAttributedColor];
    [nicknameAttributeds setValue:nicknameFont forKey:kBSHomeCellAttributedFont];
    [nicknameAttributeds setValue:nicknameText forKey:kBSHomeCellAttributedText];
    self.nicknameAttributeds = nicknameAttributeds.mutableCopy;
    
    // 过滤release
    NSString *releaseTime = nil;
    if (self.status.passtime.length == 0 ||
        [self.status.passtime isKindOfClass:[NSNull class]] ||
        [self.status.passtime isEqualToString:@""] ||
        !self.status.passtime) {
        releaseTime = @"";
    } else {
        releaseTime = self.status.passtime;
    }
    // 创建release time 的textAttributed
    UIColor *timeColor = [UIColor bsLightGrayColor];
    UIFont *timeFont = [UIFont bsProfileSubTitleFont];
    NSMutableDictionary *timeAttributeds = [NSMutableDictionary dictionary];
    
    NSMutableAttributedString *timeText = [[NSMutableAttributedString alloc] initWithString:releaseTime];
    [timeText addAttributes:@{NSForegroundColorAttributeName : timeColor,
                              NSFontAttributeName : timeFont}
                      range:NSMakeRange(0, releaseTime.length)];
    // 计算time frame
    CGFloat timeWidth = [timeText boundingRectWithSize:CGSizeMake(nicknameMaxWidth, 0)
                                               options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                               context:nil].size.width;
    self.releaseFrame = CGRectMake(CGRectGetMinX(self.nicknameFrame),
                                   CGRectGetMaxY(self.nicknameFrame),
                                   timeWidth,
                                   kBSHomeCellTimeHeight);
    
    // 保存 time 的 text、color、font。
    [timeAttributeds setValue:timeColor forKey:kBSHomeCellAttributedColor];
    [timeAttributeds setValue:timeFont forKey:kBSHomeCellAttributedFont];
    [timeAttributeds setValue:timeText forKey:kBSHomeCellAttributedText];
    self.releaseAttributeds = timeAttributeds.mutableCopy;
    
    // 计算整个profileView的高度
    self.profileFrame = CGRectMake(0, 0,
                                   kScreenWidth,
                                   CGRectGetMaxY(self.releaseFrame) + kBSHomeCellProfileViewPadding);
    // 计算cell此时的高度
    self.cellHeight = CGRectGetHeight(self.profileFrame);
}

- (void)textLayout {
    // 过滤 text
    NSString *text = nil;
    if (self.status.text.length == 0 ||
        [self.status.text isKindOfClass:[NSNull class]] ||
        [self.status.text isEqualToString:@""] ||
        !self.status.text) {
        return;
    } else {
        text = self.status.text;
    }
    // 创建text的textAttributed
    UIColor *textColor = [UIColor blackColor];
    UIFont *textFont = [UIFont bsTextFont];
    NSMutableDictionary *textAttributeds = [NSMutableDictionary dictionary];
    
    NSMutableAttributedString *textString = [[NSMutableAttributedString alloc] initWithString:text];
    [textString addAttributes:@{NSForegroundColorAttributeName : textColor,
                                NSFontAttributeName : textFont}
                        range:NSMakeRange(0, text.length)];
    // 计算text frame
    CGFloat textMaxWidth = kScreenWidth - (kBSHomeCellProfileViewMargin * 2);
    CGSize textSize = [textString boundingRectWithSize:CGSizeMake(textMaxWidth, HUGE)
                                               options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                               context:nil].size;
    self.textFrame = CGRectMake(kBSHomeCellProfileViewMargin,
                                kBSHomeCellProfileViewPadding,
                                textSize.width,
                                textSize.height);
    
    // 保存 text 的 text、color、font。
    [textAttributeds setValue:textColor forKey:kBSHomeCellAttributedColor];
    [textAttributeds setValue:textFont forKey:kBSHomeCellAttributedFont];
    [textAttributeds setValue:textString forKey:kBSHomeCellAttributedText];
    self.textAttributeds = textAttributeds.mutableCopy;
    
    // 计算整个textView的高度
    self.textViewFrame = CGRectMake(0, CGRectGetMaxY(self.profileFrame),
                                    kScreenWidth,
                                    CGRectGetMaxY(self.textFrame) + kBSHomeCellProfileViewPadding);
    // 计算cell此时的高度
    self.cellHeight += CGRectGetHeight(self.textViewFrame);
    
}

- (void)perviewLayout {
    
    CGFloat perviewMaxWidth = kScreenWidth - (kBSHomeCellPerviewMargin * 2);
    NSString *playCountString = [NSString stringWithFormat:@"%@播放", self.status.video.playcount];
    NSString *durationCountString = [self.status.video.duration timeFormatFromSeconds:[self.status.video.duration integerValue]];
    
    self.perviewFrame = CGRectMake(kBSHomeCellPerviewMargin,
                                   kBSHomeCellPerviewPadding,
                                   perviewMaxWidth,
                                   200);
    self.playFrame = CGRectMake(0, 0, kBSHomeCellPerviewPlaySize, kBSHomeCellPerviewPlaySize);
    
    
    // 创建playCount的textAttributed
    UIColor *playCountColor = [UIColor whiteColor];
    UIFont *playCountFont = [UIFont bsProfileSubTitleFont];
    NSMutableDictionary *playCountAttributeds = [NSMutableDictionary dictionary];
    
    NSMutableAttributedString *playCountText = [[NSMutableAttributedString alloc] initWithString:playCountString];
    [playCountText addAttributes:@{NSForegroundColorAttributeName : playCountColor,
                                   NSFontAttributeName : playCountFont}
                           range:NSMakeRange(0, playCountString.length)];
    // 计算playCount frame
    CGSize playCountSize = [playCountText boundingRectWithSize:CGSizeMake(HUGE, kBSHomeCellTimeHeight)
                                                       options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                       context:nil].size;
    self.playCountFrame = CGRectMake(CGRectGetMinX(self.perviewFrame),
                                     CGRectGetMaxY(self.perviewFrame) - kBSHomeCellTimeHeight,
                                     playCountSize.width,
                                     playCountSize.height);
    
    // 保存 playCount 的 text、color、font。
    [playCountAttributeds setValue:playCountColor forKey:kBSHomeCellAttributedColor];
    [playCountAttributeds setValue:playCountFont forKey:kBSHomeCellAttributedFont];
    [playCountAttributeds setValue:playCountText forKey:kBSHomeCellAttributedText];
    self.playCountAttributeds = playCountAttributeds.mutableCopy;
    
    
    // 创建durationCount的textAttributed
    UIColor *durationCountColor = [UIColor whiteColor];
    UIFont *durationCountFont = [UIFont bsProfileSubTitleFont];
    NSMutableDictionary *durationCountAttributeds = [NSMutableDictionary dictionary];
    
    NSMutableAttributedString *durationCountText = [[NSMutableAttributedString alloc] initWithString:durationCountString];
    [durationCountText addAttributes:@{NSForegroundColorAttributeName : durationCountColor,
                                       NSFontAttributeName : durationCountFont}
                               range:NSMakeRange(0, durationCountString.length)];
    // 计算durationCount frame
    CGSize durationCountSize = [durationCountText boundingRectWithSize:CGSizeMake(HUGE, kBSHomeCellTimeHeight)
                                                               options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                               context:nil].size;
    self.durationFrame = CGRectMake(CGRectGetMaxX(self.perviewFrame) - durationCountSize.width,
                                    CGRectGetMinY(self.playCountFrame),
                                    durationCountSize.width,
                                    durationCountSize.height);
    
    // 保存 duration 的 text、color、font。
    [durationCountAttributeds setValue:durationCountColor forKey:kBSHomeCellAttributedColor];
    [durationCountAttributeds setValue:durationCountFont forKey:kBSHomeCellAttributedFont];
    [durationCountAttributeds setValue:durationCountText forKey:kBSHomeCellAttributedText];
    self.durationAttributeds = durationCountAttributeds.mutableCopy;
    
    
    self.perviewViewFrame = CGRectMake(0, CGRectGetMaxY(self.textViewFrame),
                                       kScreenWidth, CGRectGetMaxY(self.perviewFrame) + kBSHomeCellPerviewPadding);
    
    self.cellHeight += CGRectGetHeight(self.perviewViewFrame);
}

- (void)toolbarLayout {
    
    NSMutableDictionary *likeAttributeds = [NSMutableDictionary dictionary];
    NSMutableDictionary *dislikeAttributeds = [NSMutableDictionary dictionary];
    NSMutableDictionary *shareAttributeds = [NSMutableDictionary dictionary];
    NSMutableDictionary *commentAttributeds = [NSMutableDictionary dictionary];
    
    CGFloat toolbarMaxWidth = (kScreenWidth - (kBSHomeCellToolbarItemPadding * (kBSHomeCellToolbarItemCount + 1))) / kBSHomeCellToolbarItemCount;
    
    UIColor *toolbarColor = [UIColor bsDarkGrayColor];
    UIFont *toobarFont = [UIFont bsProfileSubTitleFont];
    
    self.likeFrame = CGRectMake(kBSHomeCellToolbarItemPadding, 0, toolbarMaxWidth, kBSHomeCellToolbarHeight);
    self.dislikeFrame = CGRectMake(CGRectGetMaxX(self.likeFrame) + kBSHomeCellToolbarItemPadding, 0, toolbarMaxWidth, kBSHomeCellToolbarHeight);
    self.shareFrame = CGRectMake(CGRectGetMaxX(self.dislikeFrame) + kBSHomeCellToolbarItemPadding, 0, toolbarMaxWidth, kBSHomeCellToolbarHeight);
    self.commentFrame = CGRectMake(CGRectGetMaxX(self.shareFrame)  + kBSHomeCellToolbarItemPadding, 0, toolbarMaxWidth, kBSHomeCellToolbarHeight);
    
    [likeAttributeds setValue:toolbarColor forKey:kBSHomeCellAttributedColor];
    [likeAttributeds setValue:toobarFont forKey:kBSHomeCellAttributedFont];
    [likeAttributeds setValue:self.status.up forKey:kBSHomeCellAttributedText];
    
    [dislikeAttributeds setValue:toolbarColor forKey:kBSHomeCellAttributedColor];
    [dislikeAttributeds setValue:toobarFont forKey:kBSHomeCellAttributedFont];
    [dislikeAttributeds setValue:self.status.down forKey:kBSHomeCellAttributedText];
    
    [shareAttributeds setValue:toolbarColor forKey:kBSHomeCellAttributedColor];
    [shareAttributeds setValue:toobarFont forKey:kBSHomeCellAttributedFont];
    [shareAttributeds setValue:self.status.forward forKey:kBSHomeCellAttributedText];
    
    [commentAttributeds setValue:toolbarColor forKey:kBSHomeCellAttributedColor];
    [commentAttributeds setValue:toobarFont forKey:kBSHomeCellAttributedFont];
    [commentAttributeds setValue:self.status.comment forKey:kBSHomeCellAttributedText];
    
    self.likeAttributeds = likeAttributeds.mutableCopy;
    self.dislikeAttributeds = dislikeAttributeds.mutableCopy;
    self.shareAttributeds = shareAttributeds.mutableCopy;
    self.commentAttributeds = commentAttributeds.mutableCopy;
    
    self.toolbarFrame = CGRectMake(0, CGRectGetMaxY(self.perviewViewFrame),
                                   kScreenWidth, kBSHomeCellToolbarHeight + kBSHomeCellPerviewPadding);
    
    self.cellHeight += CGRectGetHeight(self.toolbarFrame);
}

- (void)commentLayout {
    if (self.status.top_comments.count == 0) {
        return;
    }
    CGFloat maxTextWidth = kScreenWidth - (kBSHomeCellProfileViewMargin * 4);
    CGFloat maxViewWidth = kScreenWidth - (kBSHomeCellProfileViewMargin * 2);
    CGFloat totalHeight = 0.0;
    
    NSMutableArray<NSMutableDictionary *> *topCommentAttributeds = [NSMutableArray array];
    
    for (NSInteger i = 0; i < self.status.top_comments.count; i++) {
        BSComment *comment = [self.status.top_comments objectAtIndex:i];
        NSMutableDictionary *commentAttributeds = [NSMutableDictionary dictionary];
        
        NSString *nickname = [NSString stringWithFormat:@"%@:", comment.u.name];
        NSString *text = comment.content;
        UIColor *nicknameColor = [UIColor bsProfileTitleHighlightedColor];
        UIColor *commentColor = [UIColor blackColor];
        UIFont *font = [UIFont bsProfileTitleFont];
        
        if ([comment.cmt_type isEqualToString:@"text"]) {
            NSMutableAttributedString *textString = [[NSMutableAttributedString alloc] init];
            
            NSMutableAttributedString *name = [[NSMutableAttributedString alloc] initWithString:nickname];
            
            NSMutableAttributedString *comment = [[NSMutableAttributedString alloc] initWithString:text];
            
            [textString appendAttributedString:name];
            [textString appendAttributedString:[[NSAttributedString alloc] initWithString:@" "]];
            [textString appendAttributedString:comment];
            
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
            paragraphStyle.lineSpacing = kBSHomeCellCommentLineSpacing;
            
            [textString addAttribute:NSParagraphStyleAttributeName
                               value:paragraphStyle
                               range:NSMakeRange(0, textString.length)];
            [textString addAttribute:NSFontAttributeName
                            value:font
                            range:NSMakeRange(0, textString.length)];
            [textString addAttribute:NSForegroundColorAttributeName
                               value:nicknameColor
                               range:NSMakeRange(0, name.length)];
            [textString addAttribute:NSForegroundColorAttributeName
                               value:commentColor
                               range:NSMakeRange(name.length, comment.length)];
            
            CGSize commentSize = [textString boundingRectWithSize:CGSizeMake(maxTextWidth, HUGE)
                                                          options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                          context:nil].size;
            
            CGRect frame = CGRectMake(kBSHomeCellProfileViewMargin,
                                      kBSHomeCellProfileViewPadding,
                                      commentSize.width,
                                      commentSize.height);
            
            [commentAttributeds setValue:textString forKey:kBSHomeCellAttributedText];
            [commentAttributeds setValue:[NSValue valueWithCGRect:frame] forKey:kBSHomeCellAttributedFrame];
            [commentAttributeds setValue:commentColor forKey:kBSHomeCellAttributedColor];
            [commentAttributeds setValue:font forKey:kBSHomeCellAttributedFont];
            
            [topCommentAttributeds addObject:commentAttributeds];
            
            totalHeight += (CGRectGetHeight(frame) + kBSHomeCellProfileViewPadding * 2);
        } else {
            continue;
        }
    }
    
    self.topCommentAttributeds = topCommentAttributeds.mutableCopy;

    self.commentTableViewFrame = CGRectMake(kBSHomeCellProfileViewMargin,
                                            0,
                                            maxViewWidth,
                                            totalHeight);
    self.commentViewFrame = CGRectMake(0, CGRectGetMaxY(self.toolbarFrame),
                                       kScreenWidth,
                                       CGRectGetHeight(self.commentTableViewFrame) + kBSHomeCellProfileViewPadding);
    
    self.cellHeight += CGRectGetHeight(self.commentViewFrame);
    
}

@end
