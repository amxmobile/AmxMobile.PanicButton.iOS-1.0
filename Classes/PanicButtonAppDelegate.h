//
//  PanicButtonAppDelegate.h
//  PanicButton
//
//  Created by Matthew Baxter-Reynolds on 25/08/2010.
//  Copyright (c) 2010 AMX Software Ltd. All rights reserved.
//


#import <UIKit/UIKit.h>

@class PanicButtonViewController;

@interface PanicButtonAppDelegate : NSObject <UIApplicationDelegate> {

    UIWindow *window;

    PanicButtonViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;


@property (nonatomic, retain) IBOutlet PanicButtonViewController *viewController;

@end

