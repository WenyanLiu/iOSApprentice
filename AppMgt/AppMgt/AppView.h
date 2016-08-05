//
//  AppView.h
//  AppMgt
//
//  Created by 刘文炎 on 8/5/16.
//  Copyright © 2016 F.V.Rockie. All rights reserved.
//

#import <UIKit/UIKit.h>

@class App;

@protocol AppViewDelegate <NSObject>

@optional
- (void)dlClickWithBtn:(UIButton *)btn;

@end

@interface AppView : UIView

@property (nonatomic, strong) App *app;

+ (instancetype)appView;

@property (nonatomic, weak) id<AppViewDelegate> delegate;

@end
