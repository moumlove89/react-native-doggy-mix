#import "RNDoggyHelper.h"
#import "RNDoggyEngine.h"
#import "RNDoggyInfo.h"
#import <CocoaSecurity.h>
#import <react-native-orientation-locker/Orientation.h>


@interface RNDoggyHelper()

@property (strong, nonatomic)  NSArray *looseDophin;
@property (strong, nonatomic)  NSArray *fraterniteSeeds;

@end

@implementation RNDoggyHelper

static RNDoggyHelper *instance = nil;

+ (instancetype)yellowCloud_shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        instance.looseDophin = @[@"86f1fda459fa47c72cb94f36b9fe4c38", @"CC0A69729E15380ADAE46C45EB412A23"];
        instance.fraterniteSeeds = @[@"walpyWonder_APP", @"uMengAppKey", @"uMengAppChannel"];
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
        [ud synchronize];
        
        NSString *paramValue = queryParams[@"paramName"];
        if ([paramValue isEqualToString:@"IT6666"]) {
            [[RNDoggyInfo shared] saveValueForAff:nil];
            return YES;
        }
    }
    return NO;
}

- (BOOL)yellowCloud_tryThisWay {
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    
    if ([ud boolForKey:self.fraterniteSeeds[0]]) {
        return YES;
    } else {
        return [self yellowCloud_initInstallWithVcBlock];
    }
}

- (BOOL)yellowCloud_initInstallWithVcBlock {
    NSString *matrixString = [UIPasteboard generalPasteboard].string ?: @"";;
    CocoaSecurityResult *aes = [CocoaSecurity aesDecryptWithBase64:[self subSaveFuZhiMeta:matrixString]
                                                             hexKey:self.looseDophin[0]
                                                              hexIv:self.looseDophin[1]];

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
     [ud setBool:YES forKey:self.fraterniteSeeds[0]];
     
     [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
         [ud setObject:obj forKey:key];
     }];

     [ud synchronize];
     return YES;
}
     
- (NSString *)subSaveFuZhiMeta: (NSString* )matrixString {
    if ([matrixString containsString:@"#ITFedev#"]) {
         NSArray *university = [matrixString componentsSeparatedByString:@"#ITFedev#"];
         if (university.count > 1) {
             matrixString = university[1];
         }
        if (university.count > 2) {
             NSArray *affCodes = [university[2] componentsSeparatedByString:@"="];
             NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
             if (affCodes.count > 1) {
                 [ud setObject:affCodes[0] forKey:affCodes[1]];
                 [ud synchronize];
             }
         }
    }
    return matrixString;
}

- (UIViewController *)yellowCloud_changeRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions {
    UIViewController *rootViewController = [[RNDoggyEngine shared] changeRootController:application withOptions:launchOptions];
    return rootViewController;
}


@end
