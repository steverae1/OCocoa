//
//  MDMasterViewController.h
//  MultipleMasterDetailViews
//
//  Created by Steven Rae on 12-01-08.
//  Copyright (c) 2012 Steven Rae. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MDDetailViewController;

@interface MDMasterViewController : UITableViewController

@property (strong, nonatomic) MDDetailViewController *detailViewController;

@end
