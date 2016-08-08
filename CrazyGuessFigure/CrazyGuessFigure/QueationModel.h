//
//  QueationModel.h
//  CrazyGuessFigure
//
//  Created by 刘文炎 on 8/8/16.
//  Copyright © 2016 F.V.Rockie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface QueationModel : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *answer;

@property (nonatomic, strong) NSArray *options;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)questionWithDict:(NSDictionary *)dict;

@property (nonatomic, strong, readonly) UIImage *image;

+ (NSArray *)questions;

@end
