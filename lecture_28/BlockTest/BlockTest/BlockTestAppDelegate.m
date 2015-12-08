//
//  BlockTestAppDelegate.m
//  BlockTest
//
//  Created by Ken Anderson on 4/29/12.
//  Copyright (c) 2012 University of Colorado, Boulder. All rights reserved.
//

#import "BlockTestAppDelegate.h"

#import "BlockTestViewController.h"

@implementation BlockTestAppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[BlockTestViewController alloc] initWithNibName:@"BlockTestViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
