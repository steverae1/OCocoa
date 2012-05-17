//
//  contentViewController.m
//  pageApp
//
//  Created by Steven Rae on 12-04-18.
//  Copyright (c) 2012 Steven Rae. All rights reserved.
//

#import "contentViewController.h"

@interface contentViewController ()

@end

@implementation contentViewController
@synthesize webView, dataObject;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [webView loadHTMLString:dataObject baseURL:[NSURL URLWithString:@""]];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.webView = nil;
    self.dataObject = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}


@end
