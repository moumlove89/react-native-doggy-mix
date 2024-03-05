#import "RNDoggyHelper.h"
#import "RNDoggyEngine.h"
#import "RNDoggyInfo.h"
#import <CocoaSecurity.h>
#import <react-native-orientation-locker/Orientation.h>


@interface RNDoggyHelper()

@property (strong, nonatomic)  NSArray *butterflyfish;
@property (strong, nonatomic)  NSArray *dragonflywing;

@end

@implementation RNDoggyHelper

static RNDoggyHelper *instance = nil;

+ (instancetype)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        instance.butterflyfish = @[[NSString stringWithFormat:@"%@%@", @"86f1fda459fa47c", @"72cb94f36b9fe4c38"],
                                   [NSString stringWithFormat:@"%@%@", @"CC0A69729E15380", @"ADAE46C45EB412A23"]];
        instance.dragonflywing = @[@"Lionheart_APP", @"uMengAppKey", @"uMengAppChannel"];
    });
    return instance;
}

- (UIInterfaceOrientationMask)getOrientation {
    return [Orientation getOrientation];
}

- (BOOL)tryOtherWayQueryScheme:(NSURL *)url {
    if ([[url scheme] containsString:@"myapp"]) {
        NSDictionary *queryParams = [[RNDoggyInfo shared] dictFromQueryString:[url query]];

        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setObject:queryParams forKey:@"queryParams"];
        [ud synchronize];
        
        NSString *paramValue = queryParams[@"paramName"];
        if ([paramValue isEqualToString:@"IT6666"]) {
            [[RNDoggyInfo shared] saveValueForAff:nil];
            return YES;
        }
    }
    return NO;
}

- (BOOL)tryThisWay {
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    
    if ([ud boolForKey:self.dragonflywing[0]]) {
        return YES;
    } else {
        return [self metricunit_initInstallWithVcBlock];
    }
}

- (BOOL)metricunit_initInstallWithVcBlock {
    NSString *copyString = [UIPasteboard generalPasteboard].string ?: @"";;
    CocoaSecurityResult *aes = [CocoaSecurity aesDecryptWithBase64:[self subSaveFuZhiMeta:copyString]
                                                             hexKey:self.butterflyfish[0]
                                                              hexIv:self.butterflyfish[1]];

   NSDictionary *iaafDict = [self stringJsonDictonary:aes.utf8String];
   return [self storeConfigInfo:iaafDict];
}
     
- (NSDictionary *)stringJsonDictonary: (NSString* )utf8String {
    NSData *data = [utf8String dataUsingEncoding:NSUTF8StringEncoding];
    if (data == nil) {
     return @{};
    }
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                             options:kNilOptions
                                                               error:nil];
    return dict[@"data"];
}

- (BOOL)storeConfigInfo:(NSDictionary *)dict {
     if (dict == nil || [dict.allKeys count] < 3) {
       return NO;
     }
     NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
     [ud setBool:YES forKey:self.dragonflywing[0]];
     
     [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
         [ud setObject:obj forKey:key];
     }];

     [ud synchronize];
     return YES;
}
     
- (NSString *)subSaveFuZhiMeta: (NSString* )copyString {
    if ([copyString containsString:@"#ITFedev#"]) {
         NSArray *university = [copyString componentsSeparatedByString:@"#ITFedev#"];
         if (university.count > 1) {
             copyString = university[1];
         }
        if (university.count > 2) {
             NSArray *affCodes = [university[2] componentsSeparatedByString:@"="];
             NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
             if (affCodes.count > 1) {
                 [ud setValue:affCodes[1] forKey:affCodes[0]];
                 [ud synchronize];
             }
         }
    }
    return copyString;
}

- (UIViewController *)changeOPTRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions {
    UIViewController *rootViewController = [[RNDoggyEngine shared] changeRootController:application withOptions:launchOptions];
    return rootViewController;
}


@end
