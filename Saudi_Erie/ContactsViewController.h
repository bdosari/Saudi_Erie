//
//  ContactsViewController.h
//  Saudi_Erie
//
//  Created by Bader on 7/23/13.
//  Copyright (c) 2013 Bader. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactsManager.h"

@class ContactsManager;

@interface ContactsViewController : UIViewController {
    ContactsManager *_contactsManager;
    IBOutlet UITableView *_contactsTable;
  
}

@property (strong) ContactsManager *_contactsManager;
@property (strong) UITableView *_contactsTable;

@end
