//
//  PlacesViewController.h
//  Saudi_Erie
//
//  Created by Bader on 7/27/13.
//  Copyright (c) 2013 Bader. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoriesManager.h"

@interface PlacesViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>{
    IBOutlet UITableView *_categoriesTable;
    CategoriesManager *_categoriesManager;
}

@property (strong) UITableView *_categoriesTable;
@property (strong) CategoriesManager *_categoriesManager;

@end
