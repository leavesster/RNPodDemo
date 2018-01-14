//
//  JSEventEmitter.h
//  RNPodDemo
//
//  Created by yleaf on 2017/12/31.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

static NSString *const JSEventTestEvent = @"EventReminder";
static NSString *const JSEventLogEvent = @"EventLog";

@interface JSEventEmitter : RCTEventEmitter<RCTBridgeModule>

+ (void)senderEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo;

@end
