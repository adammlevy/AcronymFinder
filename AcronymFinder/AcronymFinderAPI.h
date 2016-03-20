//
//  AcronymFinderAPI.h
//  AcronymFinder
//
//  Created by Adam Levy on 3/20/16.
//  Copyright © 2016 Adam Levy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AcronymFinderAPI : NSObject

- (void)fetchAcronymMeaningsWithAcronym:(NSString *)acronym completion:(void(^)(NSArray *acronyms, NSError *error))completion;

@end
