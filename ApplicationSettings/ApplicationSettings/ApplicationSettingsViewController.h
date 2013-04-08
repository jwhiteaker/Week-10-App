//
//  ApplicationSettingsViewController.h
//  ApplicationSettings
//
//  Created by Joseph Whiteaker on 4/7/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ApplicationSettingsViewController : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate>
{
    IBOutlet UITextField *when;
    IBOutlet UITextField *event;
    IBOutlet UIPickerView *eventLocation;
}

@property (nonatomic, retain) UITextField *when;
@property (nonatomic, retain) UITextField *event;
@property (nonatomic, retain) UIPickerView *eventLocation;

-(IBAction) loadSettings: (id) sender;
-(IBAction) saveSettings: (id) sender;
-(IBAction) doneEditing: (id) sender;

@end
