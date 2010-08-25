//
//  PanicService.h
//  PanicButton
//
//  Created by Matthew Baxter-Reynolds on 25/08/2010.
//  Copyright (c) 2010 AMX Software Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceBase.h"

@interface PanicService : ServiceBase {

}

-(void)startPanicking:(DownloadCallback *)theCallback;

@end
