//
//  BSHomeTableViewCell.m
//  BSHome
//
//  Created by DING on 17/2/20.
//  Copyright © 2017年 DING. All rights reserved.
//

#import "BSHomeTableViewCell.h"

static NSInteger const kToolbarLikeButtonTag = 1000;
static NSInteger const kToolbarDislikeButtonTag = 2000;
static NSInteger const kToolbarshareButtonTag = 3000;
static NSInteger const kToolbarcommentButtonTag = 4000;

@implementation BSHomeCellProfileView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initProfileView];
    }
    return self;
}

- (void)initProfileView {
    self.avatarImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.avatarImageView.contentMode = UIViewContentModeScaleToFill;
    
    self.VIPImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.VIPImageView.image = [UIImage imageNamed:@"tag_user_vip_icon"];
    self.VIPImageView.hidden = YES;
    
    self.nicknameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.nicknameLabel.numberOfLines = 1;
    
    self.releaseLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.releaseLabel.numberOfLines = 1;
    
    [self addSubview:self.avatarImageView];
    [self addSubview:self.VIPImageView];
    [self addSubview:self.nicknameLabel];
    [self addSubview:self.releaseLabel];
    
}
- (void)fillProfileViewWithLayout:(BSHomeStatusLayout *)layout {
    self.frame = layout.profileFrame;
    self.avatarImageView.frame = layout.avatarFrame;
    self.VIPImageView.frame = layout.VIPFrame;
    self.nicknameLabel.frame = layout.nicknameFrame;
    self.releaseLabel.frame = layout.releaseFrame;
    
    [self.avatarImageView setImageWithURL:[NSURL URLWithString:layout.status.u.header.firstObject] placeholder:nil];
    self.VIPImageView.hidden = !layout.status.u.is_vip;

    self.nicknameLabel.attributedText = layout.nicknameAttributeds[kBSHomeCellAttributedText];
    
    self.releaseLabel.attributedText = layout.releaseAttributeds[kBSHomeCellAttributedText];
}

@end

@implementation BSHomeCellTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initTextView];
    }
    return self;
}

- (void)initTextView {
    self.textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.textLabel.numberOfLines = 0;
    
    [self addSubview:self.textLabel];
}
- (void)fillTextViewWithLayout:(BSHomeStatusLayout *)layout {
    self.frame = layout.textViewFrame;
    self.textLabel.frame = layout.textFrame;
    
    self.textLabel.attributedText = layout.textAttributeds[kBSHomeCellAttributedText];
}

@end

@implementation BSHomeCellPerviewView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initPerviewView];
    }
    return self;
}

- (void)initPerviewView {
    self.contentImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.contentImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.contentImageView.clipsToBounds = YES;
    
    self.playButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.playButton addTarget:self
                        action:@selector(didPressPlayButton:)
              forControlEvents:UIControlEventTouchUpInside];
    [self.playButton setImage:[UIImage imageNamed:@"video-play"] forState:UIControlStateNormal];
    
    self.playCountLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.playCountLabel.numberOfLines = 0;
    
    self.durationLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.durationLabel.numberOfLines = 0;
    
    [self addSubview:self.contentImageView];
    [self addSubview:self.playButton];
    [self addSubview:self.playCountLabel];
    [self addSubview:self.durationLabel];
}
- (void)fillPerviewViewWithLayout:(BSHomeStatusLayout *)layout {
    self.frame = layout.perviewViewFrame;
    self.contentImageView.frame = layout.perviewFrame;
    self.playButton.frame = layout.playFrame;
    self.playCountLabel.frame = layout.playCountFrame;
    self.durationLabel.frame = layout.durationFrame;
    self.playButton.center = self.contentImageView.center;
    
    [self.contentImageView setImageWithURL:[NSURL URLWithString:layout.status.video.thumbnail.firstObject] placeholder:nil];
    
    self.playCountLabel.font = layout.playCountAttributeds[kBSHomeCellAttributedFont];
    self.playCountLabel.attributedText = layout.playCountAttributeds[kBSHomeCellAttributedText];
    
    self.durationLabel.attributedText = layout.durationAttributeds[kBSHomeCellAttributedText];
}

- (void)didPressPlayButton:(UIButton *)playButton {
    
}
@end

@implementation BSHomeCellToolbarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initToolbarView];
    }
    return self;
}

