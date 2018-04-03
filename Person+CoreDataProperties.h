//
//  Person+CoreDataProperties.h
//  iCoreData
//
//  Created by Trúc Phương >_< on 02/04/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import "Person+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *dateOfBirth;
@property (nullable, nonatomic, copy) NSString *name;

@end

NS_ASSUME_NONNULL_END
