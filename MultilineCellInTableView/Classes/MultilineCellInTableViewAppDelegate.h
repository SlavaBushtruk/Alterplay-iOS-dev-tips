//
//  MultilineCellInTableViewAppDelegate.h
//  MultilineCellInTableView
//
//  Created by Слава on 02.11.09.
//  Copyright Slava Bushtruk 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MultilineCellInTableViewViewController;

@interface MultilineCellInTableViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    MultilineCellInTableViewViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MultilineCellInTableViewViewController *viewController;

@end

