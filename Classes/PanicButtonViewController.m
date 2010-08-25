//
//  PanicButtonViewController.m
//  PanicButton
//
//  Created by Matthew Baxter-Reynolds on 25/08/2010.
//  Copyright (c) 2010 AMX Software Ltd. All rights reserved.
//

#import "PanicButtonViewController.h"
#import "MyClasses.h"

@implementation PanicButtonViewController

@synthesize buttonArm;
@synthesize buttonPanic;

-(IBAction)handleArm:(id)sender
{
    [buttonPanic setHidden:FALSE];
}

-(IBAction)handlePanic:(id)sender
{
    // panic!
    PanicService *panic = [[PanicService alloc] init];
    [panic startPanicking:(DownloadCallback *)self];
}

-(void)downloadComplete:(DownloadBucket *)data
{
    [MessageBox show:@"You are now panicking!"];
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad 
{
    // call up...
    [super viewDidLoad];
    
    // disable the button...
    [buttonPanic setHidden:TRUE];
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc 
{
    [buttonArm release];
    [buttonPanic release];
    [super dealloc];
}

@end
