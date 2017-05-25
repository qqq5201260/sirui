
//
//  FZKBPayOrderWXHttpAction.h
//
//
//  Created by mac on date.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FZKHttpWork.h"

@interface FZKBPayOrderWXHttpAction : FZKHttpWork
    
/**
 方法描述：
 续费（支付中心） 微信支付
 
 传入参数：
yearCount：年数（默认写1年）
vehicleIDs：车辆ID
isReducePrice：是否减少支付费用（默认写false）
payType：支付方式 1表示微信支付，2表示支付宝
返回参数：
调用三方SDK
 */
- (void)payOrderWXActionWithYearCount:(NSString *)yearCount vehicleIDs:(NSString *)vehicleIDs isReducePrice:(NSString *)isReducePrice payType:(NSString *)payType;

@end