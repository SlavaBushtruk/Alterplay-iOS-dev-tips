//
//  RouteMeSourceSelectionAppDelegate.h
//  RouteMeSourceSelection
//
//  Created by Слава on 25.12.09.
//  Copyright Slava Bushtruk 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RouteMeSourceSelectionViewController;

@interface RouteMeSourceSelectionAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    RouteMeSourceSelectionViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet RouteMeSourceSelectionViewController *viewController;

@end

