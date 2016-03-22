//
//  AcronymFinderAPI.m
//  AcronymFinder
//
//  Created by Adam Levy on 3/20/16.
//  Copyright © 2016 Adam Levy. All rights reserved.
//

#import "AcronymFinderAPI.h"
#import "AFNetworking.h"

#define AcromineEndpoint @"http://www.nactem.ac.uk/software/acromine/dictionary.py"

@implementation AcronymFinderAPI

- (void)fetchAcronymMeaningsWithAcronym:(NSString *)acronym completion:(void(^)(NSArray *acronyms, NSError *error))completion {
    
    NSDictionary *params = @{@"sf" : acronym};
    NSURLComponents *components = [NSURLComponents componentsWithString:AcromineEndpoint];
    NSMutableArray *queryItems = [NSMutableArray array];
    for (NSString *key in params) {
        [queryItems addObject:[NSURLQueryItem queryItemWithName:key value:params[key]]];
    }
    components.queryItems = queryItems;
    

    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[components URL]];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, NSData * responseObject, NSError *error) {
        if (error) {
            completion(nil, error);
        } else {
            NSError* jsonError;
            NSArray* json = [NSJSONSerialization JSONObjectWithData:responseObject
                                                            options:kNilOptions
                                                              error:&jsonError];
            completion(json, error);
        }
    }];
    [dataTask resume];
}

@end
