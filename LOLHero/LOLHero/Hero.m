//
//  Hero.m
//  LOLHero
//
//  Created by 刘文炎 on 8/2/16.
//  Copyright © 2016 F.V.Rockie. All rights reserved.
//

#import "Hero.h"

@implementation Hero

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)heroWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
