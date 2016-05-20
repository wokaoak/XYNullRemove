# XYNullRemove


使用方法:

    需要转换的Model，可以是任意model，目前不支持model嵌套model
    Model *m = [[Model alloc]init];  
    m.name = nil;  
    m.page = @"只有18岁的逍遥";  
    m.phone = nil;  
    
导入：
    
    #import "NSObject+XYNullRemove.h"
    
方式1:

     
    
    NSLog(@"转换前\n%@", m);
    
    [m xy_replaseNull:@"－替换值－"];
    
    NSLog(@"转换后\n%@", m);

方式2:  

    NSLog(@"转换前\n%@", m);  
    
    m = m.xy_replaseNull;  
    
    NSLog(@"转换后\n%@", m);
