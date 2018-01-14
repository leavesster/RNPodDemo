//
//  JSManager.m
//  RNPodDemo
//
//  Created by yleaf on 2017/12/30.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "JSManager.h"

@implementation JSManager

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(sayHello:(NSString *)name words:(NSString *)words)
{
  RCTLogInfo(@"hello %@, %@", name, words);
}

RCT_EXPORT_METHOD(returnFunction:(RCTResponseSenderBlock)callback)
{
  NSArray *events = @[@"RCTResponseSenderBlock"];
  callback(@[[NSNull null], events]);
}

RCT_REMAP_METHOD(findEvents,
                 resolver:(RCTPromiseResolveBlock)resolve
                 rejecter:(RCTPromiseRejectBlock)reject)
{
  NSArray *events = @[@"findEvents",@"RCTPromiseResolveBlock",@"RCTPromiseRejectBlock"];
  if (events) {
    resolve(events);
  } else {
    reject(@"resolve", @"message", [NSError errorWithDomain:NSCocoaErrorDomain code:111 userInfo:@{@"errortest":@"test"}]);
  }
}

@end
