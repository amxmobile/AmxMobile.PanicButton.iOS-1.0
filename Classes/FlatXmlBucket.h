//
//  FlatXmlBucket.h
//  PanicButton
//
//  Created by Matthew Baxter-Reynolds on 25/08/2010.
//  Copyright (c) 2010 AMX Software Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FlatXmlBucket : NSObject {

    NSMutableString *builder;
    NSString *rootName;
    NSMutableDictionary *values;

}

@property (nonatomic, retain) NSMutableString *builder;
@property (nonatomic, retain) NSString *rootName;
@property (nonatomic, retain) NSMutableDictionary *values;

-(void)resetBuilder;

// extraction...
-(NSString*)getStringValue:(NSString *)name;
-(BOOL)getBooleanValue:(NSString *)name;

@end
