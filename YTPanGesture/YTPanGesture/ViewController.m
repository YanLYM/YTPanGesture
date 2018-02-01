//
//  ViewController.m
//  YTPanGesture
//
//  Created by Max on 2018/2/1.
//  Copyright © 2018年 Max. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,  weak) UIImageView *panImgView;

@end

@implementation ViewController
{
    CGFloat firstX;
    CGFloat firstY;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    UIImageView *imgView = [[UIImageView alloc] init];
    self.panImgView = imgView;
    [self.view addSubview:self.panImgView];
    self.panImgView.frame = CGRectMake(100, 64, 100, 100);
    self.panImgView.image = [UIImage imageNamed:@"icon.png"];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan2:)];
    [self.panImgView addGestureRecognizer:pan];
    self.panImgView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewClick)];
    [self.panImgView addGestureRecognizer:tap];
    
}

- (void)handlePan2:(UIPanGestureRecognizer *)recognizer {
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    CGPoint translatedPoint = [recognizer translationInView:self.view];
    CGFloat x = recognizer.view.center.x + translatedPoint.x;
    CGFloat y = recognizer.view.center.y + translatedPoint.y;
    if (x<(recognizer.view.bounds.size.width/2)) {
        x = recognizer.view.bounds.size.width/2;
    } else if (x>(screenWidth-recognizer.view.bounds.size.width/2)) {
        x = screenWidth-recognizer.view.bounds.size.width/2;
    }
    if (y<(recognizer.view.bounds.size.height/2+64)) {
        y =recognizer.view.bounds.size.height/2+64;
    } else if (y>(screenHeight-recognizer.view.bounds.size.height/2-44)) {
        y = (screenHeight-recognizer.view.bounds.size.height/2-44);
    }
    if (([(UIPanGestureRecognizer *)recognizer state] == UIGestureRecognizerStateEnded) || ([(UIPanGestureRecognizer *)recognizer state] == UIGestureRecognizerStateCancelled)) {
        CGFloat velocityX = (0.2 *[recognizer velocityInView:self.view].x);
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:ABS(velocityX * 0.00002 + 0.2)];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        if (x<screenWidth/2) {
            x = recognizer.view.bounds.size.width/2;
        } else {
            x = screenWidth - recognizer.view.bounds.size.width/2;
        }
        recognizer.view.center = CGPointMake(x, y);
        [UIView commitAnimations];
    } else {
        recognizer.view.center = CGPointMake(x, y);
    }
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
}
- (void)imageViewClick {
    self.view.backgroundColor = [UIColor blueColor];
}

@end
