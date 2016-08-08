//
//  QueationModel.m
//  CrazyGuessFigure
//
//  Created by 刘文炎 on 8/8/16.
//  Copyright © 2016 F.V.Rockie. All rights reserved.
//

#import "QueationModel.h"

@implementation QueationModel {
    UIImage *_image;
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)questionWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

- (UIImage *)image {
    if (!_image) {
        _image = [UIImage imageNamed:self.icon];
    }
    return _image;
}

+ (NSArray *)questions {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Questions" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
    for (NSDictionary *dict in array) {
        [arrayM addObject:[self questionWithDict:dict]];
    }
    return [arrayM copy];
}

@end
