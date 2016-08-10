//
//  ViewController.m
//  CrazyGuessFigure
//
//  Created by 刘文炎 on 8/8/16.
//  Copyright © 2016 F.V.Rockie. All rights reserved.
//

#import "ViewController.h"

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

- (IBAction)tipBtnOnclick {
}

- (IBAction)helpBtnOnclick {
}

- (IBAction)imgBtnOnclick {
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
