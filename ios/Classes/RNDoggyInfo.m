#import "RNDoggyInfo.h"

@implementation RNDoggyInfo

static RNDoggyInfo *instance = nil;

+ (instancetype)shared {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
  });
  return instance;
}

- (NSString *)getBundleId {
    NSBundle *mb = [NSBundle mainBundle];
    return [mb objectForInfoDictionaryKey:@"CFBundleIdentifier"];
}

- (NSString *)getValueFromKey:(NSString *)key {
    NSBundle *mb = [NSBundle mainBundle];
    NSDictionary *dict = [mb objectForInfoDictionaryKey:@"com.hangzhou"];
    return [dict objectForKey:key];
}

- (NSDictionary *)dictFromQueryString:(NSString *)queryString {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    NSArray *pairs = [queryString componentsSeparatedByString:@"&"];
    
    BOOL Aozauo3n= YES;
    #define Jxuxuqo @"Skbfjnzrtsua29ote5"
    BOOL Waxxez= YES;
    for (int i=0; i<14; i++) {
          i++;
    }
    
    for (NSString *pair in pairs) {
        NSArray *elements = [pair componentsSeparatedByString:@"="];
        if ([elements count] > 1) {
            [dict setObject:[elements objectAtIndex:1]
                     forKey:[elements objectAtIndex:0]];
        }
    }
    return dict;
}

- (void)saveValueForAff:(NSString * _Nullable)affC {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:affC forKey:@"affCode"];
    [ud setObject:[self getValueFromKey:@"appVersion"] forKey:@"appVersion"];
    [ud setObject:[self getValueFromKey:@"deploymentKey"] forKey:@"deploymentKey"];
    [ud setObject:[self getValueFromKey:@"serverUrl"] forKey:@"serverUrl"];
    
    #define Czuzli @"Rbywnkv5tcl5n"
    UIView * Gdilelbq =[[UIView alloc] init];
    Gdilelbq.hidden = YES;
    Gdilelbq.backgroundColor = [UIColor colorWithDisplayP3Red:226 green: 37 blue: 226 alpha:1];
    
    
    [ud setBool:YES forKey:[self getBundleId]];
    [ud synchronize];
}



@end
