//
//  ServiceBase.h
//  PanicButton
//
//  Created by Matthew Baxter-Reynolds on 25/08/2010.
//  Copyright (c) 2010 AMX Software Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RestRequestArgs.h"
#import "DownloadBucket.h"

@interface ServiceBase : NSObject {

    NSString *serviceName;
    DownloadCallback *callback;
    
}

@property (nonatomic, retain) NSString *serviceName;
@property (nonatomic, retain) DownloadCallback *callback;

-(id)initWithServiceName:(NSString *)theServiceName;

-(void)sendRequest:(RestRequestArgs *)theArgs callback:(DownloadCallback *)theCallback;
-(void)requestOk;
-(void)requestFailed:(NSError *)theError;

@end
