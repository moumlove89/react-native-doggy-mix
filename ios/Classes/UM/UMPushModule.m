#import "UMPushModule.h"
#import "RNUMConfigure.h"

@implementation UMPushModule

RCT_EXPORT_MODULE();
RCT_EXPORT_METHOD(getDeviceToken:(RCTResponseSenderBlock)callback)
{
  NSString *tokens = [RNUMConfigure getDevicetoken];
  callback(@[tokens]);
}

@end
