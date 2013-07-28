//
//  PlacesViewController.m
//  Saudi_Erie
//
//  Created by Bader on 7/27/13.
//  Copyright (c) 2013 Bader. All rights reserved.
//

#import "PlacesViewController.h"
#import "KSLabel.h"

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface PlacesViewController ()

@end

@implementation PlacesViewController

@synthesize _categoriesManager;
@synthesize _categoriesTable;


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
    
    // initializing Contacts manager to read data
    _categoriesManager = [[CategoriesManager alloc]init];
    
    // loading background image
    //   _contactsTable.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BG1.png"]];
    _categoriesTable.backgroundColor = UIColorFromRGB(0x447294);
    
    
    KSLabel *titleLabel = [[KSLabel alloc] initWithFrame:CGRectMake(0, 0, 320, 30)];
    titleLabel.textColor = UIColorFromRGB(0x8FBCDB);
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.text = @"جهات الاتصال";
    //titleLabel.layer.borderColor = [UIColor blackColor].CGColor;
    //titleLabel.layer.borderWidth = 2.0;
    [titleLabel setFont:[UIFont fontWithName:@"Arial-BoldMT" size:22]];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.outlineColor = [UIColor whiteColor];
    [titleLabel setDrawOutline:YES];
    
    [self.navigationItem setTitleView:titleLabel];
    // setting navigation bar text color
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_categoriesManager getNumberOfCategories];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   // [self presentContactDetailViewController:indexPath.row];
}


- (void)presentContactDetailViewController:(NSInteger) selectedRow {
  /*
   UIStoryboard *storyboard = self.storyboard;
    ContactDetailViewController *contactDetailView = [storyboard instantiateViewControllerWithIdentifier:@"ContactDetailViewController"];
    
    
    // setting contact detail
    contactDetailView._name = [_contactsManager readContactNameAtIndex:selectedRow];
    contactDetailView._phone = [_contactsManager readContactPhoneAtIndex:selectedRow];
    
    
    // Configure the new view controller here.
    [self.navigationController pushViewController:contactDetailView animated:YES];
   */
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellIdentifier = @"categoryCell";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    [[cell textLabel] setText:[_categoriesManager readCategoryNameAtIndex:indexPath.row]];
    
    cell.textLabel.textColor = UIColorFromRGB(0x447294);//    cell.textLabel.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
    cell.textLabel.shadowOffset = CGSizeMake(1.0, 1.0);
    cell.textLabel.font=[UIFont fontWithName:@"Arial Rounded MT Bold" size:18.0];
    cell.backgroundColor = UIColorFromRGB(0xF4D6BC);

    
    cell.textLabel.textAlignment = NSTextAlignmentRight;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    return cell;
    
    
}

@end
