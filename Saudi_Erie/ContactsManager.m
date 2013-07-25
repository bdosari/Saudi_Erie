//
//  ContactsManager.m
//  Saudi_Erie
//
//  Created by Bader on 7/24/13.
//  Copyright (c) 2013 Bader. All rights reserved.
//

#import "ContactsManager.h"



@implementation ContactsManager

@synthesize _entries;

- (id)init{
    if ( self = [super init] ) {
        [self readContactList:@"ContactList.plist"];
    }
    
    return self;
}

-(void)readContactList: (NSString*) fileName{
    NSLog(@"reading contact list");
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //1
    NSString *documentsDirectory = [paths objectAtIndex:0]; //2
    NSString *path = [documentsDirectory stringByAppendingPathComponent:fileName]; //3
    
    //Load Dictionary with wood name cross refference values for image name
   // NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"creatureList" ofType:@"plist"];
   // NSDictionary *creatureDictionary = [[NSDictionary alloc] initWithContentsOfFile:plistCatPath];
    
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath: path]) //4
    {
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"ContactList" ofType:@"plist"]; //5
        
        [fileManager copyItemAtPath:bundle toPath: path error:&error]; //6
    }
    
    
    //  citiesDB = [[NSMutableDictionary alloc] initWithContentsOfFile: path];
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    
    
    NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:path];
    NSDictionary *temp = (NSDictionary *)[NSPropertyListSerialization
                                          propertyListFromData:plistXML
                                          mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                          format:&format
                                          errorDescription:&errorDesc];
    
    if (!plistXML)
    {
        NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
    }
    
    // NSMutableArray *answerArray = [NSMutableArray arrayWithArray:[temp objectForKey:@"countryName"]];
    
    //NSArray *entries = (NSArray *)d;
    _entries = (NSArray *)temp;

    
}

-(NSString*)readContactNameAtIndex:(NSInteger)index
{
    NSDictionary *contactEntry = (NSDictionary*)[_entries objectAtIndex:index];
    return (NSString *)[contactEntry objectForKey:@"Name"];
}

-(NSString*)readContactPhoneAtIndex:(NSInteger)index
{
    NSDictionary *contactEntry = [_entries objectAtIndex:index];
    return (NSString *)[contactEntry objectForKey:@"Phone"];
}

-(NSInteger)getNumberOfContacts
{
    return [_entries count];
}


@end
