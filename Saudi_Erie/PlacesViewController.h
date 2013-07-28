//
//  PlacesViewController.h
//  Saudi_Erie
//
//  Created by Bader on 7/27/13.
//  Copyright (c) 2013 Bader. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlacesViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *_listOfCategories;
}

@property (strong) NSMutableArray *_listOfCategories;

@end
