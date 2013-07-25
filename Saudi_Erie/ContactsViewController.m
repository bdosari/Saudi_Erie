//
//  ContactsViewController.m
//  Saudi_Erie
//
//  Created by Bader on 7/23/13.
//  Copyright (c) 2013 Bader. All rights reserved.
//

#import "ContactsViewController.h"

@interface ContactsViewController ()

@end

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
    _contactsManager = [[ContactsManager alloc]init];
    
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
/*
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
 NSArray *tableArray = [[NSArray alloc]initWithObjects:Week1Table,Week2Table,Week3Table,Week4Table,Week5Table,Week6Table, nil];
 
 for(int j=0;j<6;j++)
 {
 UITableView *tempTable = [tableArray objectAtIndex:j];
 if (tableView != tempTable) {
 [tempTable deselectRowAtIndexPath:[tempTable indexPathForSelectedRow] animated:NO];
 }
 }
 
 [tableArray release];
 
 
 }
 */




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
    
    cell.textLabel.textColor = [UIColor colorWithRed:0.4 green:0.4 blue:0.7 alpha:1.0];
    cell.textLabel.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
    cell.textLabel.shadowOffset = CGSizeMake(1.0, 1.0);
    cell.textLabel.font=[UIFont fontWithName:@"Arial Rounded MT Bold" size:15.0];
    cell.backgroundColor = _contactsTable.backgroundColor;

    
    cell.textLabel.textAlignment = UITextAlignmentRight;
    
  //  [[cell detailTextLabel] setText:[formatter stringFromDate:(NSDate *)sightingAtIndex.date]];
    return cell;
    
    
}

 

@end
