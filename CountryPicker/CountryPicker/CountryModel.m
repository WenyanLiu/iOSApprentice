//
//  CountryModel.m
//  CountryPicker
//
//  Created by 刘文炎 on 8/15/16.
//  Copyright © 2016 F.V.Rockie. All rights reserved.
//

#import "CountryModel.h"

@implementation CountryModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)countryWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
