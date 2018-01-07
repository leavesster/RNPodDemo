//
//  JSEventEmitter.m
//  RNPodDemo
//
//  Created by yleaf on 2017/12/31.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "JSEventEmitter.h"

@implementation JSEventEmitter

RCT_EXPORT_MODULE();

- (NSArray<NSString *> *)supportedEvents
{
  return @[@"EventReminder"];
}

- (void)calendarEventReminderReceived:(NSNotification *)notification
{
  NSString *eventName = notification.userInfo[@"name"];
  [self sendEventWithName:@"EventReminder" body:@{@"name": eventName}];
}


@end
