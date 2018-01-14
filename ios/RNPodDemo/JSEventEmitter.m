//
//  JSEventEmitter.m
//  RNPodDemo
//
//  Created by yleaf on 2017/12/31.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "JSEventEmitter.h"

@interface JSEventEmitter()

@property (nonatomic, assign) BOOL hasListener;

@end

@implementation JSEventEmitter

RCT_EXPORT_MODULE();

- (NSArray<NSString *> *)supportedEvents
{
  return @[JSEventTestEvent, JSEventLogEvent];
}

- (void)handleNotificationEvent:(NSNotification *)n
{
  if (self.hasListener) {
      [self sendEventWithName:n.name body:n.userInfo];
  }
}

- (void)startObserving {
  self.hasListener = YES;
  for (NSString *event in [self supportedEvents]) {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNotificationEvent:) name:event object:nil];
  }
}

- (void)stopObserving {
  self.hasListener = NO;
  for (NSString *event in [self supportedEvents]) {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:event object:nil];
  }
}

+ (void)senderEvent:(NSString *)eventName userInfo:(NSDictionary *)userInfo
{
  [[NSNotificationCenter defaultCenter] postNotificationName:eventName object:self userInfo:userInfo];
}

@end
