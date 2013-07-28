//
//  ContactDetailViewController.m
//  Saudi_Erie
//
//  Created by Bader on 7/27/13.
//  Copyright (c) 2013 Bader. All rights reserved.
//

#import "ContactDetailViewController.h"



@implementation ContactDetailViewController

@synthesize _phoneLabel;
@synthesize _nameLabel;
@synthesize _emailLabel;
@synthesize _email;
@synthesize _name;
@synthesize _phone;



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
    _nameLabel.textColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.7 alpha:1.0];
    _nameLabel.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
    _nameLabel.shadowOffset = CGSizeMake(1.0, 1.0);
    
    _phoneLabel.textColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.7 alpha:1.0];
    _phoneLabel.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
    _phoneLabel.shadowOffset = CGSizeMake(1.0, 1.0);
    
    
    _phoneLabel.text = _phone;
    _nameLabel.text = _name;
    _emailLabel.text = _email;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
