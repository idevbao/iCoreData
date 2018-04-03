//
//  Nhanvien+CoreDataProperties.m
//  iCoreData
//
//  Created by Trúc Phương >_< on 02/04/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import "Nhanvien+CoreDataProperties.h"
#import "AppDelegate.h"
@implementation Nhanvien (CoreDataProperties)

+ (NSFetchRequest<Nhanvien *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Nhanvien"];
}

@dynamic congViec;
@dynamic iD;
@dynamic info;
@dynamic nhanviens;
+(Nhanvien*)insertNewEmployee:(NSDate*)dateOfBirth name:(NSString*)name info:(NSString*)infor withID:(NSString*)iD andCongViec:(NSString*)congviec{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext* context = appDelegate.ManagedObjectContext;
    Nhanvien* Employee = (Nhanvien*)[NSEntityDescription insertNewObjectForEntityForName:@"Nhanvien" inManagedObjectContext:context];
    
    Employee.dateOfBirth = dateOfBirth;
    Employee.name = name;
    Employee.info = infor;
    Employee.iD = iD;
    Employee.congViec = congviec;
    NSError *error = nil;
    if ([context save:&error] == NO) {
        NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
    }
    NSLog(@"%@ thanh cong",Employee.iD);
    return Employee;
}
+(NSArray*)getAllEmployee{

    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext* moc = appDelegate.ManagedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Nhanvien"];
    
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if (!results) {
        NSAssert(NO, @"Error executeFetchRequest context: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    NSLog(@"get thanh cong");
    
    return results;
}
+(BOOL)delAllEmployee{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext* moc = appDelegate.ManagedObjectContext;
    NSArray *resultsRequest = [self getAllEmployee];
    for (Nhanvien*nv in resultsRequest) {
        [moc deleteObject:nv];
    }

    NSError *error;
    if ([moc save:&error] == NO) {
        NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
         return NO;
    }
    NSLog(@"xoa thanh cong nhanvien");
    return YES;
}

+(NSArray*)getEmployee{
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext* moc = appDelegate.ManagedObjectContext;
//    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Nhanvien"]; or
    NSFetchRequest *request = [Nhanvien fetchRequest];
    
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if (!results) {
        NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    NSLog(@"get thanh cong");
    
    return results;
}

-(void)toString {
    NSLog(@"--------------------%@ -%@-%@-%@",self.name,self.info, self.iD, self.congViec);
    
}
@end
