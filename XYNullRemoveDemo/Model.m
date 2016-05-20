//
//  Model.m
//  XYNullRemoveDemo
//
//  Created by xiaoyao on 16/5/20.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "Model.h"


@implementation Model

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@%@%@",self.name, self.page, self.phone];
}

@end
