//
//  AsyncImageAppDelegate.m
//  AsyncImage
//
//  Created by Слава on 03.11.09.
//  Copyright Slava Bushtruk 2009. All rights reserved.
//

#import "AsyncImageAppDelegate.h"
#import "AsyncImageViewController.h"

@implementation AsyncImageAppDelegate

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
