//
//  OPInstall.h
//  OPInstall
//
//  Created by fx on 2020/12/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TInstall : NSObject


/// Set host
/// @param host host description
+ (void)setHost:(NSString *)host;

/// init SDK
/// @param appKey appKey
+ (void)initInstall:(NSString *)appKey;

/// Get params
/// @param result params result
+ (void)getInstall:(void(^ _Nullable)(NSDictionary * _Nullable data))result;

+(void) getParams;
+(void) queryParam:(void(^ _Nullable)(NSDictionary * _Nullable data))result;

/// user register
+ (void)registered;

/// user register
+ (void)registered:(NSString *)Id;


@end

NS_ASSUME_NONNULL_END
