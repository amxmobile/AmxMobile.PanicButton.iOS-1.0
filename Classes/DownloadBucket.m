//
//  DownloadBucket.m
//  PanicButton
//
//  Created by Matthew Baxter-Reynolds on 25/08/2010.
//  Copyright (c) 2010 AMX Software Ltd. All rights reserved.
//

#import "DownloadBucket.h"


@implementation DownloadBucket

@synthesize data;
@synthesize callback;
@synthesize statusCode;

-(id)initWithCallback:(DownloadCallback *)theCallback
{
	// set...
	if(self = [super init])
	{
		self.callback = theCallback;
		self.data = [NSMutableData data];
	}
	
	// return...
	return self;
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	// what did we get?
	if([response isKindOfClass:[NSHTTPURLResponse class]])
		self.statusCode = [(NSHTTPURLResponse *)response statusCode];
	
	// ensure out bucket is clear...
	[data setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)theData
{
    // append the data that we got...
    [data appendData:theData];
}

-(NSString *)dataAsString
{
	return [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	// log it...
	NSLog(@"RECEIVED: %@", self.dataAsString);
	
	// callback...
	[callback downloadComplete:self];
}

@end
