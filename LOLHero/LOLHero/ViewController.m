//
//  ViewController.m
//  LOLHero
//
//  Created by 刘文炎 on 8/1/16.
//  Copyright © 2016 F.V.Rockie. All rights reserved.
//

#import "ViewController.h"
#import "Hero.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *heros;

@end

@implementation ViewController

- (NSArray *)heros {
    if (!_heros) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Heros" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        for (NSDictionary *dict in array) {
            Hero *hero = [Hero heroWithDict:dict];
            [arrayM addObject:hero];
        }
        _heros = [arrayM copy];
    }
    return _heros;
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
