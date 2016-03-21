//
//  AcronymTableViewCell.h
//  AcronymFinder
//
//  Created by Adam Levy on 3/20/16.
//  Copyright © 2016 Adam Levy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AcronymTableViewCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *longForm;
@property (nonatomic, strong) IBOutlet UILabel *frequency;
@property (nonatomic, strong) IBOutlet UILabel *yearUsedSince;

@end
