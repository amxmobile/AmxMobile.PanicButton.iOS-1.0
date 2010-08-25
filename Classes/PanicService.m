//
//  PanicService.m
//  PanicButton
//
//  Created by Matthew Baxter-Reynolds on 25/08/2010.
//  Copyright (c) 2010 AMX Software Ltd. All rights reserved.
//

#import "PanicService.h"
#import "MyClasses.h"

@implementation PanicService

-(id)init
{
    return [super initWithServiceName:@"panicrest.aspx"];
}

-(void)startPanicking:(DownloadCallback *)theCallback
{
    RestRequestArgs *args = [[RestRequestArgs alloc] initWithOperation:@"startpanicking"];
    [args.args setValue:@"MBR1" forKey:@"ResourceId"];
    
    // send...
    [self sendRequest:args callback:theCallback];
}

@end
