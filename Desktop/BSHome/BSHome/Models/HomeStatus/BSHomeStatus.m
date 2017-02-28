//
//  BSHomeStatus.m
//  BSHome
//
//  Created by DING on 17/2/20.
//  Copyright © 2017年 DING. All rights reserved.
//

#import "BSHomeStatus.h"
#import "BSHomeStatusLayout.h"

@implementation BSUser

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    NSNumber *name = dic[@"name"];
    if (![name isKindOfClass:[NSString class]]) {
        NSString *nameString = [name stringValue];
        [dic setValue:nameString forKey:@"name"];
        return YES;
    }
    return NO;
}


@end

@implementation BSVideo

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic {
    NSNumber *name = dic[@"playcount"];
    if (![name isKindOfClass:[NSString class]]) {
        NSString *nameString = [name stringValue];
        [dic setValue:nameString forKey:@"playcount"];
        return YES;
    }
    return NO;
}

@end

@implementation BSComment

@end

@implementation BSHomeStatus

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"id" : @"index"
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"top_comments" : [BSComment class]
             };
}

+ (NSArray<BSHomeStatusLayout *> *)testData {
    NSMutableArray<BSHomeStatusLayout *> *layouts = [NSMutableArray array];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"BSData" ofType:@"geojson"];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:path];
    NSError *error;
    id JSONData = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    
    if (!JSONData || error) {
        NSLog(@"test data null");
        return nil;
    } else {
        NSArray *statusArray = [NSArray modelArrayWithClass:[BSHomeStatus class] json:JSONData[@"list"]];
        
        [statusArray enumerateObjectsUsingBlock:^(BSHomeStatus *  _Nonnull status, NSUInteger idx, BOOL * _Nonnull stop) {
            [layouts addObject:[[BSHomeStatusLayout alloc] initWithStatus:status]];
        }];
        
        return layouts.mutableCopy;
    }
}
@end
