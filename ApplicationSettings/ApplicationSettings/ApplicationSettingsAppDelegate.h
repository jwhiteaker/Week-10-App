//
//  ApplicationSettingsAppDelegate.h
//  ApplicationSettings
//
//  Created by Joseph Whiteaker on 4/7/13.
//  Copyright (c) 2013 RVC Student. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ApplicationSettingsViewController;

@interface ApplicationSettingsAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ApplicationSettingsViewController *viewController;

@end
