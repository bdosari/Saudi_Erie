//
//  PlacesViewController.m
//  Saudi_Erie
//
//  Created by Bader on 7/27/13.
//  Copyright (c) 2013 Bader. All rights reserved.
//

#import "PlacesViewController.h"

@interface PlacesViewController ()

@end

@implementation PlacesViewController

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
    for( NSString *familyName in [UIFont familyNames] ) {
        for( NSString *fontName in [UIFont fontNamesForFamilyName:familyName] ) {
            NSLog(@"%@", fontName);
        }
    }
    
}

@end
