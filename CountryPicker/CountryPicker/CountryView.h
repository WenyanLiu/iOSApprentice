//
//  CountryView.h
//  CountryPicker
//
//  Created by 刘文炎 on 8/15/16.
//  Copyright © 2016 F.V.Rockie. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CountryModel;

@interface CountryView : UIView

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIImageView *icon;

@property (nonatomic, strong) CountryModel *countryModel;

+ (instancetype)countryView;

+ (CGFloat)rowHeight;

@end
