//
//  CountryView.m
//  CountryPicker
//
//  Created by 刘文炎 on 8/15/16.
//  Copyright © 2016 F.V.Rockie. All rights reserved.
//

#import "CountryView.h"
#import "CountryModel.h"

@implementation CountryView

+ (instancetype)countryView {
    return [[[NSBundle mainBundle] loadNibNamed:@"CountryView" owner:self options:nil] lastObject];
}

- (void)setCountryModel:(CountryModel *)countryModel {
    if (_countryModel != countryModel) {
        _countryModel = countryModel;
        self.name.text = _countryModel.name;
        self.icon.image = [UIImage imageNamed:_countryModel.icon];
    }
}

+ (CGFloat)rowHeight {
    return 54;
}

@end
