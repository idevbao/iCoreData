//
//  Person+CoreDataProperties.m
//  iCoreData
//
//  Created by Trúc Phương >_< on 02/04/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import "Person+CoreDataProperties.h"

@implementation Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Person"];
}

@dynamic dateOfBirth;
@dynamic name;

@end
