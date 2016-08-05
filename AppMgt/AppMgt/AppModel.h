//
//  AppModel.h
//  AppMgt
//
//  Created by 刘文炎 on 8/5/16.
//  Copyright © 2016 F.V.Rockie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface App : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, strong, readonly) UIImage *image;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)appWithDict:(NSDictionary *)dict;

@end
