//
//  FUDSettingsViewController.m
//  FUDTemplate
//
//  Created by 兰福东 on 2018/4/27.
//  Copyright © 2018年 兰福东. All rights reserved.
//

#import "FUDSettingsViewController.h"

@interface FUDSettingsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) UITableView *tableView;
@property (nonatomic, copy) NSArray<NSString *> *settings;

@end

@implementation FUDSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"设置";
    
    [self initSubviews];
    [self initDatas];
}

- (void)viewDidLayoutSubviews {
    self.tableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
}

- (void)initSubviews {
    self.tableView = [[UITableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    self.tableView.tableFooterView = [UIView new];
    
    [self.view addSubview:self.tableView];
}

- (void)initDatas {
    self.settings = [NSArray arrayWithObjects:@"关于", @"退出登录", nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.settings.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    }
    
    cell.textLabel.text = self.settings[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 1) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"确认退出登录?" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        [alertController addAction:[UIAlertAction actionWithTitle:@"退出登录" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            [[FUDAccountManager currentAccount] clearAccountInfo];
            [[NSNotificationCenter defaultCenter] postNotificationName:FUDLoginStatusDidChangeNotification object:nil userInfo:@{fud_loginStatusKey: @(FUDLoginStatusLoggedOut)}];
        }]];
        [alertController addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

@end
