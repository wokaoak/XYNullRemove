//
//  NSObject+XYNullRemove.m
//  XYNullRemoveDemo
//
//  Created by xiaoyao on 16/5/20.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "NSObject+XYNullRemove.h"
#import <objc/runtime.h>

@implementation NSObject (XYNullRemove)


- (id)xy_replaseNull
{
    return [self xy_replaseNull:@""];
}

- (id)xy_replaseNull:(id)obj
{
    //获取实体类的属性名
    NSArray *array = [self allPropertyNames];
    
    for (int i = 0; i < array.count; i ++) {
        //key
        NSString *key = [array objectAtIndex:i];
        
        //获取get方法
        SEL getSel = [self creatGetterWithPropertyName:key];
        
        // 通过getSetterSelWithAttibuteName 方法来获取实体类的set方法
        SEL setSel = [self creatSetterWithPropertyName:key];
        
        if ([self respondsToSelector:getSel]) {
            
            //获得类和方法的签名
            NSMethodSignature *signature = [self methodSignatureForSelector:getSel];
            
            //从签名获得调用对象
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
            
            //设置target
            [invocation setTarget:self];
            
            //设置selector
            [invocation setSelector:getSel];
            
            //接收返回的值
            NSObject *__unsafe_unretained returnValue = nil;
            
            //调用
            [invocation invoke];
            
            //接收返回值
            [invocation getReturnValue:&returnValue];
            
            if ([self respondsToSelector:setSel]) {
                if (!returnValue) {
                    //把值通过setter方法赋值给实体类的属性
                    [self performSelectorOnMainThread:setSel
                                           withObject:obj
                                        waitUntilDone:[NSThread isMainThread]];
                }
                
            }
        }
        
        
    }
    return self;
}


#pragma mark -- 通过字符串来创建该字符串的Getter方法，并返回
- (SEL) creatGetterWithPropertyName: (NSString *) propertyName{
    
    //1.返回get方法: oc中的get方法就是属性的本身
    return NSSelectorFromString(propertyName);
}

#pragma mark -- 通过字符串来创建该字符串的Setter方法，并返回
- (SEL) creatSetterWithPropertyName: (NSString *) propertyName{
    
    //1.首字母大写
    //    propertyName = propertyName.capitalizedString;
    
    NSString *preStr = [propertyName substringToIndex:1];
    preStr = preStr.uppercaseString;
    
    propertyName = [NSString stringWithFormat:@"%@%@", preStr, [propertyName substringWithRange:NSMakeRange(1, [propertyName length]-1)]];
    
    //2.拼接上set关键字
    propertyName = [NSString stringWithFormat:@"set%@:", propertyName];
    
    //3.返回set方法
    return NSSelectorFromString(propertyName);
}

///通过运行时获取当前对象的所有属性的名称，以数组的形式返回
- (NSArray *) allPropertyNames{
    ///存储所有的属性名称
    NSMutableArray *allNames = [[NSMutableArray alloc] init];
    
    ///存储属性的个数
    unsigned int propertyCount = 0;
    
    ///通过运行时获取当前类的属性
    objc_property_t *propertys = class_copyPropertyList([self class], &propertyCount);
    
    //把属性放到数组中
    for (int i = 0; i < propertyCount; i ++) {
        ///取出第一个属性
        objc_property_t property = propertys[i];
        
        const char * propertyName = property_getName(property);
        
        [allNames addObject:[NSString stringWithUTF8String:propertyName]];
    }
    
    ///释放
    free(propertys);
    
    return allNames;
}
@end
