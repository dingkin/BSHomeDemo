//
//  BSHomeTableViewCell.h
//  BSHome
//
//  Created by DING on 17/2/20.
//  Copyright © 2017年 DING. All rights reserved.
//

#import "BSBaseTableViewCell.h"

#import "BSHomeStatusLayout.h"

@class BSHomeTableViewCell;

@interface BSHomeCellProfileView : UIView

@property (nonatomic, strong) UIImageView *avatarImageView;

@property (nonatomic, strong) UIImageView *VIPImageView;

@property (nonatomic, strong) UILabel *nicknameLabel;

@property (nonatomic, strong) UILabel *releaseLabel;

@property (nonatomic, weak) BSHomeTableViewCell *cell;

- (void)fillProfileViewWithLayout:(BSHomeStatusLayout *)layout;

@end

@interface BSHomeCellTextView : UIView

@property (nonatomic, strong) UILabel *textLabel;

@property (nonatomic, weak) BSHomeTableViewCell *cell;

- (void)fillTextViewWithLayout:(BSHomeStatusLayout *)layout;

@end

@interface BSHomeCellPerviewView : UIView

@property (nonatomic, strong) UIImageView *contentImageView;

@property (nonatomic, strong) UIButton *playButton;

@property (nonatomic, strong) UILabel *playCountLabel;

@property (nonatomic, strong) UILabel *durationLabel;

@property (nonatomic, weak) BSHomeTableViewCell *cell;

- (void)fillPerviewViewWithLayout:(BSHomeStatusLayout *)layout;

@end

@interface BSHomeCellToolbarView : UIView

@property (nonatomic, strong) UIButton *likeButton;
@property (nonatomic, strong) UIImageView *likeImageView;
@property (nonatomic, strong) UILabel *likeLabel;

@property (nonatomic, strong) UIButton *dislikeButton;
@property (nonatomic, strong) UIImageView *dislikeImageView;
@property (nonatomic, strong) UILabel *dislikeLabel;

@property (nonatomic, strong) UIButton *shareButton;
@property (nonatomic, strong) UIImageView *shareImageView;
@property (nonatomic, strong) UILabel *shareLabel;

@property (nonatomic, strong) UIButton *commnetButton;
@property (nonatomic, strong) UIImageView *commentImageView;
@property (nonatomic, strong) UILabel *commentLabel;

@property (nonatomic, weak) BSHomeTableViewCell *cell;

- (void)fillToolbarViewWithLayout:(BSHomeStatusLayout *)layout;

@end

@interface BSHomeCommentTableViewCell : BSBaseTableViewCell

@property (nonatomic, strong) UILabel *contentLabel;

@end

@interface BSHomeCellCommentView : UIView <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *homeCellCommentTableView;

@property (nonatomic, weak) BSHomeTableViewCell *cell;

- (void)fillCommentViewWithLayout:(BSHomeStatusLayout *)layout;

@end

@interface BSHomeTableViewCell : BSBaseTableViewCell

@property (nonatomic, strong) BSHomeCellProfileView *profileView;

@property (nonatomic, strong) BSHomeCellTextView *textView;

@property (nonatomic, strong) BSHomeCellPerviewView *perviewView;

@property (nonatomic, strong) BSHomeCellToolbarView *toolbarView;

@property (nonatomic, strong) BSHomeCellCommentView *commentView;

@property (nonatomic, strong) BSHomeStatusLayout *layout;

- (void)fillCellWithLayout:(BSHomeStatusLayout *)layout;

@end
