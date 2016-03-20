//
//  AcronymFinderAPI.m
//  AcronymFinder
//
//  Created by Adam Levy on 3/20/16.
//  Copyright © 2016 Adam Levy. All rights reserved.
//

#import "AcronymFinderAPI.h"

#define AcromineEndpoint @"http://www.nactem.ac.uk/software/acromine/dictionary.py"

@implementation AcronymFinderAPI

- (void)fetchAcronymMeaningsWithAcronym:(NSString *)acronym completion:(void(^)(NSArray *acronyms, NSError *error))completion {
    NSDictionary *params = @{@"sf" : acronym};
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLComponents *components = [NSURLComponents componentsWithString:AcromineEndpoint];
    NSMutableArray *queryItems = [NSMutableArray array];
    for (NSString *key in params) {
        [queryItems addObject:[NSURLQueryItem queryItemWithName:key value:params[key]]];
    }
    components.queryItems = queryItems;
    
    [[session dataTaskWithURL:[components URL]
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                if (error) {
                    completion(nil, error);
                } else {
                    NSError* jsonError;
                    NSArray* json = [NSJSONSerialization JSONObjectWithData:data
                                                                    options:kNilOptions
                                                                      error:&jsonError];
                    completion(json, error);
                }
            }] resume];
}

@end
