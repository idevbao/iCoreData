//
//  ViewController.m
//  iCoreData
//
//  Created by Trúc Phương >_< on 02/04/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import "ViewController.h"
#import "infoDATAView.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView * tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    NSString * nameNavigationItemAdd = @"Add";
    UIBarButtonItem * btnItemNaviRight = [[UIBarButtonItem alloc] initWithTitle:nameNavigationItemAdd style:UIBarButtonItemStylePlain target:self action:@selector(targetAdd:)];
    self.navigationItem.rightBarButtonItem = btnItemNaviRight;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell= [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];

    }
    cell.textLabel.text = @"1";
    return cell;
    
}
-(void)targetAdd:(id)sender{
    
    
    [self.navigationController pushViewController:[infoDATAView new] animated:YES];
    //    [self presentViewController:[infoDATAView new] animated:YES completion:^{
    //    }];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController pushViewController:[infoDATAView new] animated:YES];
}
@end

