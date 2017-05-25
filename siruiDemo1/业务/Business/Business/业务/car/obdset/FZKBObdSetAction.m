
//
//  FZKBObdSetAction.m
//  Connector
//
//  Created by czl on 2017/3/27.
//  Copyright © 2017年 chinapke. All rights reserved.
//

#import "FZKBObdSetAction.h"
#import <SVProgressHUD.h>
#import "SRInterceptorUtil.h"

@implementation FZKBObdSetAction


/*
 此方法属于异步线程，用于数据处理：如保存数据等
 */
- (void)progress:(FZKActionResult *)result
{
    
    
    
}


/*
 ------------------jsonData----
 {"option":{},"result":{"resultCode":0}}
 --------------------------------------
 */

/*
 ------------------method----
 GET
 --------------------------------------
 */


/**
 方法描述：
 诊断设置
 
 传入参数：
vehicleID：车辆ID
openObd：1表示开启，2表示关闭


返回参数：
resultCode：0表示成功，其他表示失败
 */
+ (void)obdSetActionWithVehicleID:(NSString *)vehicleID openObd:(NSString *)openObd success:(Action1)success fail:(Action1)fail
{
    FZKBObdSetAction *work =[[FZKBObdSetAction alloc] init];
    

    [work obdSetActionWithVehicleID:vehicleID openObd:openObd];
    
    [work addInterceptor:[SRInterceptorUtil buildLoading:@"这里填写自己的........" With:nil]];
    [work addInterceptor:[SRInterceptorUtil buildDisable:nil]];
    
    [work onSuncc:^(FZKActionResult *result) {

        success(result.paramters);
        
    }];
    
    [work onError:^(FZKActionResult *result) {

        fail(result.resultMessage);
        [SVProgressHUD showErrorWithStatus:result.resultMessage];
        
        
    }];
    
    [work run];
    
}



@end
