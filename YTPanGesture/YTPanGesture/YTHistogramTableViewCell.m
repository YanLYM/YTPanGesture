//
//  YTHistogramTableViewCell.m
//  YTPanGesture
//
//  Created by Max on 2018/3/21.
//  Copyright © 2018年 Max. All rights reserved.
//

#import "YTHistogramTableViewCell.h"

@interface YTHistogramTableViewCell ()
@property (nonatomic, strong) UIView *histogramView;

@end
@implementation                                                                                                                                                                                                                                                                         YTHistogramTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self comInit];
    }
    return self;
}
- (void)setWidth:(CGFloat)width {
    _width = width;
    [self.histogramView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(width);
    }];
}
- (void)comInit {
    _histogramView = [[UIView alloc] init];
    _descLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.histogramView];
    [self.contentView addSubview:self.descLabel];
    self.histogramView.backgroundColor = [UIColor blueColor];
    self.descLabel.textColor = [UIColor blueColor];
    [self.histogramView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(0);
    }];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.histogramView.mas_right).offset(8);
        make.centerY.equalTo(self.contentView);
    }];
}
@end
