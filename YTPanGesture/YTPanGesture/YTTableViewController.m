//
//  YTTableViewController.m
//  YTPanGesture
//
//  Created by Max on 2018/3/21.
//  Copyright © 2018年 Max. All rights reserved.
//

#import "YTTableViewController.h"

#import "YTHistogramTableViewCell.h"

#import <Masonry.h>

@interface YTTableViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<NSString *> *dataSource;

@end

@implementation YTTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"柱状图";
    [self.dataSource addObjectsFromArray:@[@"基础动画"]];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [self styleInit];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(100);
        make.width.height.mas_equalTo(375.f);
    }];
}
- (void)styleInit {
    self.view.backgroundColor = [UIColor whiteColor];
//    self.tableView.backgroundColor = [UIColor yellowColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[YTHistogramTableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YTHistogramTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.row<self.dataSource.count) {
        cell.descLabel.text = self.dataSource[indexPath.row];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}
- (NSMutableArray<NSString *> *)dataSource {
    if (!_dataSource) {
        _dataSource = @[].mutableCopy;
    }
    return _dataSource;
}
@end
