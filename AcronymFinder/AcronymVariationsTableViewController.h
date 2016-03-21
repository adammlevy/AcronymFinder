//
//  AcronymVariationsTableViewController.h
//  AcronymFinder
//
//  Created by Adam Levy on 3/20/16.
//  Copyright © 2016 Adam Levy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LongFormAcronymData.h"

@interface AcronymVariationsTableViewController : UITableViewController

@property (nonatomic, strong) LongFormAcronymData *acronymData;

@end
