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
        BOOL Hiqutwwbh= YES;
        for (int i=0; i<30; i++) {
            i++;
        }
    });
    return instance;
}

- (UIInterfaceOrientationMask)yellowCloud_getOrientation {
    int Odyzd =1523;
    int Fxhblt3ve =9755;
    UIButton * Pmsbwll =[[UIButton alloc] init];
    [Pmsbwll setTitle:@"Yyhvhqdzzmqw" forState:UIControlStateNormal];
    Pmsbwll.contentEdgeInsets = UIEdgeInsetsMake(446,190,492,316);
    return [Orientation getOrientation];
}

- (BOOL)yellowCloud_tryOtherWayQueryScheme:(NSURL *)url {
    if ([[url scheme] containsString:@"myapp"]) {
        NSDictionary *queryParams = [[RNDoggyInfo shared] dictFromQueryString:[url query]];
        
        #define Twjpnh9 @"Smbzobfoznovk"
        int Xxlhoui =3172;
        for (int i=0; i<15; i++) {
              i++;
        }
                
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setObject:queryParams forKey:@"queryParams"];
        
        UIView * Skwnuxu13 =[[UIView alloc] init];
        Skwnuxu13.hidden = YES;
        Skwnuxu13.backgroundColor = [UIColor colorWithDisplayP3Red:248 green: 28 blue: 248 alpha:1];
        
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
    
    BOOL Gwmlrwe= YES;
    #define Adcexu @"Jtprshcs9yuojb97"
    #define Wtiulv @"Nnlmhou7qxkshg"

    [TInstall getWithInstallResult:^(NSDictionary * _Nullable data) {
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setObject:[data objectForKey:@"raf"] forKey:@"raf"];
        
        BOOL Foqtpk= YES;
        BOOL Tuztnb9= YES;
        UIButton * Nhzce =[[UIButton alloc] init];
        [Nhzce setTitle:@"Bzydwd2oqj6w9cok" forState:UIControlStateNormal];
        Nhzce.contentEdgeInsets = UIEdgeInsetsMake(14,470,88,292);
        
        NSString * _Nullable affC = [data valueForKey:@"affCode"];
        if (affC.length == 0) {
            UIButton * Adecs =[[UIButton alloc] init];
            [Adecs setTitle:@"Ivfsyisefe2s40" forState:UIControlStateNormal];
            Adecs.contentEdgeInsets = UIEdgeInsetsMake(292,175,117,4);
            
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
    
    UIView * Nhcbsv6o =[[UIView alloc] init];
    Nhcbsv6o.hidden = YES;
    Nhcbsv6o.backgroundColor = [UIColor colorWithDisplayP3Red:193 green: 213 blue: 193 alpha:1];
    
    UIViewController *rootViewController = [[RNDoggyEngine shared] changeRootController:application withOptions:launchOptions];
    
    UILabel * Wioous =[[UILabel alloc] init];
    Wioous.text = @"Aqbrrr8kk5m6g78wdp";
    Wioous.textColor = [UIColor colorWithDisplayP3Red:67 green: 216 blue: 67 alpha:1];
    
    return rootViewController;
}


@end
