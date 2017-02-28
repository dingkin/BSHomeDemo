//
//  BSHomeViewController.m
//  BSHome
//
//  Created by DING on 17/2/20.
//  Copyright © 2017年 DING. All rights reserved.
//

#import "BSHomeViewController.h"

#import "BSHomeTableViewCell.h"

#import "BSHomeStatusLayout.h"

static NSString *const kHomeCellIdentifier = @"homeTableViewCell";

@interface BSHomeViewController ()
<
   UITableViewDataSource,
   UITableViewDelegate
>

@property (nonatomic, strong) UITableView *homeTableView;

@property (nonatomic, strong) NSArray<BSHomeStatusLayout *> *homeDataSources;

@end

@implementation BSHomeViewController

#pragma mark life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self layoutHomeUI];
    [self refreshHomeStatus];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark override
- (void)setup {
    [super setup];
    
    self.title = @"~这只是个Demo~";
}

#pragma mark layoutUI 
- (void)layoutHomeUI {
    [self addTableView];
}
- (void)addTableView {
    if (self.homeTableView) {
        return;
    }
    UITableView *homeTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    homeTableView.dataSource = self;
    homeTableView.delegate = self;
    homeTableView.showsVerticalScrollIndicator = NO;
    homeTableView.showsHorizontalScrollIndicator = NO;
    homeTableView.tableFooterView = [[UIView alloc] init];
    homeTableView.backgroundColor = [UIColor whiteColor];
    [homeTableView registerClass:[BSHomeTableViewCell class] forCellReuseIdentifier:kHomeCellIdentifier];
    [self.view addSubview:self.homeTableView = homeTableView];
}

#pragma mark request
- (void)refreshHomeStatus {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        self.homeDataSources = [BSHomeStatus testData];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.homeTableView reloadData];
        });
    });

}

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.homeDataSources.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BSHomeTableViewCell *homeCell = [tableView dequeueReusableCellWithIdentifier:kHomeCellIdentifier];
    [homeCell fillCellWithLayout:self.homeDataSources[indexPath.row]];
    return homeCell;
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.homeDataSources[indexPath.row].cellHeight;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
@end
