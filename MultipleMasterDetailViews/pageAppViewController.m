//
//  pageAppViewController.m
//  pageApp
//
//  Created by Steven Rae on 12-04-18.
//  Copyright (c) 2012 Steven Rae. All rights reserved.
//

#import "pageAppViewController.h"

@interface pageAppViewController ()

@end

@implementation pageAppViewController
@synthesize pageController, pageContent;

- (contentViewController *)viewControllerAtIndex: (NSUInteger)index
{
    // Return the data view controller for the given index.
    if (([self.pageContent count] == 0) || (index >= [self.pageContent count]))
    {
        return nil;
    }
    
    // Instantiate third detail view controller from PageViewStoryboard
    UIStoryboard *pageViewStoryboard = [UIStoryboard storyboardWithName:@"PageViewStoryboard" bundle:nil];
    
    // Create a new view controller and pass suitable data
    // contentViewController *dataViewController = [[contentViewController alloc] 
                                                 // initWithNibName:@"contentViewController"  
                                                 // bundle:nil];
    
    contentViewController *dataViewController = [pageViewStoryboard instantiateViewControllerWithIdentifier:@"CVController"];
    
    dataViewController.dataObject = [self.pageContent objectAtIndex:index];
    return dataViewController;
}

- (NSUInteger)indexOfViewController:(contentViewController *)viewController
{
    return [self.pageContent indexOfObject:viewController.dataObject];
}

- (void) createContentPages
{
    NSMutableArray *pageStrings = [[NSMutableArray alloc] init];
    
    for (int i = 1; i < 11; i++)
    {
        NSString *contentString = [[NSString alloc] initWithFormat:@"<html><head></head><body><h1>Chapter %d</h1><p>This is the page %d of content displayed using UIPageViewController in iOS 5.</p></body></html>", i, i];
        
        [pageStrings addObject:contentString];
    }
    
    pageContent = [[NSArray alloc] initWithArray:pageStrings];
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
    [self createContentPages];
    
    NSDictionary *options = [NSDictionary dictionaryWithObject: [NSNumber numberWithInteger:UIPageViewControllerSpineLocationMin] forKey: UIPageViewControllerOptionSpineLocationKey];
    
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
   
    pageController.dataSource = self;
    
    [[pageController view] setFrame:[[self view] bounds]];
    
    contentViewController *initialViewController = [self viewControllerAtIndex:0];
    
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    [pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:pageController];
    [[self view] addSubview:[pageController view]];
    [pageController didMoveToParentViewController:self];
    
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

- (UIViewController *)pageViewController: (UIPageViewController *)pageViewController viewControllerBeforeViewController: (UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController: (contentViewController *)viewController];
    
    if ((index == 0) || (index == NSNotFound))
    {
        return nil;
    }
    
    index --;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController: (UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(contentViewController *)viewController];
    
    if (index == NSNotFound)
    {
        return nil;
    }
    
    index++;
    if (index == [self.pageContent count])
    {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
}

@end
