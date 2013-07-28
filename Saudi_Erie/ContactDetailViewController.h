//
//  ContactDetailViewController.h
//  Saudi_Erie
//
//  Created by Bader on 7/27/13.
//  Copyright (c) 2013 Bader. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactDetailViewController : UIViewController{
    IBOutlet UILabel *_nameLabel;
    IBOutlet UILabel *_phoneLabel;
    IBOutlet UILabel *_emailLabel;
    
    NSString *_name;
    NSString *_phone;
    NSString *_email;
    
}

@property (strong) UILabel *_nameLabel;
@property (strong) UILabel *_phoneLabel;
@property (strong) UILabel *_emailLabel;
@property (strong) NSString *_name;
@property (strong) NSString *_phone;
@property (strong) NSString *_email;
@end
