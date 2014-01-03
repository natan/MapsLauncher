//
//  MLAppDelegate.m
//  MapsLauncher
//
//  Created by nathan spindel on 1/3/14.
//  Copyright (c) 2014 nathan spindel. All rights reserved.
//

#import "MLAppDelegate.h"

@implementation MLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application;
{
    // Apparently you can't open a URL immediately in -applicationDidBecomeActive: (if you do, the URL opening gets queued until the app resigns; strange). This gross timing hack fixes it.
    dispatch_async(dispatch_get_main_queue(), ^{
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"comgooglemaps://"]];
    });
}

@end
