//
//  LongFormAcronymData.h
//  AcronymFinder
//
//  Created by Adam Levy on 3/20/16.
//  Copyright © 2016 Adam Levy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LongFormAcronymData : NSObject

@property (nonatomic, copy) NSString *longForm;
@property (nonatomic, copy) NSNumber *frequency;
@property (nonatomic, copy) NSNumber *yearUsedSince;
@property (nonatomic, strong) NSArray *variations;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