- (void)initToolbarView {
    self.likeImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.likeImageView.image = [UIImage imageNamed:@"comment_ding_icon"];
    self.likeImageView.userInteractionEnabled = YES;
    self.likeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.likeLabel.userInteractionEnabled = YES;
    self.likeLabel.numberOfLines = 0;
    self.likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.likeButton.tag = kToolbarLikeButtonTag;
    [self.likeButton addTarget:self
                        action:@selector(didPressToolbarButton:)
              forControlEvents:UIControlEventTouchUpInside];
    
    self.dislikeImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.dislikeImageView.image = [UIImage imageNamed:@"comment_cai_icon"];
    self.dislikeImageView.userInteractionEnabled = YES;
    self.dislikeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.dislikeLabel.userInteractionEnabled = YES;
    self.dislikeLabel.numberOfLines = 0;
    self.dislikeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.dislikeButton.tag = kToolbarDislikeButtonTag;
    [self.dislikeButton addTarget:self
                        action:@selector(didPressToolbarButton:)
              forControlEvents:UIControlEventTouchUpInside];
    
    self.shareImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.shareImageView.image = [UIImage imageNamed:@"mainCellShare"];
    self.shareImageView.userInteractionEnabled = YES;
    self.shareLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.shareLabel.userInteractionEnabled = YES;
    self.shareLabel.numberOfLines = 0;
    self.shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.shareButton.tag = kToolbarshareButtonTag;
    [self.shareButton addTarget:self
                        action:@selector(didPressToolbarButton:)
              forControlEvents:UIControlEventTouchUpInside];
    
    self.commentImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.commentImageView.image = [UIImage imageNamed:@"mainCellComment"];
    self.commentImageView.userInteractionEnabled = YES;
    self.commentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.commentLabel.userInteractionEnabled = YES;
    self.commentLabel.numberOfLines = 0;
    self.commnetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.commnetButton.tag = kToolbarcommentButtonTag;
    [self.commnetButton addTarget:self
                        action:@selector(didPressToolbarButton:)
              forControlEvents:UIControlEventTouchUpInside];
    
    
    self.likeLabel.textAlignment = self.dislikeLabel.textAlignment = self.shareLabel.textAlignment = self.commentLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.likeButton addSubview:self.likeLabel];
    [self.likeButton addSubview:self.likeImageView];
    [self addSubview:self.likeButton];
    
    [self.dislikeButton addSubview:self.dislikeLabel];
    [self.dislikeButton addSubview:self.dislikeImageView];
    [self addSubview:self.dislikeButton];
    
    [self.shareButton addSubview:self.shareLabel];
    [self.shareButton addSubview:self.shareImageView];
    [self addSubview:self.shareButton];
    
    [self.commnetButton addSubview:self.commentLabel];
    [self.commnetButton addSubview:self.commentImageView];
    [self addSubview:self.commnetButton];
}

- (void)didPressToolbarButton:(UIButton *)button {
    switch (button.tag) {
        case kToolbarLikeButtonTag:
        {
            
        }
            break;
        case kToolbarDislikeButtonTag:
        {
            
        }
            break;
        case kToolbarshareButtonTag:
        {
            
        }
            break;
        case kToolbarcommentButtonTag:
        {
            
        }
            break;
    }
}
- (void)fillToolbarViewWithLayout:(BSHomeStatusLayout *)layout {
    CGFloat maxWidth = layout.likeFrame.size.width / 2;
    CGFloat maxHeight = layout.likeFrame.size.height;
    CGFloat w = 23.0;
    CGFloat h = 20.0;
    CGFloat x = maxWidth - w;
    CGFloat y = (maxHeight - h) / 2;
    CGRect frame = CGRectMake(x, y, w, h);
    
    self.frame = layout.toolbarFrame;
    self.likeButton.frame = layout.likeFrame;
    self.dislikeButton.frame = layout.dislikeFrame;
    self.shareButton.frame = layout.shareFrame;
    self.commnetButton.frame = layout.commentFrame;
    
    self.likeImageView.frame = self.likeLabel.frame = frame;
    self.likeLabel.left = self.likeImageView.right;
    
    self.dislikeImageView.frame = self.dislikeLabel.frame = frame;
    self.dislikeLabel.left = self.dislikeImageView.right;
    
    self.shareImageView.frame = self.shareLabel.frame = frame;
    self.shareLabel.left = self.shareImageView.right;
    
    self.commentImageView.frame = self.commentLabel.frame = frame;
    self.commentLabel.left = self.commentImageView.right;
    
    self.likeLabel.width = self.dislikeLabel.width = self.shareLabel.width = self.commentLabel.width = maxWidth;
    
    self.likeLabel.textColor = layout.likeAttributeds[kBSHomeCellAttributedColor];
    self.likeLabel.font = layout.likeAttributeds[kBSHomeCellAttributedFont];
    self.likeLabel.text = layout.likeAttributeds[kBSHomeCellAttributedText];
    
    self.dislikeLabel.textColor = layout.dislikeAttributeds[kBSHomeCellAttributedColor];
    self.dislikeLabel.font = layout.dislikeAttributeds[kBSHomeCellAttributedFont];
    self.dislikeLabel.text = layout.dislikeAttributeds[kBSHomeCellAttributedText];
    
    self.shareLabel.textColor = layout.shareAttributeds[kBSHomeCellAttributedColor];
    self.shareLabel.font = layout.shareAttributeds[kBSHomeCellAttributedFont];
    self.shareLabel.text = layout.shareAttributeds[kBSHomeCellAttributedText];
    
    self.commentLabel.textColor = layout.commentAttributeds[kBSHomeCellAttributedColor];
    self.commentLabel.font = layout.commentAttributeds[kBSHomeCellAttributedFont];
    self.commentLabel.text = layout.commentAttributeds[kBSHomeCellAttributedText];
}

