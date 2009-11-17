//
//  MapViewRotationAppDelegate.h
//  MapViewRotation
//
//  Created by Слава on 16.11.09.
//  Copyright Slava Bushtruk 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MapViewRotationViewController;

@interface MapViewRotationAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MapViewRotationViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MapViewRotationViewController *viewController;

@end

