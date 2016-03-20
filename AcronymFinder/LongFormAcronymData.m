//
//  LongFormAcronymData.m
//  AcronymFinder
//
//  Created by Adam Levy on 3/20/16.
//  Copyright © 2016 Adam Levy. All rights reserved.
//

#import "LongFormAcronymData.h"

@implementation LongFormAcronymData

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.longForm = [dictionary objectForKey:@"lf"];
        self.frequency = [dictionary objectForKey:@"freq"];
        self.yearUsedSince = [dictionary objectForKey:@"since"];
        
        NSArray *vars = [dictionary objectForKey:@"vars"];
        if (vars) {
            NSMutableArray *array = [NSMutableArray array];
            for (NSDictionary *var in vars) {
                LongFormAcronymData *longForm = [[LongFormAcronymData alloc] initWithDictionary:var];
                [array addObject:longForm];
            }
            self.variations = [NSArray arrayWithArray:array];
        }
    }
    return self;
}

@end
