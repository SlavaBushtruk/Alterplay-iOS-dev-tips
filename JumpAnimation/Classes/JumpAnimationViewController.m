//
//  JumpAnimationViewController.m
//  JumpAnimation
//
//  Created by Слава on 13.11.09.
//  Copyright Slava Bushtruk 2009. All rights reserved.
//

#import "JumpAnimationViewController.h"
#import <QuartzCore/CoreAnimation.h>

@implementation JumpAnimationViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

///
/// ANIMATION
/// 

#define CONST_TIME_flying 0.8f

- (void) jumpAnimationForView:(UIView*)animatedView
					  toPoint:(CGPoint)point 
{
	// moving
	CGContextRef context = UIGraphicsGetCurrentContext();
	[UIView beginAnimations:nil context:context];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDuration:CONST_TIME_flying];
	[animatedView setCenter:point];
	
	// scaling
	CABasicAnimation *scalingAnimation = (CABasicAnimation *)[animatedView.layer animationForKey:@"scaling"];
	if (!scalingAnimation)
	{
		scalingAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
		scalingAnimation.duration=CONST_TIME_flying/2.0f;
		scalingAnimation.autoreverses=YES;
		scalingAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
		scalingAnimation.fromValue=[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)];
		scalingAnimation.toValue=[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.4, 1.4, 1.0)];
	}
	[animatedView.layer addAnimation:scalingAnimation forKey:@"scaling"];
	[UIView commitAnimations];
}

- (IBAction) buttonPressed :(UIButton*)button
{
	[self jumpAnimationForView:button toPoint:(CGPoint){rand()%320, rand()%480}];
}

@end

