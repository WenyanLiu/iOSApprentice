//
//  FriendModel.m
//  QQList
//
//  Created by 刘文炎 on 8/20/16.
//  Copyright © 2016 F.V.Rockie. All rights reserved.
//

#import "FriendModel.h"

@implementation FriendModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+ (instancetype)friendWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
