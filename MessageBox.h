//
//  MessageBox.h
//  PanicButton
//
//  Created by Matthew Baxter-Reynolds on 25/08/2010.
//  Copyright (c) 2010 AMX Software Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MessageBox : NSObject {

}

+(void)show:(NSString *)message;
+(void)showError:(NSError *)err;

@end
