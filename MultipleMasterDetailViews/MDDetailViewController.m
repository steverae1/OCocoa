//
//  MDDetailViewController.m
//  MultipleMasterDetailViews
//
//  Created by Steven Rae on 12-01-08.
//  Copyright (c) 2012 Steven Rae. All rights reserved.
//

#import "MDDetailViewController.h"
#import "MDAppDelegate.h"

@interface MDDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@property (strong, nonatomic) ManualViewController *modalController;
@end

@implementation MDDetailViewController

@synthesize detailItem = _detailItem;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;
@synthesize masterPopoverController = _masterPopoverController;
@synthesize gestureView;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
    UIPanGestureRecognizer *p = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragging:)];
	[self.gestureView addGestureRecognizer:p];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editClicked:)];
    
    self.navigationItem.rightBarButtonItem.enabled = YES;
}

-(void) dragging:(UIPanGestureRecognizer *) p
{
    UIView *v = p.view;
    if (p.state == UIGestureRecognizerStateBegan ||
        p.state == UIGestureRecognizerStateChanged)
    {
        CGPoint delta = [p translationInView:v.superview];
        CGPoint c = v.center;
        c.x += delta.x; c.y += delta.y;
        v.center = c;
        [p setTranslation:CGPointZero inView:v.superview];
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

-(void)editClicked:(id)sender
{
    self.modalController = [[ManualViewController alloc] init];
    
    self.modalController.modalPresentationStyle = UIModalPresentationFormSheet;
    self.modalController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    
    UINavigationController* nc = nil;
    nc = [[UINavigationController alloc] initWithRootViewController: self.modalController];
    [nc setToolbarHidden:YES animated: NO];
    
    nc.modalPresentationStyle = self.modalController.modalPresentationStyle;
    
    self.modalController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemStop target:self action:@selector(autoModalViewControllerDismiss:)];
    
    [nc setNavigationBarHidden: NO];
    nc.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    nc.toolbar.barStyle = self.navigationController.navigationBar.barStyle;
    
    [self presentViewController:nc animated:YES completion:nil];
    
    // self.modalController.view.superview.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    // self.modalController.view.superview.frame = CGRectMake(0, 0, 100, 100);
    // self.modalController.view.superview.bounds = CGRectMake(0, 0, 100, 100);
    // CGRect screenBounds = [[UIScreen mainScreen] bounds];
    // CGPoint center = CGPointMake(CGRectGetMidX(screenBounds), CGRectGetMidY(screenBounds));
    // nc.view.superview.center = CGPointMake(center.y, center.x);
    
    // UIDeviceOrientation _orientation = [nc interfaceOrientation];
    // if (UIDeviceOrientationIsPortrait(_orientation)){
        // self.modalController.view.superview.center = CGPointMake(768/2, 1024/2 + 10);
    // } else {
        // self.modalController.view.superview.center = CGPointMake(1024/2, 768/2 + 10);
    // }
    
    for (UIView *subView in self.view.subviews)
    {
        [subView removeFromSuperview];
        [self.modalController.view addSubview:subView];
    }
    
    // UITabBarController* tabBarController = [self.splitViewController.viewControllers objectAtIndex:0];
    
    // UIViewController *placeholderController = [[UIViewController alloc] init];
    // placeholderController.view.backgroundColor = [UIColor yellowColor];
    
    // self.splitViewController.viewControllers = [NSArray arrayWithObjects:tabBarController,placeholderController, nil];
    
    
    

    
    /*
    // modalController.view.superview.center = self.view.center;
    
    CGPoint centerpoint = CGPointMake([[UIScreen mainScreen] bounds].size.width/2 , [[UIScreen mainScreen] bounds].size.height/2);
    
    modalController.view.superview.center = centerpoint;
    */
    
    return;
    
}

- (void) autoModalViewControllerDismiss: (id)sender
{
    for (UIView *subView in self.modalController.view.subviews)
    {
            [subView removeFromSuperview];
            [self.view addSubview:subView];
    }
    
    // UIViewController * detailController = [self.splitViewController.viewControllers objectAtIndex:1];
    
    // self.splitViewController.viewControllers = [NSArray arrayWithObjects:tabBarController,detailController, nil];

    [self dismissViewControllerAnimated:YES completion:nil];
    
    // [self viewWillAppear:NO];
    // [self viewDidAppear:NO];
    
    // UITabBarController* tabBarController = [self.splitViewController.viewControllers objectAtIndex:0];
    
    // UINavigationController * detailController = [self.splitViewController.viewControllers objectAtIndex:1];
    
    // UIViewController *placeholderController = [[UIViewController alloc] init];
    // placeholderController.view.backgroundColor = [UIColor yellowColor];
    
    // [detailController pushViewController:placeholderController animated:YES];
    
    // [detailController popViewControllerAnimated:YES];
    
    // UISplitViewController *holdSplitViewController = self.splitViewController;
    
    // self.splitViewController.viewControllers = [NSArray arrayWithObjects:tabBarController, placeholderController, nil];
    
    
    // self.splitViewController.viewControllers = [NSArray arrayWithObjects:tabBarController, detailController, nil];
    
    
    
    
    
    // MDAppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    // [appDelegate.masterDetailManager updateSplitViewController];

}

#pragma mark - Split view
/*
- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}
*/
@end
