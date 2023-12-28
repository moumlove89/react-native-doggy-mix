#import <Foundation/Foundation.h>
#import <UMCommon/UMCommon.h>

@interface RNUMConfigure : NSObject

+ (void)setDevicetoken:(NSString *)UMPushdeviceToken;
+ (NSString *) getDevicetoken;

+ (void)initWithAppkey:(NSString *)appkey channel:(NSString *)channel;

@end
