//
//  MapViewRotationViewController.h
//  MapViewRotation
//
//  Created by Слава on 16.11.09.
//  Copyright Slava Bushtruk 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MapViewRotationViewController : UIViewController <UIAccelerometerDelegate>
{
	IBOutlet UIView *viewToRotate;
}

@end