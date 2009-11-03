//
//  MultilineCellInTableViewAppDelegate.m
//  MultilineCellInTableView
//
//  Created by Слава on 02.11.09.
//  Copyright Slava Bushtruk 2009. All rights reserved.
//

#import "MultilineCellInTableViewAppDelegate.h"
#import "MultilineCellInTableViewViewController.h"

@implementation MultilineCellInTableViewAppDelegate

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
