//
//  MessageBox.m
//  PanicButton
//
//  Created by Matthew Baxter-Reynolds on 25/08/2010.
//  Copyright (c) 2010 AMX Software Ltd. All rights reserved.
//

#import "MessageBox.h"
#import "MyClasses.h"

@implementation MessageBox

+(void)show:(NSString *)message
{
	UIAlertView *alert = [[UIAlertView alloc] init];
	[alert setTitle:@"Six Bookmarks"];
	[alert setMessage:message];
	[alert addButtonWithTitle:@"OK"];
	[alert show];
	
	// cleanup...
	[alert release];
}

+(void)showError:(NSError *)err
{
	NSString *message = [ErrorHelper formatError:err];
	NSLog(@"%@", message);
	[self show:message];
}

@end
