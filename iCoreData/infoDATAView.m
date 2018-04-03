//
//  infoDATAView.m
//  iCoreData
//
//  Created by Trúc Phương >_< on 02/04/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import "infoDATAView.h"
#import "ViewController.h"
#import "Phong+CoreDataProperties.h"
#import "Nhanvien+CoreDataProperties.h"
#import "NSDate+converterDate.h"




@interface infoDATAView ()
@property (nonatomic,strong) UIImageView * imgviewINFO;
@property (nonatomic,strong) UITextField * txtINFO;
@property (nonatomic,strong) UIImage * imgINFO;


@end

@implementation infoDATAView

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    _imgviewINFO = [[UIImageView alloc] initWithFrame:CGRectMake(10, 50, 100, 100)];
    _imgviewINFO.image = _imgINFO;
    _imgviewINFO.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_imgviewINFO];
    UIButton * btnAdd = [[UIButton alloc] initWithFrame: CGRectMake(100, 300, 100, 50)];
    btnAdd.backgroundColor = [UIColor blueColor];
    [btnAdd addTarget:self action:@selector(tapAdd:) forControlEvents:UIControlEventTouchUpInside];
    [btnAdd setTitle:@"Add Data" forState:UIControlStateNormal];
    
    [self.view addSubview:btnAdd];
    
    UIButton * btnFetch = [[UIButton alloc] initWithFrame: CGRectMake(100, 400, 100, 50)];
    btnFetch.backgroundColor = [UIColor blueColor];
    [btnFetch addTarget:self action:@selector(tapFetch:) forControlEvents:UIControlEventTouchUpInside];
    [btnFetch setTitle:@"Fetch Data" forState:UIControlStateNormal];
    
    [self.view addSubview:btnFetch];
    UIButton * btnDel = [[UIButton alloc] initWithFrame: CGRectMake(100, 500, 100, 50)];
    btnDel.backgroundColor = [UIColor blueColor];
    [btnDel addTarget:self action:@selector(tapDel:) forControlEvents:UIControlEventTouchUpInside];
    [btnDel setTitle:@"Delete Data" forState:UIControlStateNormal];
    
    [self.view addSubview:btnDel];
    
    UIButton * btnFilter = [[UIButton alloc] initWithFrame: CGRectMake(100, 700, 100, 50)];
    btnFilter.backgroundColor = [UIColor blueColor];
    [btnFilter addTarget:self action:@selector(tapFilter:) forControlEvents:UIControlEventTouchUpInside];
    [btnFilter setTitle:@"btnFilter Data" forState:UIControlStateNormal];
    
    [self.view addSubview:btnFilter];

    
    
    
}
-(void)tapAdd:(id)sender{
    
    Phong * phong = [Phong insertNewDepartment:@"Q.Hoang Mai - DN city." withCity:@"TP.DaNang" andPhoneNumber:9];
    Phong * phong1 = [Phong insertNewDepartment:@"Q.12 - HCM city." withCity:@"TP.HCM" andPhoneNumber:8];
    Phong * phong2 = [Phong insertNewDepartment:@"Q.Joang kiem - HN city." withCity:@"TP.HN" andPhoneNumber:5];
    //phong chua nhieu nhan vien

    NSSet<Nhanvien*> * set;
    NSSet<Nhanvien*> * set1;
    NSSet<Nhanvien*> * set2;
    Nhanvien * nv = [Nhanvien insertNewEmployee:[NSDate converterDate:06 month:04 year:1994 ] name:@"iDev---1" info:@"idev IOS eng ObjC" withID:@"1311060344" andCongViec:@"dev mobile IOS" ];
    nv.nhanviens = phong2;
    
    
    [set2  setByAddingObject:nv];
    Nhanvien * nv1 = [Nhanvien insertNewEmployee:[NSDate converterDate:05 month:02 year:1995 ] name:@"iDev---2" info:@"XUDI" withID:@"13xx" andCongViec:@"bank" ];
    nv1.nhanviens = phong2;
    
    
   [set2  setByAddingObject:nv1];
    
    Nhanvien * nv2 = [Nhanvien insertNewEmployee:[NSDate converterDate:05 month:02 year:1996 ] name:@"iDev---3" info:@"NG" withID:@"13xx1" andCongViec:@"bank" ];
    nv2.nhanviens = phong2;
   [set2  setByAddingObject:nv2];
    
    
    Nhanvien * nv3 = [Nhanvien insertNewEmployee:[NSDate converterDate:05 month:02 year:1999 ] name:@"iDev---4" info:@"NG2" withID:@"13xx12" andCongViec:@"bank1" ];
    nv3.nhanviens = phong2;
    
    [set2  setByAddingObject:nv3];
    
    [phong2 addPhong:set2];
    

    Nhanvien * nv4 = [Nhanvien insertNewEmployee:[NSDate converterDate:05 month:02 year:1999 ] name:@"iDev---5" info:@"NG2" withID:@"13xx12" andCongViec:@"bank1" ];
    nv4.nhanviens = phong1;
   [set1  setByAddingObject:nv4];
    
    [phong1 addPhong:set1]; // add nahn vien vao phong
    
    
    Nhanvien * nv5 = [Nhanvien insertNewEmployee:[NSDate converterDate:05 month:02 year:1999 ] name:@"iDev---" info:@"NGuyen" withID:@"13xx12" andCongViec:@"bank1ingHCM" ];
    nv5.nhanviens = phong;
    [set  setByAddingObject:nv5];
    [phong addPhong:set];
    
    
    
    


    
}
-(void)tapDel:(id)sender{
    [Nhanvien delAllEmployee];// static ko can khoi tao obj
    [Phong delAllDepartment];
    
}
-(void)tapFetch:(id)sender{
    NSArray * arrayFetch = [Nhanvien getAllEmployee];
    if (arrayFetch.count == 0) {
        NSLog(@"ko co data");
    }
    for (Nhanvien* nv in arrayFetch) {
        NSLog(@"Nhan vien: %@", nv.name);
    }
    
    NSArray * arrayFetchDepartment = [Phong getAllDepartment];
    if (arrayFetchDepartment.count == 0) {
        NSLog(@"ko co dataarrayFetchDepartment");
    }
    
    NSLog(@"co tat ca cac phong");
    for (Phong* phong in arrayFetchDepartment) {
        NSLog(@"phong: %@", phong.city);
    }
}

-(void)tapFilter:(id)sender{
    NSArray * resultsFilter = [Phong fetchDepartmentWithFilter:@"HCM" Exactly:@"TP.HN"];
    for (Phong * phong in resultsFilter) {
        [phong toString];
    }
}
@end
/*Managed Object Model: Là biểu đồ biểu diễn các entity, các properties trong từng entity và mối quan hệ giữa chúng. Chúng cho phép Coredate map từ các bản ghi trong một persistent store tới các managed object được sử dụng trong phần mềm của bạn. Model là một tập hợp các entity description object (instance của NSEntityDescription).
 NSEntityDescription : Mô tả tên của class được dùng để biểu diễn một Entity và các thuộc tính của nó ( attribute and Relationship)
 ManagedObjectContext: Là vùng quản lý các object. Mọi hoạt động về quản lý coredata đều được diễn ra ở đây. (VD: Thêm, sửa, xóa, lưu)
 ManagedObject : Là các đối tượng được quản lý bởi coredata*/

