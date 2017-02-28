//
//  BSBaseViewController.m
//  BSHome
//
//  Created by DING on 17/2/20.
//  Copyright © 2017年 DING. All rights reserved.
//

#import "BSBaseViewController.h"

@interface BSBaseViewController ()

@end

@implementation BSBaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupNavigationBar];
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupNavigationBar {
    self.navigationController.navigationBar.barTintColor = [UIColor bsBarTintColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor bsNavigationBarTitleTextColor], NSFontAttributeName : [UIFont bsNavigationBarTitleFont]}];
}
- (void)setup {
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
