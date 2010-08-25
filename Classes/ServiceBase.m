//
//  ServiceBase.m
//  PanicButton
//
//  Created by Matthew Baxter-Reynolds on 25/08/2010.
//  Copyright (c) 2010 AMX Software Ltd. All rights reserved.
//

#import "ServiceBase.h"
#import "MyClasses.h"

@implementation ServiceBase

@synthesize serviceName;
@synthesize callback;

-(id)initWithServiceName:(NSString *)theServiceName
{
    if(self = [super init])
    {
        self.serviceName = theServiceName;
    }
    return self;
}

-(NSString *)getServiceUrl
{
    return [NSString stringWithFormat:@"%@%@", @"https://gateway-uat.simplehostedservices.co.uk/amxpanic/webservices/", self.serviceName];
}

+(void)startSpinning
{
	// start spinning...
	[UIApplication sharedApplication].networkActivityIndicatorVisible = TRUE;
}

+(void)stopSpinning
{
	// stop spinning...
	[UIApplication sharedApplication].networkActivityIndicatorVisible = FALSE;
} 

-(void)sendRequest:(RestRequestArgs *)theArgs callback:(DownloadCallback *)theCallback;
{
    // url...
    NSString *url = [self getServiceUrl];
    NSLog(@"URL: %@", url);

    // get some xml...
    NSString *xml = [theArgs toXml];
    NSLog(@"SENDING: %@", xml);
    
    // form a request...
	NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
	[request setHTTPMethod:@"POST"];
	[request setValue:@"text/xml" forHTTPHeaderField:@"content-type"];
    [request setHTTPBody:[xml dataUsingEncoding:NSUTF8StringEncoding]];	
    
    // create a bucket to store values in...
    DownloadBucket *bucket = [[DownloadBucket alloc] initWithCallback:(DownloadCallback *)self];
    
    // store the callback in a property - we'll get the data first and check it...
    self.callback = theCallback;
    
    // run...
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:bucket];
	if(connection != nil)
		NSLog(@"Connection started...");
    
    [ServiceBase startSpinning];
}

-(void)downloadComplete:(DownloadBucket *)bucket
{
    [ServiceBase stopSpinning];

    // did we get a 200?
	NSError *err = nil;
	if(bucket.statusCode == 200) 
	{
		// at this point we have a rest response from the server.  what
		// we need to do now is parse it... thus we`ll create a parser
		// and create an SBFlatXmlBucket to collect the data...
		NSXMLParser *parser = [[NSXMLParser alloc] initWithData:[bucket data]];
        
		// result...
        FlatXmlBucket *values = [[FlatXmlBucket alloc] init];
		[parser setDelegate:values];
        
		// run...
		[parser parse];
		
		// ok - what did we get?
		int result =  [[values rootName] isEqualToString:@"RestResponse"];
		if([values rootName] == nil || !(result))
        {
			err = [ErrorHelper error:self message:[NSString stringWithFormat:@"The REST service `%@` returned a root element with name `%@`, not `RestResponse`.", [self serviceName], [values rootName]]];
        }
		else
		{
			// did we get an exception?
			BOOL hasException = [values getBooleanValue:@"HasException"];
			if(hasException)
			{
				NSString *message = [values getStringValue:@"Error"];
				err = [ErrorHelper error:self message:[NSString stringWithFormat:@"The REST service `%@` returned an exception: `%@`.", serviceName, message]];
			}
		}	
        
		// cleanup...
		[parser release];
		[values release];
	}
	else
    {
		err = [ErrorHelper error:self message:[NSString stringWithFormat:@"The server returned HTTP '%d'.", bucket.statusCode]]; 
    }
    
	// done that bit - now send a notification...
	if(err == nil)
		[self requestOk];
	else 
		[self requestFailed:err];
}

-(void)requestOk
{
	// no-op by default...
    [self.callback downloadComplete:nil];
}

-(void)requestFailed:(NSError *)theError
{
	// show an error...
	[MessageBox showError:theError];
} 

-(void)dealloc
{
    [callback release];
    [serviceName release];
    [super dealloc];
}

@end
