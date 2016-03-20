//
//  ViewController.m
//  AcronymFinder
//
//  Created by Adam Levy on 3/20/16.
//  Copyright © 2016 Adam Levy. All rights reserved.
//

#import "ViewController.h"
#import "AcronymFinderAPI.h"
#import "ShortFormAcronymData.h"

@interface ViewController () <UISearchBarDelegate>

@property (nonatomic, strong) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) ShortFormAcronymData *searchAcronym;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - UISearchBarDelegate
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    AcronymFinderAPI *api = [[AcronymFinderAPI alloc] init];
    
    [api fetchAcronymMeaningsWithAcronym:searchBar.text completion:^(NSArray *acronyms, NSError *error) {
// #TODO: show HUD here
        if (error) {
            NSLog(@"error: %@",error);
        } else {
            NSLog(@"fetched: %@", acronyms);
            NSDictionary *acronym = [acronyms objectAtIndex:0];
            ShortFormAcronymData *acronymData = [[ShortFormAcronymData alloc] initWithDictionary:acronym];
            self.searchAcronym = acronymData;
        }
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
