//
//  Person.h
//  MagicalRecord Example App
//
//  Created by Alexander Blunck on 05.03.12.
//  Copyright (c) 2012 Ablfx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * age;

@end
