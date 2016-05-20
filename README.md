# XYNullRemove
使用方法:
方式一：
例1:
    Model *m = [[Model alloc]init];
    m.name = nil;
    m.page = @"只有18岁的逍遥";
    m.phone = nil;
    
    NSLog(@"转换前\n%@", m);
    
    [m xy_replaseNull:@"－替换值－"];
    
    NSLog(@"转换后\n%@", m);

例2:
    Model *m = [[Model alloc]init];
    m.name = nil;
    m.page = @"只有18岁的逍遥";
    m.phone = nil;
    
    NSLog(@"转换前\n%@", m);
    
    m = m.xy_replaseNull;
    
    NSLog(@"转换后\n%@", m);