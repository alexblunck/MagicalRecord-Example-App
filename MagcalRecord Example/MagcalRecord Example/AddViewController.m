//
//  AddViewController.m
//  MagcalRecord Example
//
//  Created by Alexander Blunck on 4/13/13.
//  Copyright (c) 2013 Alexander Blunck. All rights reserved.
//

#import "AddViewController.h"
#import "Person.h"

@implementation AddViewController

#pragma mark - LifeCycle
- (void)viewDidLoad
{
    [super viewDidLoad];
   
    self.title = @"Add Person";
    
}

#pragma mark - Buttons
-(IBAction) addButtonSelected:(id)sender
{
    //Validate
    if (_nameField.text.length > 0 & _ageField.text.length > 0)
    {
        //Create new entity and set properties
        Person *newPerson = [Person MR_createEntity];
        newPerson.name = _nameField.text;
        newPerson.age = [NSNumber numberWithInteger:[_ageField.text integerValue]];
        
        //Save to persistant storage
        [[NSManagedObjectContext MR_defaultContext] saveToPersistentStoreAndWait];
        
        //Inform app
        [[NSNotificationCenter defaultCenter] postNotificationName:@"newPersonAdded" object:nil];
        
        //dismiss view
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        [[[UIAlertView alloc] initWithTitle:@"Warning" message:@"Please Fill out all fields" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
    }
}

@end
