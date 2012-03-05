//
//  AddViewController.m
//  MagicalRecord Example App
//
//  Created by Alexander Blunck on 05.03.12.
//  Copyright (c) 2012 Ablfx. All rights reserved.
//

#import "AddViewController.h"
#import "Person.h"


@implementation AddViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"New Person";
}

-(IBAction)savePressed:(id)sender {
   
    if (nameField.text.length > 0 & ageField.text.length > 0) {
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name==%@", nameField.text];
        NSNumber *resultNumber = [Person numberOfEntitiesWithPredicate:predicate];
        
        if ([resultNumber intValue] == 0) {
            Person *newPerson = [Person createEntity];
            newPerson.name = nameField.text;
            newPerson.age = [NSNumber numberWithInt:[ageField.text intValue]];
            
            [[NSManagedObjectContext MR_defaultContext] MR_save];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"newPerson" object:newPerson];
            
            [self.navigationController popViewControllerAnimated:YES];
        } 

        else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Name already exists" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
            [alert release];
        }
    
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" message:@"Please Fill out all fields" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [alert release];
    }
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
