//
//  ContactsManager.h
//  Saudi_Erie
//
//  Created by Bader on 7/24/13.
//  Copyright (c) 2013 Bader. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactsManager : NSObject{
    NSArray *_entries;
    
}

@property(strong) NSArray *_entries;

//--
-(NSString*)readContactNameAtIndex:(NSInteger)index;
-(NSString*)readContactPhoneAtIndex:(NSInteger)index;
-(NSInteger)getNumberOfContacts;

@end
