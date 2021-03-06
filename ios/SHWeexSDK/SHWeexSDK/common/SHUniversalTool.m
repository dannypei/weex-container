//
//  SHUniversalTool.m
//  SHWeexSDK
//
//  Created by guo on 2017/6/7.
//  Copyright © 2017年 YunRuo. All rights reserved.
//

#import "SHUniversalTool.h"

@implementation SHUniversalTool
/**
 比较版本号大小
 @param version 版本号
 @param currentVersion 系统版本号
 @return YES 传入版本号大于等于当前版本号 NO 传入版本号小于当前版本号
 */
+(BOOL)SHComparedVersion:(NSString *)version withTheCurrentVersion:(NSString *)currentVersion{
    if ([currentVersion compare:version options:NSNumericSearch] != NSOrderedAscending){
        return YES;
    }else{
        return NO;
    }
}
/**
 *  @brief  将url参数转换成NSDictionary
 *
 *  @param query url参数
 *
 *  @return NSDictionary
 */
+(NSDictionary *)SHDictionaryWithURLQuery:(NSString *)query
{
    NSRange range = [query rangeOfString:@"?"];
    if (range.length==0) {
        return [NSDictionary dictionaryWithObjectsAndKeys:query,@"url", nil];
    }else{
        NSString *propertys = [query substringFromIndex:(int)(range.location+1)];
        NSArray *subArray = [propertys componentsSeparatedByString:@"&"];
        NSMutableDictionary *tempDic = [NSMutableDictionary dictionaryWithCapacity:4];
        NSString * mstrUrl = [query substringToIndex:range.location];
        [tempDic setObject:mstrUrl forKey:@"url"];
        for (int j = 0 ; j < subArray.count; j++)
        {
            NSArray *dicArray = [subArray[j] componentsSeparatedByString:@"="];
            [tempDic setObject:dicArray[1] forKey:dicArray[0]];
            
        }
        return tempDic;
    }
}

/**
 字典或数组转json
 @param object 字典或数组
 @return json格式数据
 */
+(NSString *)objectToJsonStr:(id)object{
    NSData *data=[NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonStr=[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    return jsonStr;
}


@end
