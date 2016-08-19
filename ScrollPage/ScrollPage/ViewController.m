//
//  ViewController.m
//  ScrollPage
//
//  Created by 刘文炎 on 8/18/16.
//  Copyright © 2016 F.V.Rockie. All rights reserved.
//

#import "ViewController.h"
#define screenH [UIScreen mainScreen].bounds.size.height
#define screenW [UIScreen mainScreen].bounds.size.width
CGFloat pageCount = 10;
CGFloat scrollY = 20;
CGFloat pageCtrlWidth = 200;

@interface ViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageCtrl;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initScrollView];
    [self initPageControl];
    [self addTimer];
}

- (void)initScrollView {
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, scrollY, screenW, screenH - scrollY)];
    self.scrollView.delegate = self;
    for (int i = 0; i < pageCount; i++) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(screenW * i, scrollY, screenW, screenH - scrollY)];
        imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"huoying%d", i + 1]];
        [self.scrollView addSubview:imgView];
    }
    self.scrollView.contentSize = CGSizeMake(screenW * pageCount, screenH - scrollY);
    self.scrollView.pagingEnabled = YES;
    [self.view addSubview:self.scrollView];
}

- (void)initPageControl {
    self.pageCtrl = [[UIPageControl alloc] initWithFrame:CGRectMake((screenW - pageCtrlWidth) / 2, screenH - scrollY, pageCtrlWidth, scrollY)];
    self.pageCtrl.numberOfPages = pageCount;
    self.pageCtrl.pageIndicatorTintColor = [UIColor orangeColor];
    self.pageCtrl.currentPageIndicatorTintColor = [UIColor redColor];
    [self.view insertSubview:self.pageCtrl aboveSubview:self.scrollView];
}

- (void)addTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)nextPage {
    NSInteger page = self.pageCtrl.currentPage;
    page++;
    if (page == pageCount) {
        page = 0;
    }
    CGPoint point = CGPointMake(screenW * page, 0);
    [self.scrollView setContentOffset:point animated:YES];
}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger page = scrollView.contentOffset.x / screenW + 0.5;
    self.pageCtrl.currentPage = page;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self removeTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self addTimer];
    });
}

- (void)removeTimer {
    [self.timer invalidate];
    self.timer = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
