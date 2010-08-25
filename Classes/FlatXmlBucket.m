//
//  FlatXmlBucket.m
//  PanicButton
//
//  Created by Matthew Baxter-Reynolds on 25/08/2010.
//  Copyright (c) 2010 AMX Software Ltd. All rights reserved.
//

#import "FlatXmlBucket.h"
#import "MyClasses.h"

@implementation FlatXmlBucket

@synthesize builder;
@synthesize rootName;
@synthesize values;

-(id)init
{
	if(self = [super init])
	{
		// set...
        [self resetBuilder];
		self.values = [NSMutableDictionary dictionary];
	}
	
	// return...
	return self;
}

-(void)resetBuilder
{
	[self setBuilder:[NSMutableString string]];
}

-(NSString *)trimmedBuilder
{
	NSString *trimmed = [[self builder] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	return trimmed;
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)buf
{
	// store it...
	[builder appendString:buf];
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
 namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
   attributes:(NSDictionary *)attributeDict 
{
	NSLog(@"Processing Element: %@", elementName);
	
	// do we have a root?
	if(rootName == nil)
		[self setRootName:elementName];
	
	// reset the string builder...
	[self resetBuilder];
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI 
qualifiedName:(NSString *)qName
{
	// the value in the string builder needs to be stored...
	[values setValue:[self trimmedBuilder] forKey:elementName];
	[self resetBuilder];
}

-(NSString*)getStringValue:(NSString *)name
{
	return [values objectForKey:name];
}

-(BOOL)getBooleanValue:(NSString *)name
{
	NSString *buf = [self getStringValue:name];
	if(buf == nil || [buf length] == 0 || [buf isEqualToString:@"0"])
		return FALSE;
	else
		return TRUE;
}

-(void)dealloc
{
    [builder release];
	[rootName release];
	[values release];
	[super dealloc];
}

    
@end