@end

@implementation BSHomeCommentTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.00];
        
        self.contentLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.contentLabel.numberOfLines = 0;
        self.contentLabel.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:self.contentLabel];
    }
    return self;
}

- (void)fillCellWithLayout:(NSDictionary *)layouts {
    self.contentLabel.frame = [layouts[kBSHomeCellAttributedFrame] CGRectValue];
    self.contentLabel.font = layouts[kBSHomeCellAttributedFont];
    self.contentLabel.attributedText = layouts[kBSHomeCellAttributedText];
}

@end

@implementation BSHomeCellCommentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initCommentView];
    }
    return self;
}

static NSString *const kHomeCommentCellIdentifier = @"homeCommentTableViewCell";

- (void)initCommentView {
    UITableView *homeCellCommentTableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                                         style:UITableViewStylePlain];
    homeCellCommentTableView.dataSource = self;
    homeCellCommentTableView.delegate = self;
    homeCellCommentTableView.showsVerticalScrollIndicator = NO;
    homeCellCommentTableView.showsHorizontalScrollIndicator = NO;
    homeCellCommentTableView.tableFooterView = [[UIView alloc] init];
    homeCellCommentTableView.backgroundColor = [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.00];
    homeCellCommentTableView.scrollEnabled = NO;
    homeCellCommentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [homeCellCommentTableView registerClass:[BSHomeCommentTableViewCell class]
                     forCellReuseIdentifier:kHomeCommentCellIdentifier];
    [self addSubview:self.homeCellCommentTableView = homeCellCommentTableView];
}

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cell.layout.topCommentAttributeds.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BSHomeCommentTableViewCell *homeCommentCell = [tableView dequeueReusableCellWithIdentifier:kHomeCommentCellIdentifier];
    [homeCommentCell fillCellWithLayout:self.cell.layout.topCommentAttributeds[indexPath.row]];
    
    return homeCommentCell;
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGRect frame = [self.cell.layout.topCommentAttributeds[indexPath.row][kBSHomeCellAttributedFrame] CGRectValue];
    return frame.size.height + kBSHomeCellProfileViewPadding * 2;
}

- (void)fillCommentViewWithLayout:(BSHomeStatusLayout *)layout {
    self.frame = layout.commentViewFrame;
    self.homeCellCommentTableView.frame = layout.commentTableViewFrame;
    
    [self.homeCellCommentTableView reloadData];    
}

@end

@implementation BSHomeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self layoutCell];
    }
    return self;
}

- (void)layoutCell {
    
    UIColor *subviewBackgroundColor = [UIColor whiteColor];
    
    self.profileView = [[BSHomeCellProfileView alloc] init];
    self.profileView.backgroundColor = subviewBackgroundColor;
    
    self.textView = [[BSHomeCellTextView alloc] init];
    self.textView.backgroundColor = subviewBackgroundColor;
    
    self.perviewView = [[BSHomeCellPerviewView alloc] init];
    self.profileView.backgroundColor = subviewBackgroundColor;
    
    self.toolbarView = [[BSHomeCellToolbarView alloc] init];
    self.toolbarView.backgroundColor = subviewBackgroundColor;
    
    self.commentView = [[BSHomeCellCommentView alloc] init];
    self.commentView.backgroundColor = subviewBackgroundColor;
    
    self.profileView.cell = self;
    self.textView.cell = self;
    self.perviewView.cell = self;
    self.toolbarView.cell = self;
    self.commentView.cell = self;
    
    [self.contentView addSubview:self.profileView];
    [self.contentView addSubview:self.textView];
    [self.contentView addSubview:self.perviewView];
    [self.contentView addSubview:self.toolbarView];
    [self.contentView addSubview:self.commentView];
}

- (void)fillCellWithLayout:(BSHomeStatusLayout *)layout {
    self.layout = layout;
    [self.profileView fillProfileViewWithLayout:layout];
    [self.textView fillTextViewWithLayout:layout];
    [self.perviewView fillPerviewViewWithLayout:layout];
    [self.toolbarView fillToolbarViewWithLayout:layout];
    [self.commentView fillCommentViewWithLayout:layout];
    
}

@end
