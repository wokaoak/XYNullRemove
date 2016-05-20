//
//  ViewController.m
//  XYNullRemoveDemo
//
//  Created by xiaoyao on 16/5/20.
//  Copyright © 2016年 xiaoyao. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "NSObject+XYNullRemove.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self demo1];
}


- (void)demo1
{
    Model *m = [[Model alloc]init];
    m.name = nil;
    m.page = @"只有18岁的逍遥";
    m.phone = nil;
    
    NSLog(@"转换前\n%@", m);
    
    [m xy_replaseNull:@"－替换值－"];
    
    NSLog(@"转换后\n%@", m);
}

- (void)demo2
{
    Model *m = [[Model alloc]init];
    m.name = nil;
    m.page = @"只有18岁的逍遥";
    m.phone = nil;
    
    NSLog(@"转换前\n%@", m);
    
    m = m.xy_replaseNull;
    
    NSLog(@"转换后\n%@", m);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
