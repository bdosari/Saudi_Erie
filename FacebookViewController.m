//
//  FacebookViewController.m
//  Saudi_Erie
//
//  Created by Bader on 7/28/13.
//  Copyright (c) 2013 Bader. All rights reserved.
//

#import "FacebookViewController.h"

@interface FacebookViewController ()

@end

@implementation FacebookViewController

@synthesize _webView;

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
    NSString* url = @"http://www.facebook.com/pages/Saudis-in-Erie-PA-/144468058912382";
    
    NSURL* nsUrl = [NSURL URLWithString:url];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:nsUrl cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:30];
    
    [_webView loadRequest:request];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
