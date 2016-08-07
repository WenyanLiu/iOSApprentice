//
//  ViewController.m
//  AppMgt
//
//  Created by 刘文炎 on 8/5/16.
//  Copyright © 2016 F.V.Rockie. All rights reserved.
//

#import "ViewController.h"
#import "AppModel.h"
#import "AppView.h"

#define screenH [UIScreen mainScreen].bounds.size.height
#define screenW [UIScreen mainScreen].bounds.size.width
#define appViewH [AppView appView].bounds.size.height
#define appViewW [AppView appView].bounds.size.width
#define Col 3

@interface ViewController () <AppViewDelegate>

@property (nonatomic, strong) NSArray *appViews;

@end

@implementation ViewController

- (NSArray *)appViews {
    if (!_appViews) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Apps" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dict in array) {
            App *app = [App appWithDict:dict];
            AppView *appView = [AppView appView];
            appView.app = app;
            appView.delegate = self;
            [arrayM addObject:appView];
        }
        _appViews = [arrayM copy];
    }
    return _appViews;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGFloat margin = (screenW - Col * appViewW)/(Col + 1);
    for (int i = 0; i < self.appViews.count; i++) {
        AppView *appView = self.appViews[i];
        int row = i / Col;
        int col = i % Col;
        CGFloat centerX = (margin + appViewW * 0.5) + (margin + appViewW) * col;
        CGFloat centerY = 10 + (margin + appViewH * 0.5) + (margin + appViewH) * row;
        appView.center = CGPointMake(centerX, centerY);
        [self.view addSubview:appView];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - AppViewDelegate

- (void)dlClickWithBtn:(UIButton *)btn {
    AppView *appView = (AppView *)btn.superview;
    NSString *appName = appView.app.name;
    
    UIActivityIndicatorView *activIndView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    activIndView.frame = self.view.bounds;
    
    [activIndView startAnimating];
    [self.view addSubview:activIndView];
    
    UILabel *dlLabel = [[UILabel alloc] init];
    dlLabel.frame = CGRectMake(0, screenH * 0.9, screenW, 20);
    dlLabel.textColor = [UIColor whiteColor];
    dlLabel.textAlignment = NSTextAlignmentCenter;
    dlLabel.text = [NSString stringWithFormat:@"%@ is now downloading...", appName];
    dlLabel.font = [UIFont systemFontOfSize:15.0];
    dlLabel.backgroundColor = [UIColor lightGrayColor];
    dlLabel.alpha = 0.7;
    [activIndView addSubview:dlLabel];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [activIndView stopAnimating];
        
        UILabel *dledLabel = [[UILabel alloc] init];
        dledLabel.frame = CGRectMake(0, screenH * 0.9, screenW, 20);
        dledLabel.textColor = [UIColor whiteColor];
        dledLabel.textAlignment = NSTextAlignmentCenter;
        dledLabel.text = [NSString stringWithFormat:@"%@ is downloaded.", appName];
        dledLabel.font = [UIFont systemFontOfSize:15.0];
        dledLabel.backgroundColor = [UIColor lightGrayColor];
        dledLabel.alpha = 1;
        [self.view addSubview:dledLabel];

        [UIView animateWithDuration:2.0 animations:^{
            dledLabel.alpha = 0;
        } completion:^(BOOL finished) {
            btn.enabled = NO;
            [btn setTitle:@"Downloaded" forState:UIControlStateDisabled];
            [dledLabel removeFromSuperview];
        }];
    });
}

@end
