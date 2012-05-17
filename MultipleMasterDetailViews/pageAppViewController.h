//
//  pageAppViewController.h
//  pageApp
//
//  Created by Steven Rae on 12-04-18.
//  Copyright (c) 2012 Steven Rae. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "contentViewController.h"

@interface pageAppViewController : UIViewController <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageController;
@property (strong, nonatomic) NSArray *pageContent;

@end
