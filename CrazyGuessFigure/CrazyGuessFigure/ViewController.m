//
//  ViewController.m
//  CrazyGuessFigure
//
//  Created by 刘文炎 on 8/8/16.
//  Copyright © 2016 F.V.Rockie. All rights reserved.
//

#import "ViewController.h"
#import "QuestionModel.h"

CGFloat const imgW = 150;

#define screenW [UIScreen mainScreen].bounds.size.width

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *indexLabel;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UIButton *coinBtn;

@property (weak, nonatomic) IBOutlet UIButton *iconBtn;

@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@property (weak, nonatomic) IBOutlet UIView *ansView;

@property (weak, nonatomic) IBOutlet UIView *optView;

@property (weak, nonatomic) NSArray *questions;

@property (nonatomic, assign) int index;

@property (nonatomic, strong) UIButton *mask;

@end

@implementation ViewController

- (NSArray *)questions {
    if (nil == _questions) {
        _questions = [QuestionModel questions];
    }
    return _questions;
}

- (UIButton *)mask {
    if (nil == _mask) {
        _mask = [[UIButton alloc] init];
        _mask.frame = self.view.bounds;
        _mask.alpha = 0.0;
        _mask.backgroundColor = [UIColor blackColor];
        [_mask addTarget:self action:@selector(imgBtnOnclick) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_mask];
    }
    return _mask;
}

- (IBAction)tipBtnOnclick {
}

- (IBAction)helpBtnOnclick {
}

- (IBAction)imgBtnOnclick {
    if (0 == self.mask.alpha) {
        CGFloat scaleX = screenW / imgW;
        CGFloat scaleY = scaleX;
        CGFloat translateY = self.iconBtn.frame.origin.y / scaleX;
        [UIView animateWithDuration:1.0 animations:^{
            self.iconBtn.transform = CGAffineTransformMakeScale(scaleX, scaleY);
            self.iconBtn.transform = CGAffineTransformTranslate(self.iconBtn.transform, 0, translateY);
            self.mask.alpha = 0.5;
            [self.view bringSubviewToFront:self.iconBtn];
        }];
    } else {
        [UIView animateWithDuration:1.0 animations:^{
            self.iconBtn.transform = CGAffineTransformIdentity;
            self.mask.alpha = 0.0;
        }];
    }
}

- (IBAction)nextBtnOnclick {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
