//
//  CategoriesManager.m
//  Saudi_Erie
//
//  Created by Bader on 7/28/13.
//  Copyright (c) 2013 Bader. All rights reserved.
//

#import "CategoriesManager.h"

@implementation CategoriesManager
@synthesize _entries;

- (id)init{
    if ( self = [super init] ) {
        [self readCategoriesList];
    }
    
    return self;
}

-(void)readCategoriesList{
    NSLog(@"reading contact list");
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //1
    NSString *documentsDirectory = [paths objectAtIndex:0]; //2
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"CategoriesList.plist"]; //3
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath: path]) //4
    {
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"CategoriesList" ofType:@"plist"]; //5
        
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

-(NSString*)readCategoryNameAtIndex:(NSInteger)index
{
    NSDictionary *contactEntry = (NSDictionary*)[_entries objectAtIndex:index];
    return (NSString *)[contactEntry objectForKey:@"Name"];
}


-(NSInteger)getNumberOfCategories
{
    return [_entries count];
}

@end
