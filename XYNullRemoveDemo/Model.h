//
//  Model.h
//  XYNullRemoveDemo
//
//  Created by xiaoyao on 16/5/20.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  支持所有Model,包括(JSONModel，MJModel)
 */
@interface Model : NSObject
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *page;
@property (nonatomic, strong) NSString *phone;
@end
