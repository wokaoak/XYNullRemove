//
//  NSObject+XYNullRemove.h
//  XYNullRemoveDemo
//
//  Created by xiaoyao on 16/5/20.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (XYNullRemove)

- (id)xy_replaseNull:(id)obj;

@property (readonly, nonatomic, assign) id xy_replaseNull;

@end
