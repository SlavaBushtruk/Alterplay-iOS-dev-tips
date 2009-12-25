//
//  RouteMeSourceSelectionAppDelegate.m
//  RouteMeSourceSelection
//
//  Created by Слава on 25.12.09.
//  Copyright Slava Bushtruk 2009. All rights reserved.
//

#import "RouteMeSourceSelectionAppDelegate.h"
#import "RouteMeSourceSelectionViewController.h"

@implementation RouteMeSourceSelectionAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
