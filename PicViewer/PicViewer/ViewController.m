//
//  ViewController.m
//  PicViewer
//
//  Created by 刘文炎 on 7/31/16.
//  Copyright © 2016 F.V.Rockie. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *navLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriLabel;

@property (weak, nonatomic) IBOutlet UIButton *leftBtn;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@property (nonatomic, assign) int index;

@property (nonatomic, strong) NSArray *imgDict;

@end

@implementation ViewController

- (NSArray *)imgDict {
    if (!_imgDict) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"ImgList.plist" ofType:nil];
        _imgDict = [NSArray arrayWithContentsOfFile:path];
    }
    return _imgDict;
}

- (IBAction)leftBtnOnclick:(UIButton *)sender {
    self.index--;
    [self btnOnclick];
}

- (IBAction)rightBtnOnclick:(id)sender {
    self.index++;
    [self btnOnclick];
}

- (void)btnOnclick {
    self.navLabel.text = [NSString stringWithFormat:@"%d/%d", (self.index+1), self.imgDict.count];
    self.descriLabel.text = self.imgDict[self.index][@"description"];
    self.imgView.image = [UIImage imageNamed:self.imgDict[self.index][@"name"]];
    
    self.leftBtn.enabled = (self.index != 0);
    self.rightBtn.enabled = (self.index != self.imgDict.count-1);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self btnOnclick];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
