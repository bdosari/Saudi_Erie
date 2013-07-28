//
//  CategoriesManager.h
//  Saudi_Erie
//
//  Created by Bader on 7/28/13.
//  Copyright (c) 2013 Bader. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoriesManager : NSObject{
    NSArray *_entries;
}

@property(strong) NSArray *_entries;

//--
-(NSString*)readCategoryNameAtIndex:(NSInteger)index;
-(NSInteger)getNumberOfCategories;


@end
