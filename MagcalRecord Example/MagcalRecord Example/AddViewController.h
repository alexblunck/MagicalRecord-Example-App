//
//  AddViewController.h
//  MagcalRecord Example
//
//  Created by Alexander Blunck on 4/13/13.
//  Copyright (c) 2013 Alexander Blunck. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController
{
    IBOutlet UITextField *_nameField;
    IBOutlet UITextField *_ageField;
}

-(IBAction) addButtonSelected:(id)sender;

@end
