//
//  CoreDataItem.h
//  biTaKa
//
//  Created by Admin on 09/11/14.
//  Copyright (c) 2014 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface CoreDataItem : NSManagedObject

@property (nonatomic, retain) NSString * itemName;
@property (nonatomic, retain) NSString * itemCategory;
@property (nonatomic, retain) NSDecimalNumber * itemPrice;
@property (nonatomic, retain) NSString * itemDescription;

-(instancetype) initWithName:(NSString*)iName
                   iCategory:(NSString*)iCat
                      iPrice:(NSDecimalNumber*) iPrice
                iDescription:(NSString*) iDesc;
@end