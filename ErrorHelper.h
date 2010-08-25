//
//  ErrorHelper.h
//  PanicButton
//
//  Created by Matthew Baxter-Reynolds on 25/08/2010.
//  Copyright (c) 2010 AMX Software Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ErrorHelper : NSObject {

}

+(NSError *)error:(NSObject *)caller message:(NSString *)theMessage;
+(NSString *)formatError:(NSError *)err;
+(NSError *)wrapError:(NSError *)theError caller:(NSObject *)theCaller message:(NSString *)theMessage;

@end
