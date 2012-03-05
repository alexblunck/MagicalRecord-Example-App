//
//  AddViewController.h
//  MagicalRecord Example App
//
//  Created by Alexander Blunck on 05.03.12.
//  Copyright (c) 2012 Ablfx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddViewController : UIViewController {
    IBOutlet UITextField *nameField;
    IBOutlet UITextField *ageField;
}

-(IBAction)savePressed:(id)sender;

@end
