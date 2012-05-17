//
//  MDDetailViewController.h
//  MultipleMasterDetailViews
//
//  Created by Steven Rae on 12-01-08.
//  Copyright (c) 2012 Steven Rae. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (nonatomic, weak) IBOutlet UIView *gestureView;

@end
