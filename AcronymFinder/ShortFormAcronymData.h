//
//  ShortFormAcronymData.h
//  AcronymFinder
//
//  Created by Adam Levy on 3/20/16.
//  Copyright © 2016 Adam Levy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShortFormAcronymData : NSObject

@property (nonatomic, copy) NSString *shortForm;
@property (nonatomic, strong) NSArray *longForm;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
