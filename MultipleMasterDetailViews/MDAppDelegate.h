//
//  MDAppDelegate.h
//  MultipleMasterDetailViews
//
//  Created by Steven Rae on 12-01-08.
//  Copyright (c) 2012 Steven Rae. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDMultipleMasterDetailManager.h"

@interface MDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) MDMultipleMasterDetailManager* masterDetailManager;

@end
