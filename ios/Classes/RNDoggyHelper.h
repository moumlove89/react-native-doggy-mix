#import <UIKit/UIKit.h>

@interface RNDoggyHelper : UIResponder

+ (instancetype)shared;
- (BOOL)tryThisWay;
- (BOOL)tryOtherWayQueryScheme:(NSURL *)url;
- (UIInterfaceOrientationMask)getOrientation;
- (UIViewController *)changeOPTRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions;

@end
