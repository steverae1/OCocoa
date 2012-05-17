//
//  contentViewController.h
//  pageApp
//
//  Created by Steven Rae on 12-04-18.
//  Copyright (c) 2012 Steven Rae. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface contentViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) id dataObject;

@end
