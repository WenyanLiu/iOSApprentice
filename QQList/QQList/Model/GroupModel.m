//
//  GroupModel.m
//  QQList
//
//  Created by 刘文炎 on 8/20/16.
//  Copyright © 2016 F.V.Rockie. All rights reserved.
//

#import "GroupModel.h"
#import "FriendModel.h"

@implementation GroupModel

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *arrM = [NSMutableArray array];
        for (NSDictionary *dict in self.friends) {
            FriendModel *model = [FriendModel friendWithDict:dict];
            [arrM addObject:model];
        }
        self.friends = arrM;
    }
    return self;
}

+ (instancetype)groupWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
