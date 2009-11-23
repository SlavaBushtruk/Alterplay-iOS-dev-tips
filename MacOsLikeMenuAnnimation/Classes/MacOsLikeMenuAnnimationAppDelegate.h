//
//  MacOsLikeMenuAnnimationAppDelegate.h
//  MacOsLikeMenuAnnimation
//
//  Created by Слава on 18.11.09.
//  Copyright Slava Bushtruk 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MacOsLikeMenuAnnimationViewController;

@interface MacOsLikeMenuAnnimationAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MacOsLikeMenuAnnimationViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MacOsLikeMenuAnnimationViewController *viewController;

@end

