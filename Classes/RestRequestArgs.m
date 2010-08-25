//
//  RestRequestArgs.m
//  PanicButton
//
//  Created by Matthew Baxter-Reynolds on 25/08/2010.
//  Copyright (c) 2010 AMX Software Ltd. All rights reserved.
//

#import "RestRequestArgs.h"
#import <libxml/encoding.h>
#import <libxml/xmlwriter.h>

@implementation RestRequestArgs

@synthesize args;

-(id)initWithOperation:(NSString *)theOperation
{
    if(self = [super init])
	{
        self.args = [NSMutableDictionary dictionary];
		[self.args setValue:theOperation forKey:@"operation"];
	}
	
	// return...
	return self;
}

-(NSString *)toXml
{
 	// create...
	xmlBufferPtr buffer = xmlBufferCreate();
    xmlTextWriterPtr writer = xmlNewTextWriterMemory(buffer, 0);
	
	// start the document...
	xmlTextWriterStartDocument(writer, "1.0", "UTF-8", NULL);
	
    // start...
	xmlTextWriterStartElement(writer, BAD_CAST "RestArgs");

    // go through each key...
    for(NSString *name in self.args)
    {
        xmlTextWriterStartElement(writer, BAD_CAST [(NSString *)name cStringUsingEncoding:NSUTF8StringEncoding]);
        NSString *value = [self.args objectForKey:name];
        xmlTextWriterWriteString(writer, BAD_CAST [(NSString *)value cStringUsingEncoding:NSUTF8StringEncoding]); 
        xmlTextWriterEndElement(writer);
    }
    
    // end...
	xmlTextWriterEndElement(writer);
    xmlTextWriterEndDocument(writer);
    
    // return...
    xmlFreeTextWriter(writer);
    NSData *xmlData = [NSData dataWithBytes:(buffer->content) length:(buffer->use)];
	NSString *xml = [[NSString alloc] initWithData:xmlData encoding:NSUTF8StringEncoding];
    xmlBufferFree(buffer);
    return xml;
}

-(void)dealloc
{
    [args release];
    [super dealloc];
}

@end
