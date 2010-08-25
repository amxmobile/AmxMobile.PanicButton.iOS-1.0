//
//  RestRequestArgs.h
//  PanicButton
//
//  Created by Matthew Baxter-Reynolds on 25/08/2010.
//  Copyright (c) 2010 AMX Software Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RestRequestArgs : NSObject {

    NSMutableDictionary *args;
    
}

@property (nonatomic, retain) NSMutableDictionary *args;

-(id)initWithOperation:(NSString *)theOperation;

-(NSString *)toXml;

@end
