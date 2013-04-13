//
//  AppDelegate.m
//  MagcalRecord Example
//
//  Created by Alexander Blunck on 4/13/13.
//  Copyright (c) 2013 Alexander Blunck. All rights reserved.
//

#import "AppDelegate.h"

#import "PersonTableViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //2. Setup MagivalRecord & CoreData
    [MagicalRecord setupAutoMigratingCoreDataStack];
    
//    //Delete all records for example purposes
//    //[Person MR_truncateAll];
//    
//    
//    
//    //
//    //Save
//    //
//    Person *alex = [Person MR_createEntity];
//    alex.name = @"Alex";
//    alex.age = @23;
//    
//    
//    //
//    //Select
//    //
//    //Retrieve all NSManagedObject's records
//    NSArray *people = [Person MR_findAll];
//    NSLog(@"Number of saved people records: %i", people.count);
//    
//    //Retrieve first record
//    Person *record = [Person MR_findFirst];
//    NSLog(@"First persons name: %@", record.name);
//    
//    //Retrieve records conditionally & sort
//    NSArray *people2 = [Person MR_findByAttribute:@"name" withValue:@"Alex" andOrderBy:@"age" ascending:YES];
//    NSLog(@"Number of saved people with 'alex' as a name: %i", people2.count);
//    
//    
//    
//    //
//    //Update
//    //
//    record.age = @56;
//    
//    
//    //
//    //Delete
//    //
//    //Delete single record, after retrieving it
//    [record MR_deleteEntity];
//    
//    
//    
//    //
//    //Save to persitant storage
//    //
//    [[NSManagedObjectContext MR_defaultContext] saveToPersistentStoreAndWait];
    
    
    
    //View
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    PersonTableViewController *viewController = [PersonTableViewController new];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:viewController];
    self.window.rootViewController = navController;
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
