//
//  ContactsViewController.m
//  Saudi_Erie
//
//  Created by Bader on 7/23/13.
//  Copyright (c) 2013 Bader. All rights reserved.
//

#import "ContactsViewController.h"
#import "ContactDetailViewController.h"
#import "KSLabel.h"

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation ContactsViewController

@synthesize _contactsTable;
@synthesize _contactsManager;


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
    _contactsManager = [[ContactsManager alloc]init];
    
    // loading background image
//   _contactsTable.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BG1.png"]];
    _contactsTable.backgroundColor = UIColorFromRGB(0x447294);
    
    
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
    return [_contactsManager getNumberOfContacts];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableView *newTableView = [[UITableView alloc]init];
    /*
    CATransition *transition = [CATransition animation];
    transition.duration = 0.4f;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    //  transitioning = YES;
    transition.delegate = self;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
	
    self.navigationController.navigationBarHidden = NO;
    
    
    [self.navigationController pushViewController:newTableView animated:YES];
     */
    [self presentContactDetailViewController:indexPath.row];
}


- (void)presentContactDetailViewController:(NSInteger) selectedRow {
    UIStoryboard *storyboard = self.storyboard;
    ContactDetailViewController *contactDetailView = [storyboard instantiateViewControllerWithIdentifier:@"ContactDetailViewController"];
    
    
    // setting contact detail
    contactDetailView._name = [_contactsManager readContactNameAtIndex:selectedRow];
    contactDetailView._phone = [_contactsManager readContactPhoneAtIndex:selectedRow];
    
    
    // Configure the new view controller here.
    [self.navigationController pushViewController:contactDetailView animated:YES];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   
            /*
        TitleDayCellViewController *cell = (TitleDayCellViewController *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        
        
        if (cell == nil) {
			NSArray *outlets = [[NSBundle mainBundle] loadNibNamed:@"TitleDayCellView" owner:self options:nil];
			for (id currentObject in outlets) {
				if ([currentObject isKindOfClass:[UITableViewCell class]]){
					cell =  (TitleDayCellViewController *) currentObject;
					break;
				}
			}
            
            
		}
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        cell.LabelDay.text = [DaysArray objectAtIndex:[indexPath row]];
        
        
        
        cell.LabelDay.textColor = [UIColor whiteColor];
        cell.LabelDay.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
        cell.LabelDay.shadowOffset = CGSizeMake(1.0, 1.0);
        
        
        
        NSString *ImageStr = @"DayCellNew.png";
#ifdef ENABLE_LOADING_IMAGE
        cell.backgroundView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:ImageStr]] autorelease];
#endif
        
        cell.backgroundView.alpha = ALPHA_VALUE1;

        
        */
    
    static NSString *CellIdentifier = @"BirdSightingCell";
    
  
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
   // BirdSighting *sightingAtIndex = [self.dataController objectInListAtIndex:indexPath.row];
    [[cell textLabel] setText:[_contactsManager readContactNameAtIndex:indexPath.row]];
    
    cell.textLabel.textColor = UIColorFromRGB(0x447294);//    cell.textLabel.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
    cell.textLabel.shadowOffset = CGSizeMake(1.0, 1.0);
    cell.textLabel.font=[UIFont fontWithName:@"Arial Rounded MT Bold" size:18.0];
    cell.backgroundColor = UIColorFromRGB(0xF4D6BC);

 //   UIImageView *myImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell1.png"]] ;
 //   cell.backgroundView = myImage;
 //   [cell.backgroundView setAlpha:0.7f];
    
    cell.textLabel.textAlignment = NSTextAlignmentRight;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
 
    return cell;
    
    
}

 

@end
