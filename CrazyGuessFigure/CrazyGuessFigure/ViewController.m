//
//  ViewController.m
//  CrazyGuessFigure
//
//  Created by 刘文炎 on 8/8/16.
//  Copyright © 2016 F.V.Rockie. All rights reserved.
//

#import "ViewController.h"
#import "QuestionModel.h"

CGFloat const btnW = 35;
CGFloat const btnH = 35;
CGFloat const margin2Btn = 10;
NSInteger const optRow = 3;
NSInteger const optCol = 7;

NSInteger const ACCoin = 200;
NSInteger const WACoin = -200;
NSInteger const tipCoin = -200;

#define imgW self.iconBtn.bounds.size.width
#define screenW [UIScreen mainScreen].bounds.size.width

#define ansBtnColor [UIColor blackColor]

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
    for (UIButton *ansBtn in self.ansView.subviews) {
        [self ansBtnOnclick:ansBtn];
    }
    NSString *ans = [self.questions[self.index] answer];
    NSString *firstWord = [ans substringToIndex:1];
    for (UIButton *optBtn in self.optView.subviews) {
        if ([optBtn.currentTitle isEqualToString:firstWord]) {
            [self optBtnOnclick:optBtn];
            [self coinValue:tipCoin];
            break;
        }
    }
}

- (IBAction)helpBtnOnclick {
#warning noCode
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
    self.index++;
    if (self.index >= self.questions.count) {
        NSLog(@"恭喜通关！");
        self.index--;
        return;
    }
    QuestionModel *question = self.questions[self.index];
    [self setBasicInfo:question];
    [self initAnsBtn:question];
    [self initOptBtn:question];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.index = -1;
    [self nextBtnOnclick];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private method

- (void)setBasicInfo:(QuestionModel *)question {
    self.indexLabel.text = [NSString stringWithFormat:@"%d/%d", self.index + 1, self.questions.count];
    self.titleLabel.text = question.title;
    [self.iconBtn setImage:question.image forState:UIControlStateNormal];
    self.nextBtn.enabled = (self.index != self.questions.count - 1);
}

- (void)initAnsBtn:(QuestionModel *)question {
    for (UIButton *btn in self.ansView.subviews) {
        [btn removeFromSuperview];
    }
    NSInteger ansBtnCount = question.answer.length;
    CGFloat ansW = self.ansView.bounds.size.width;
    CGFloat ansEdgeInset = (ansW - ansBtnCount * btnW - (ansBtnCount - 1) * margin2Btn) * 0.5;
    for (int i = 0; i < ansBtnCount; i++) {
        UIButton *btn = [[UIButton alloc] init];
        CGFloat btnX = ansEdgeInset + (btnW + margin2Btn) * i;
        btn.frame = CGRectMake(btnX, margin2Btn, btnW, btnH);
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_answer"] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_answer_hightlighted"] forState:UIControlStateHighlighted];
        [btn setTitleColor:ansBtnColor forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(ansBtnOnclick:) forControlEvents:UIControlEventTouchUpInside];
        [self.ansView addSubview:btn];
    }
}

-(void)initOptBtn:(QuestionModel *)question {
    int optCount = question.options.count;
    if (self.optView.subviews.count != optCount) {
        CGFloat optW = self.optView.bounds.size.width;
        CGFloat optH = self.optView.bounds.size.height;
        CGFloat optColEdgeInset = (optW - optCol * btnW - (optCol - 1) * margin2Btn) * 0.5;
        CGFloat optRowEdgeInset = (optH - optRow * btnH - (optRow - 1) * margin2Btn) * 0.5;
        for (int i = 0; i < optCount; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            int row = i / optCol;
            int col = i % optCol;
            CGFloat btnX = optColEdgeInset + (btnW + margin2Btn) * col;
            CGFloat btnY = optRowEdgeInset + (btnH + margin2Btn) * row;
            btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
            [btn setBackgroundImage:[UIImage imageNamed:@"btn_answer"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"btn_answer_hightlighted"] forState:UIControlStateHighlighted];
            [btn setTitleColor:ansBtnColor forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(optBtnOnclick:) forControlEvents:UIControlEventTouchUpInside];
            [self.optView addSubview:btn];
        }
    }
    for (int i = 0; i < optCount; i++) {
        UIButton *optBtn = self.optView.subviews[i];
        [optBtn setTitle:question.options[i] forState:UIControlStateNormal];
        optBtn.hidden = NO;
    }
}

#pragma mark - Answer & Option Button Onclick

- (void)ansBtnOnclick:(UIButton *)ansBtn {
    NSString *ansStr = ansBtn.currentTitle;
    if (nil == ansStr) {
        return;
    }
    [ansBtn setTitle:nil forState:UIControlStateNormal];
    for (UIButton *optBtn in self.optView.subviews) {
        if ([ansStr isEqualToString:optBtn.currentTitle] && optBtn.isHidden) {
            optBtn.hidden = NO;
            break;
        }
    }
    if (ansBtn.currentTitleColor != ansBtnColor) {
        for (UIButton *ansBtn in self.ansView.subviews) {
            [ansBtn setTitleColor:ansBtnColor forState:UIControlStateNormal];
        }
        self.optView.userInteractionEnabled = YES;
    }
}

- (void)optBtnOnclick:(UIButton *)optBtn {
    NSString *optStr = optBtn.currentTitle;
    for (UIButton *ansBtn in self.ansView.subviews) {
        if (nil == ansBtn.currentTitle) {
            [ansBtn setTitle:optStr forState:UIControlStateNormal];
            break;
        }
    }
    optBtn.hidden = YES;
    BOOL isFilledUp = YES;
    NSMutableString *strM = [NSMutableString string];
    for (UIButton *ansBtn in self.ansView.subviews) {
        if (nil == ansBtn.currentTitle) {
            isFilledUp = NO;
            break;
        } else {
            [strM appendString:ansBtn.currentTitle];
        }
    }
    if (isFilledUp) {
        self.optView.userInteractionEnabled = NO;
        NSString *ans = [self.questions[self.index] answer];
        if ([strM isEqualToString:ans]) {
            for (UIButton *ansBtn in self.ansView.subviews) {
                [ansBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            }
            [self coinValue:ACCoin];
            self.optView.userInteractionEnabled = YES;
            [self performSelector:@selector(nextBtnOnclick) withObject:nil afterDelay:1.5];
        } else {
            for (UIButton *ansBtn in self.ansView.subviews) {
                [ansBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            }
            [self coinValue:WACoin];
        }
    }
}

#pragma mark - coinValue

-(void)coinValue:(NSInteger)delCoin {
    NSInteger coinCurrent = [self.coinBtn.currentTitle integerValue];
    coinCurrent += delCoin;
    NSString *coinStr = [NSString stringWithFormat:@"%d", coinCurrent];
    [self.coinBtn setTitle:coinStr forState:UIControlStateDisabled];
}

@end
