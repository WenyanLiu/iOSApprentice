//
//  Hero.h
//  LOLHero
//
//  Created by 刘文炎 on 8/2/16.
//  Copyright © 2016 F.V.Rockie. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hero : NSObject

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *name;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)heroWithDict:(NSDictionary *)dict;

@end
