//
//  JumpAnimationAppDelegate.h
//  JumpAnimation
//
//  Created by Слава on 13.11.09.
//  Copyright Slava Bushtruk 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JumpAnimationViewController;

@interface JumpAnimationAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    JumpAnimationViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet JumpAnimationViewController *viewController;

@end

