//
//  ViewController.m
//  RNPodDemo
//
//  Created by yleaf on 2017/12/30.
//  Copyright © 2017年 Facebook. All rights reserved.
//

#import "ViewController.h"
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import "JSEventEmitter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  NSURL *jsCodeLocation;
  
  jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];

  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                      moduleName:@"RNPodDemo"
                                               initialProperties:nil
                                                   launchOptions:nil];
  rootView.frame = self.view.frame;
  rootView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:rootView];

}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  [JSEventEmitter senderEvent:JSEventTestEvent userInfo:@{@"TestEvent":@"just test"}];
  [JSEventEmitter senderEvent:JSEventLogEvent userInfo:@{@"LogEvent":@"this is a log"}];
}


@end
