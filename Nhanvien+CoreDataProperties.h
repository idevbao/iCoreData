//
//  Nhanvien+CoreDataProperties.h
//  iCoreData
//
//  Created by Trúc Phương >_< on 02/04/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import "Nhanvien+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Nhanvien (CoreDataProperties)

+ (NSFetchRequest<Nhanvien *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *congViec;
@property (nullable, nonatomic, copy) NSString *iD;
@property (nullable, nonatomic, copy) NSString *info;
@property (nullable, nonatomic, retain) Phong *nhanviens;
+(Nhanvien*)insertNewEmployee:(NSDate*)dateOfBirth name:(NSString*)name info:(NSString*)infor withID:(NSString*)iD andCongViec:(NSString*)congviec;
+(NSArray*)getAllEmployee;
+(NSArray*)getEmployee;
+(BOOL)delAllEmployee;
-(void)toString ;
@end

NS_ASSUME_NONNULL_END
