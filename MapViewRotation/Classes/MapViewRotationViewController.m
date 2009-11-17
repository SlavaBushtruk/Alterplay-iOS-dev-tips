//
//  MapViewRotationViewController.m
//  MapViewRotation
//
//  Created by Слава on 16.11.09.
//  Copyright Slava Bushtruk 2009. All rights reserved.
//

#import "MapViewRotationViewController.h"
#import "QuartzCore/QuartzCore.h"

#define CONST_fps 25.
#define CONST_map_shift 0.15

@implementation MapViewRotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	// accelerometer settings
	[[UIAccelerometer sharedAccelerometer] setDelegate:self];
	[[UIAccelerometer sharedAccelerometer] setUpdateInterval:(1.0 / CONST_fps)];
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
	static CGFloat ZZ = 0.;
	CGFloat z = (atan2(acceleration.x, acceleration.y) + M_PI);
	
	if (fabsf(ZZ - z) > CONST_map_shift)
	{
		viewToRotate.layer.transform = CATransform3DMakeRotation(ZZ=z, 0., 0., 1.);
	}
}

@end
