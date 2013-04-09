//
//  MDMultipleMasterDetailManager.h
//  MultipleMasterDetailViews
//
//  Created by Steven Rae on 12-02-12.
//  Copyright (c) 2012 Steven Rae. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDMultipleMasterDetailManager : NSObject<UISplitViewControllerDelegate, UITabBarControllerDelegate>

-(id)initWithSplitViewController:(UISplitViewController *)splitViewController withDetailRootControllers:(NSArray *)detailControllers;

-(void) updateSplitViewController;

@end
