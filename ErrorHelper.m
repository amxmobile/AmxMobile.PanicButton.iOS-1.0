//
//  ErrorHelper.m
//  PanicButton
//
//  Created by Matthew Baxter-Reynolds on 25/08/2010.
//  Copyright (c) 2010 AMX Software Ltd. All rights reserved.
//

#import "ErrorHelper.h"


@implementation ErrorHelper

+(NSError *)error:(NSObject *)caller message:(NSString *)theMessage
{
	NSString *full = [NSString stringWithFormat:@"%@ (%@)", theMessage, [[caller class] description]];																		 
	return [NSError errorWithDomain:full code:500 userInfo:nil];
}

+(NSString *)formatError:(NSError *)err
{
	NSString *message = [NSString stringWithFormat:@"%@ --> %d", [err domain], [err code]];
	return message;
}

+(NSError *)wrapError:(NSError *)theError caller:(NSObject *)theCaller message:(NSString *)theMessage
{
	NSString *full = [NSString stringWithFormat:@"%@ (%@) --> %@", theMessage, [[theCaller class] description], 
					  [self formatError:theError]];
	return [NSError errorWithDomain:full code:500 userInfo:nil];
}

@end
