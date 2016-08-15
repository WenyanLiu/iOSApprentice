//
//  CountryModel.h
//  CountryPicker
//
//  Created by 刘文炎 on 8/15/16.
//  Copyright © 2016 F.V.Rockie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CountryModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *icon;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)countryWithDict:(NSDictionary *)dict;

@end
