//
//  AppModel.m
//  AppMgt
//
//  Created by 刘文炎 on 8/5/16.
//  Copyright © 2016 F.V.Rockie. All rights reserved.
//

#import "AppModel.h"

@implementation App {
    UIImage *_image;
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [self init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)appWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

- (UIImage *)image {
    if (!_image) {
        _image = [UIImage imageNamed:self.icon];
    }
    return _image;
}

@end
