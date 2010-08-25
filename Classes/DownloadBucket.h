//
//  DownloadBucket.h
//  PanicButton
//
//  Created by Matthew Baxter-Reynolds on 25/08/2010.
//  Copyright (c) 2010 AMX Software Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DownloadBucket;

@interface DownloadCallback : NSObject
-(void)downloadComplete:(DownloadBucket *)data;
@end

@interface DownloadBucket : NSObject {

	NSMutableData * data;
	DownloadCallback *callback;
	int statusCode;
}

@property (nonatomic, retain) NSMutableData *data;
@property (nonatomic, retain) DownloadCallback *callback;
@property (assign) int statusCode;

-(id)initWithCallback:(DownloadCallback *)theCallback;

-(NSString *)dataAsString;

@end