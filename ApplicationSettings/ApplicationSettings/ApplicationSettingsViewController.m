//
//  ApplicationSettingsViewController.m
//  ApplicationSettings
//
//  Created by Joseph Whiteaker on 4/7/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import "ApplicationSettingsViewController.h"

@interface ApplicationSettingsViewController ()

@end

@implementation ApplicationSettingsViewController

@synthesize when;
@synthesize event;
@synthesize eventLocation;
NSMutableArray *where;
NSString *eventLocationSelected;

-(IBAction) doneEditing:(id) sender {
    [sender resignFirstResponder];
}

- (void)viewDidLoad {
    //---create an array containing the location values---
    where = [[NSMutableArray alloc] init];
    [where addObject:@"Home"];
    [where addObject:@"Work"];
    [where addObject:@"School"];
    [where addObject:@"Other"];
    [super viewDidLoad];
}

//---number of components in the Picker view---
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 1;
}

//---number of items(rows) in the Picker view---
- (NSInteger)pickerView:(UIPickerView *)thePickerView
numberOfRowsInComponent:(NSInteger)component {
    return [where count];
}

//---populating the Picker view---
- (NSString *)pickerView:(UIPickerView *)thePickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    return [where objectAtIndex:row];
}

//---the item selected by the user---
- (void)pickerView:(UIPickerView *)thePickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
    eventLocation = [where objectAtIndex:row];
}

-(IBAction) loadSettings: (id) sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    when.text = [defaults objectForKey:@"when"];
    event.text = [defaults objectForKey:@"event"];
    
    //---find the index of the array for the location saved---
    eventLocationSelected = [[NSString alloc] initWithString:
                             [defaults objectForKey:@"eventLocation"]];
    int selIndex = [where indexOfObject:eventLocationSelected];
    
    //---display the saved location in the Picker view---
    [eventLocation selectRow:selIndex inComponent:0 animated:YES];
}

-(IBAction) saveSettings: (id) sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:when.text forKey:@"when"];
    [defaults setObject:event.text forKey:@"event"];
    [defaults setObject:eventLocation forKey:@"eventLocation"];
    [defaults synchronize];
    
    UIAlertView *alert =
    [[UIAlertView alloc] initWithTitle:@"Settings Value Saved"
                               message:@"Settings Saved"
                              delegate:nil
                     cancelButtonTitle:@"Done"
                     otherButtonTitles:nil];
    [alert show];
    [alert release];
}

- (void)dealloc {
    [when release];
    [where release];
    [eventLocationSelected release];
    [event release];
    [eventLocation release];
    [super dealloc];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
