//
//  PersonTableViewController.m
//  MagicalRecord Example App
//
//  Created by Alexander Blunck on 05.03.12.
//  Copyright (c) 2012 Ablfx. All rights reserved.
//

#import "PersonTableViewController.h"
#import "AddViewController.h"
#import "Person.h"

@implementation PersonTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Init Array to hold TableView Data
    tableDataArray = [NSMutableArray new];
    
    //"Add" button
    UIBarButtonItem *addBarItemButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonPressed)];
    self.navigationItem.rightBarButtonItem = addBarItemButton;
    
    //Register addNewPersonToArray to recieve "newPerson" notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addNewPersonToArray:) name:@"newPerson" object:nil];
    
    //Load all Persons already saved
    [tableDataArray addObjectsFromArray:[Person findAll]];
    [self.tableView reloadData];
}

-(void) addButtonPressed {
    AddViewController *addVc = [[AddViewController alloc] initWithNibName:@"AddViewController" bundle:nil];
    [self.navigationController pushViewController:addVc animated:YES];
}

-(void) addNewPersonToArray:(NSNotification*) notification {
    Person *newPerson = [notification object];
    [tableDataArray addObject:newPerson];
    [self.tableView reloadData];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return tableDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    // Configure the cell...
    Person *currentPerson = [tableDataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = currentPerson.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", currentPerson.age];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 
}

@end
