//
//  PersonTableViewController.m
//  MagcalRecord Example
//
//  Created by Alexander Blunck on 4/13/13.
//  Copyright (c) 2013 Alexander Blunck. All rights reserved.
//

#import "PersonTableViewController.h"
#import "Person.h"
#import "AddViewController.h"

@interface PersonTableViewController ()
{
    NSMutableArray *_dataArray;
}
@end

@implementation PersonTableViewController

#pragma mark - LifeCycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"People";
    
    //Array to hold all saved records
    _dataArray = [NSMutableArray new];
    
    //Refresh data
    [self refreshData];
    
    //"Add" button
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonSelected)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    //"Delete" button
    UIBarButtonItem *deleteButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(deleteButtonSelected)];
    self.navigationItem.leftBarButtonItem = deleteButton;
    
    //Listen for notifications
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notificationNewPersonAdded:) name:@"newPersonAdded" object:nil];
}



#pragma mark - Refresh
-(void) refreshData
{
    [_dataArray removeAllObjects];
    NSArray *allRecords = [Person findAllSortedBy:@"name" ascending:YES];
    [_dataArray addObjectsFromArray:allRecords];
    [self.tableView reloadData];
}



#pragma mark  - Notifications
-(void) notificationNewPersonAdded:(NSNotification*)notification
{
    [self refreshData];
}



#pragma mark - Buttons
-(void) addButtonSelected
{
    AddViewController *viewController = [[AddViewController alloc] initWithNibName:@"AddViewController" bundle:nil];
    [self.navigationController pushViewController:viewController animated:YES];
}

-(void) deleteButtonSelected
{
    [Person MR_truncateAll];
    [[NSManagedObjectContext MR_defaultContext] saveToPersistentStoreAndWait];
    [self refreshData];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    
    // Configure the cell...
    Person *person = [_dataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = person.name;
    cell.detailTextLabel.text = [person.age stringValue];
    
    return cell;
}



#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}

@end
