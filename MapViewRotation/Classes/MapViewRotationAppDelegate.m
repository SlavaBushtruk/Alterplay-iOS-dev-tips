//
//  MapViewRotationAppDelegate.m
//  MapViewRotation
//
//  Created by Слава on 16.11.09.
//  Copyright Slava Bushtruk 2009. All rights reserved.
//

#import "MapViewRotationAppDelegate.h"
#import "MapViewRotationViewController.h"

@implementation MapViewRotationAppDelegate

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
