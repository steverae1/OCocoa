//
//  ManualViewController.m
//  MultipleMasterDetailViews
//
//  Created by Steven Rae on 2013-04-05.
//  Copyright (c) 2013 Steven Rae. All rights reserved.
//

#import "ManualViewController.h"

@interface ManualViewController ()

@end

@implementation ManualViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIView *mainView = [[UIView alloc] init];
	// mainView.backgroundColor = [UIColor yellowColor];
	
	mainView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin |
    UIViewAutoresizingFlexibleHeight |
    UIViewAutoresizingFlexibleLeftMargin |
    UIViewAutoresizingFlexibleRightMargin |
    UIViewAutoresizingFlexibleTopMargin |
    UIViewAutoresizingFlexibleWidth;
	
	self.view = mainView;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
