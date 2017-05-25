
//
//  FZKBCustomerModel.m
//  Connector
//
//  Created by mac on date.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import "FZKBCustomerModel.h"
#import <MJExtension.h>


@implementation FZKBCustomerModel


+ (NSDictionary *)objectClassInArray{
    return @{@"cars" : [FZKBCarModel class]};
}

MJExtensionCodingImplementation

+ (instancetype)shareCustomer {
    static id instance = nil;
    // 使用GCD
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 保证代码执行一次
        // 先从归档的文件里面去拿,拿不到,再初始化一个空的对象
        instance = [FZKBCustomerModel unarchive];
        if (!instance) {
            instance = [[[self class] alloc]init];
        }
    });
    return instance;
}
#pragma mark - 私有方法
+ (NSString *)archivePath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = paths.firstObject;
    NSString *filePath = [basePath stringByAppendingPathComponent:@"UserMode.dat"];
    return filePath;
}
#pragma mark - 接口方法
- (void)archive {
    [NSKeyedArchiver archiveRootObject:self toFile:[FZKBCustomerModel archivePath]];
}
// 因为在解档的时候,还没有任何的usermodel实例.所以写成类方法,并把解档的对象返回
// 在usermodel创建的时候调用
+ (instancetype)unarchive {
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[FZKBCustomerModel archivePath]];
}

@end
