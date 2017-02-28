//
//  BSHomeStatus.h
//  BSHome
//
//  Created by DING on 17/2/20.
//  Copyright © 2017年 DING. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class BSHomeStatusLayout;

// 所有的property都是直接copy后台数据字段名的（论编程命名的重要性~~）。。。。
@interface BSUser : NSObject

@property (nonatomic, strong) NSArray<NSString *> *header;
@property (nonatomic, copy) NSString *uid;
@property (nonatomic, assign) BOOL is_vip;
@property (nonatomic, assign) BOOL is_v;
@property (nonatomic, copy) NSString *room_url;
@property (nonatomic, copy) NSString *room_name;
@property (nonatomic, copy) NSString *room_role;
@property (nonatomic, copy) NSString *room_icon;
@property (nonatomic, copy) NSString *name;

@end

@interface BSVideo : NSObject

@property (nonatomic, strong) NSArray<NSString *> *video;
@property (nonatomic, strong) NSArray<NSString *> *thumbnail;
@property (nonatomic, strong) NSArray<NSString *> *thumbnail_small;
@property (nonatomic, copy) NSString *playfcount;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, copy) NSString *duration;
@property (nonatomic, copy) NSString *playcount;

@end

@interface BSComment : NSObject

@property (nonatomic, copy) NSString *status;
@property (nonatomic, assign) CGFloat voicetime;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, strong) BSUser *u;
@property (nonatomic, copy) NSString *cmt_type;
@property (nonatomic, copy) NSString *precid;
@property (nonatomic, copy) NSString *content;

@end

@interface BSHomeStatus : NSObject

@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSString *comment;
@property (nonatomic, copy) NSString *bookmark;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *passtime;
@property (nonatomic, copy) NSString *up;
@property (nonatomic, copy) NSString *down;
@property (nonatomic, copy) NSString *forward;
@property (nonatomic, strong) BSUser *u;
@property (nonatomic, strong) BSVideo *video;
@property (nonatomic, strong) NSArray<BSComment *> *top_comments;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *index;

// test data
+ (NSArray<BSHomeStatusLayout *> *)testData;

@end
