//
//  BSHomeStatusLayout.h
//  BSHome
//
//  Created by DING on 17/2/20.
//  Copyright © 2017年 DING. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BSHeader.h"
#import "BSHomeStatus.h"

extern NSString *const kBSHomeCellAttributedFont;
extern NSString *const kBSHomeCellAttributedColor;
extern NSString *const kBSHomeCellAttributedText;
extern NSString *const kBSHomeCellAttributedFrame;

extern NSString *const kBSHomeCellPerviewTypeText;
extern NSString *const kBSHomeCellPerviewTypeImage;
extern NSString *const kBSHomeCellPerviewTypeVideo;
extern NSString *const kBSHomeCellPerviewTypeGif;


static CGFloat const kBSHomeCellProfileViewMargin = 15.0;
static CGFloat const kBSHomeCellProfileViewPadding = 10.0;
static CGFloat const kBSHomeCellProfileViewHeight = 60.0;
static CGFloat const kBSHomeCellAvatarSize = 35.0;
static CGFloat const kBSHomeCellVIPSize = 12.0;
static CGFloat const kBSHomeCellNicknameHeight = 20.0;
static CGFloat const kBSHomeCellTimeHeight = 15.0;

static CGFloat const kBSHomeCellPerviewMargin = 15.0;
static CGFloat const kBSHomeCellPerviewPadding = 10.0;
static CGFloat const kBSHomeCellPerviewVideoHeight = 300.0;
static CGFloat const kBSHomeCellPerviewPlaySize = 55.0;

static NSInteger const kBSHomeCellToolbarItemCount = 4;
static CGFloat const kBSHomeCellToolbarItemPadding = 10.0;
static CGFloat const kBSHomeCellToolbarHeight = 35.0;

static CGFloat const kBSHomeCellCommentLineSpacing = 5.0;

@interface BSHomeStatusLayout : NSObject

@property (nonatomic, assign) CGRect avatarFrame;
@property (nonatomic, assign) CGRect nicknameFrame;
@property (nonatomic, assign) CGRect releaseFrame;
@property (nonatomic, assign) CGRect VIPFrame;
@property (nonatomic, assign) CGRect profileFrame;
@property (nonatomic, strong) NSDictionary *nicknameAttributeds;
@property (nonatomic, strong) NSDictionary *releaseAttributeds;

@property (nonatomic, assign) CGRect textFrame;
@property (nonatomic, assign) CGRect textViewFrame;
@property (nonatomic, strong) NSDictionary *textAttributeds;

@property (nonatomic, assign) CGRect perviewFrame;
@property (nonatomic, assign) CGRect gifFrame;
@property (nonatomic, assign) CGRect playFrame;
@property (nonatomic, assign) CGRect playCountFrame;
@property (nonatomic, assign) CGRect durationFrame;
@property (nonatomic, assign) CGRect perviewViewFrame;
@property (nonatomic, strong) NSDictionary *playCountAttributeds;
@property (nonatomic, strong) NSDictionary *durationAttributeds;

@property (nonatomic, assign) CGRect likeFrame;
@property (nonatomic, assign) CGRect dislikeFrame;
@property (nonatomic, assign) CGRect shareFrame;
@property (nonatomic, assign) CGRect commentFrame;
@property (nonatomic, assign) CGRect toolbarFrame;
@property (nonatomic, strong) NSDictionary *likeAttributeds;
@property (nonatomic, strong) NSDictionary *dislikeAttributeds;
@property (nonatomic, strong) NSDictionary *shareAttributeds;
@property (nonatomic, strong) NSDictionary *commentAttributeds;

@property (nonatomic, assign) CGRect commentTableViewFrame;
@property (nonatomic, assign) CGRect commentViewFrame;
@property (nonatomic, strong) NSArray<NSDictionary *> *topCommentAttributeds;

@property (nonatomic, strong) BSHomeStatus *status;
@property (nonatomic, assign) CGFloat cellHeight;

- (instancetype)initWithStatus:(BSHomeStatus *)status;

@end
