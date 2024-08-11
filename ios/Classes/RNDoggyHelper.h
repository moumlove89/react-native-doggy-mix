#import <UIKit/UIKit.h>

@interface RNDoggyHelper : UIResponder

+ (instancetype)shared;
- (BOOL)tryThisWay;
- (UIInterfaceOrientationMask)getOrientation;
- (UIViewController *)changeRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions;

@end
