//
//  AppDelegate.h
//  iCoreData
//
//  Created by Trúc Phương >_< on 02/04/2018.
//  Copyright © 2018 iDev Bao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong)NSManagedObjectContext * ManagedObjectContext;
@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

