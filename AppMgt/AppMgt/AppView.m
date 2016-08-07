//
//  AppView.m
//  AppMgt
//
//  Created by 刘文炎 on 8/5/16.
//  Copyright © 2016 F.V.Rockie. All rights reserved.
//

#import "AppView.h"
#import "AppModel.h"

@interface AppView ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation AppView

- (IBAction)dlBtnOnclick:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(dlClickWithBtn:)]) {
        [self.delegate dlClickWithBtn:sender];
    }
}

+ (instancetype)appView {
    return [[[NSBundle mainBundle] loadNibNamed:@"AppView" owner:nil options:nil] firstObject];
}

- (void)setApp:(App *)app {
    _app = app;
    self.iconView.image = app.image;
    self.nameLabel.text = app.name;
}

@end
