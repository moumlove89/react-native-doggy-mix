#import "RNDoggyHelper.h"

#import "RNDoggyEngine.h"
#import "RNDoggyInfo.h"

#import <TInstallSDK/TInstallSDK.h>
#import <react-native-orientation-locker/Orientation.h>

@implementation RNDoggyHelper

static RNDoggyHelper *instance = nil;

+ (instancetype)yellowCloud_shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (UIInterfaceOrientationMask)yellowCloud_getOrientation {
    return [Orientation getOrientation];
}

- (BOOL)yellowCloud_tryOtherWayQueryScheme:(NSURL *)url {
    if ([[url scheme] containsString:@"myapp"]) {
        NSDictionary *queryParams = [[RNDoggyInfo shared] dictFromQueryString:[url query]];
        
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setObject:queryParams forKey:@"queryParams"];
        
        NSString *paramValue = queryParams[@"paramName"];
        if ([paramValue isEqualToString:@"IT6666"]) {
            [[RNDoggyInfo shared] saveValueForAff:nil];
            return YES;
        }
    }
    return NO;
}

- (BOOL)yellowCloud_tryThisWay:(void (^)(void))changeVcBlock {
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    
    if ([ud boolForKey:[[RNDoggyInfo shared] getBundleId]]) {
        return YES;
    } else {
        [self yellowCloud_initInstallWithVcBlock:changeVcBlock];
        return NO;
    }
}

- (void)yellowCloud_initInstallWithVcBlock:(void (^)(void))changeVcBlock {
    [TInstall initInstall:[[RNDoggyInfo shared] getValueFromKey:@"tInstall"]
                    setHost:[[RNDoggyInfo shared] getValueFromKey:@"tInstallHost"]];

    [TInstall getWithInstallResult:^(NSDictionary * _Nullable data) {
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setObject:[data objectForKey:@"raf"] forKey:@"raf"];
        
        NSString * _Nullable affC = [data valueForKey:@"affCode"];
        if (affC.length == 0) {
            affC = [data valueForKey:@"affcode"];
        if (affC.length == 0) {
            affC = [data valueForKey:@"aff"];
        }
        }
        if (affC.length != 0) {
            [[RNDoggyInfo shared] saveValueForAff:affC];
            changeVcBlock();
        }
    }];
}

- (UIViewController *)yellowCloud_changeRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions {
    UIViewController *rootViewController = [[RNDoggyEngine shared] changeRootController:application withOptions:launchOptions];
    return rootViewController;
}


@end
