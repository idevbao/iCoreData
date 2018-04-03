//
//  Phong+CoreDataProperties.m
//  iCoreData
//
//  Created by Trúc Phương >_< on 02/04/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import "Phong+CoreDataProperties.h"
#import "AppDelegate.h"
#import "Nhanvien+CoreDataProperties.m"
@implementation Phong (CoreDataProperties)

+ (NSFetchRequest<Phong *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Phong"];
}

@dynamic address;
@dynamic city;
@dynamic phoneNumber;
@dynamic phong; // nahn vien
+(Phong*)insertNewDepartment:(NSString*)address withCity:(NSString*)city andPhoneNumber:(int16_t)phoneNumber{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext* context = appDelegate.ManagedObjectContext;

    Phong* department = (Phong*)[NSEntityDescription insertNewObjectForEntityForName:@"Phong" inManagedObjectContext:context];
    department.address = address;
    department.phoneNumber = phoneNumber;
    department.city = city;
    NSError *error = nil;
    if ([context save:&error] == NO) {
   
        NSAssert(NO, @"Error saving context------------------: %@\n%@", [error localizedDescription], [error userInfo]);
    }
    NSLog(@"%@ thanh cong",department.city);
    return department;
}
-(void)toString {
    NSLog(@"%@ -%d-%@",self.address,self.phoneNumber, self.city);
    
    if (self.phong != nil) {
        
        NSSet<Nhanvien *> *employlist = self.phong;
        if (employlist.count == 0) {
            return; // dung lai
        }
        NSLog(@"phong co %ld nhan  vien :",employlist.count);
        for (Nhanvien* nv in employlist) {

            [nv toString];
        }
    }
    
}

//lấy bộ với bộ lọc .Lọc dữ liệu trong Core Data sử dụng NSPredicate
+(NSArray*)fetchDepartmentWithFilter:(NSString*)nameContains Exactly:(NSString*)exactly{ //exactly chinh xac con Contains gan giong
    NSArray<Phong*> *phongFind ;
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext* moc = appDelegate.ManagedObjectContext;
     NSFetchRequest *request = [Phong fetchRequest];
    // mang loc tim kiem
    NSMutableArray <NSPredicate*> *supPerdicate = [NSMutableArray new];
    
    if (nameContains!=nil) {


        NSPredicate * predcate = [NSPredicate predicateWithFormat:@"city contains[cd] %@",nameContains]; // https: //developer.apple.com/library/content/documentation/Cocoa/Conceptual/Predicates/Articles/pSyntax. html
        
        

        [supPerdicate addObject:predcate];

        
    }
    if (exactly!=nil) {

        NSPredicate * predcate1 = [NSPredicate  predicateWithFormat:@"city == %@",exactly];
        [supPerdicate addObject:predcate1];


    }
    if (supPerdicate.count >0) {
        NSCompoundPredicate *compoundPredicate= [[NSCompoundPredicate alloc] initWithType:NSAndPredicateType subpredicates:supPerdicate]; // giao nhau // and
        request.predicate = compoundPredicate;
    }
    NSError *error = nil;
    phongFind = [moc executeFetchRequest:request error:&error];
    if (!phongFind) {
        NSAssert(NO, @"Error executeFetchRequest context: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    NSLog(@"fetchDepartmentWithFilter thanh cong");
    return phongFind;
}
+(NSArray*)getAllDepartment{
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext* moc = appDelegate.ManagedObjectContext;
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Phong"];
    
    NSError *error = nil;
    NSArray *results = [moc executeFetchRequest:request error:&error];
    if (!results) {
        NSAssert(NO, @"Error executeFetchRequest context: %@\n%@", [error localizedDescription], [error userInfo]);
        abort();
    }
    NSLog(@"get thanh cong");
    
    return results;
}

+(BOOL)delAllDepartment{
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext* moc = appDelegate.ManagedObjectContext;
    NSArray *resultsRequest = [self getAllDepartment];
    for (Phong*phong in resultsRequest) {
        [moc deleteObject:phong];
    }
    
    NSError *error;
    if ([moc save:&error] == NO) {
        NSAssert(NO, @"Error saving context: %@\n%@", [error localizedDescription], [error userInfo]);
        return NO;
    }
    NSLog(@"xoa Phong thanh cong");
    return YES;
}
@end
