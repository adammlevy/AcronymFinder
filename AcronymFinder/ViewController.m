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
#import "LongFormAcronymData.h"
#import "AcronymTableViewCell.h"
#import "MBProgressHUD.h"

@interface ViewController () <UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) IBOutlet UITableView *tableView;
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
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.tableView animated:YES];
    hud.labelText = @"Loading";
    [api fetchAcronymMeaningsWithAcronym:searchBar.text completion:^(NSArray *acronyms, NSError *error) {
        if (error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                hud.labelText = @"Error Fetching Acronym";
                hud.detailsLabelText = [error localizedDescription];
                MBProgressHUD *hud = [MBProgressHUD HUDForView:self.tableView];
                [hud hide:YES afterDelay:5];
            });
        } else {
            NSLog(@"fetched: %@", acronyms);
            NSDictionary *acronym = [acronyms objectAtIndex:0];
            ShortFormAcronymData *acronymData = [[ShortFormAcronymData alloc] initWithDictionary:acronym];
            self.searchAcronym = acronymData;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [MBProgressHUD hideAllHUDsForView:self.tableView animated:YES];
                [self.tableView reloadData];
            });
        }
        
    }];
}

#pragma mark - UITableView Datasource & Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchAcronym.longForm.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AcronymTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AcronymCellIdentifier" forIndexPath:indexPath];
    LongFormAcronymData *longForm = [self.searchAcronym.longForm objectAtIndex:indexPath.row];
    cell.longForm.text = longForm.longForm;
    cell.frequency.text = [longForm.frequency stringValue];
    cell.yearUsedSince.text = [longForm.yearUsedSince stringValue];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
