//
//  ShortFormAcronymData.m
//  AcronymFinder
//
//  Created by Adam Levy on 3/20/16.
//  Copyright © 2016 Adam Levy. All rights reserved.
//

#import "ShortFormAcronymData.h"
#import "LongFormAcronymData.h"

@implementation ShortFormAcronymData

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.shortForm = [dictionary objectForKey:@"sf"];
        NSArray *lfs = [dictionary objectForKey:@"lfs"];
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *lf in lfs) {
            LongFormAcronymData *longForm = [[LongFormAcronymData alloc] initWithDictionary:lf];
            [array addObject:longForm];
        }
        self.longForm = [NSArray arrayWithArray:array];
    }
    return self;
}

@end
