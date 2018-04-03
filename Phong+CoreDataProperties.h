//
//  Phong+CoreDataProperties.h
//  iCoreData
//
//  Created by Trúc Phương >_< on 02/04/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import "Phong+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Phong (CoreDataProperties)

+ (NSFetchRequest<Phong *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *address;
@property (nullable, nonatomic, copy) NSString *city;
@property (nonatomic) int16_t phoneNumber;
@property (nullable, nonatomic, retain) NSSet<Nhanvien *> *phong;

@end

@interface Phong (CoreDataGeneratedAccessors)

- (void)addPhongObject:(Nhanvien *)value;
- (void)removePhongObject:(Nhanvien *)value;
- (void)addPhong:(NSSet<Nhanvien *> *)values;
- (void)removePhong:(NSSet<Nhanvien *> *)values;
+(Phong*)insertNewDepartment:(NSString*)address withCity:(NSString*)city andPhoneNumber:(int16_t)phoneNumber;
-(void)toString;
+(NSArray*)fetchDepartmentWithFilter:(NSString*)nameContains Exactly:(NSString*)exactly;
+(NSArray*)getAllDepartment;
+(BOOL)delAllDepartment;
@end

NS_ASSUME_NONNULL_END
