//
//  AsyncImageAppDelegate.h
//  AsyncImage
//
//  Created by Слава on 03.11.09.
//  Copyright Slava Bushtruk 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AsyncImageViewController;

@interface AsyncImageAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    AsyncImageViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet AsyncImageViewController *viewController;

@end

