//
//  PanicButtonViewController.h
//  PanicButton
//
//  Created by Matthew Baxter-Reynolds on 25/08/2010.
//  Copyright (c) 2010 AMX Software Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PanicButtonViewController : UIViewController {

    UIButton *buttonArm;
    UIButton *buttonPanic;
    
}

@property (nonatomic, retain) IBOutlet UIButton *buttonArm;
@property (nonatomic, retain) IBOutlet UIButton *buttonPanic;

-(IBAction)handleArm:(id)sender;
-(IBAction)handlePanic:(id)sender;

@end

