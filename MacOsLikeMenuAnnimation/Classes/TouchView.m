//
//  TouchView.m
//  MacOsLikeMenuAnnimation
//
//  Created by Слава on 18.11.09.
//  Copyright 2009 Slava Bushtruk. All rights reserved.
//

#import "TouchView.h"
#import <QuartzCore/CoreAnimation.h>

#define CONST_animation_time 0.2
#define CONST_enlarge_proportion 1.3

@implementation TouchView

CGFloat Distance(CGPoint point1, CGPoint point2)
{
	CGFloat dx = point2.x - point1.x;
	CGFloat dy = point2.y - point1.y;
	return sqrt(dx*dx + dy*dy );
};

CGPoint UpPointOfView(UIView *view)
{
	return (CGPoint){view.center.x, 390};
};

CGPoint DownPointOfView(UIView *view)
{
	return (CGPoint){view.center.x, 410};
};

- (IBAction) activate:(UIView*)view
{	
	CGContextRef context = UIGraphicsGetCurrentContext();
	[UIView beginAnimations:nil context:context];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDuration:CONST_animation_time];
	[view setCenter:UpPointOfView(view)];
	
	
	CABasicAnimation *scalingAnimation = (CABasicAnimation *)[view.layer animationForKey:@"scaling"];
	
	if (!scalingAnimation)
	{
		scalingAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
		scalingAnimation.repeatCount=1; 
		scalingAnimation.duration=CONST_animation_time;
		scalingAnimation.autoreverses=NO;
		scalingAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
		scalingAnimation.fromValue=[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)];
		scalingAnimation.toValue=[NSValue valueWithCATransform3D:CATransform3DMakeScale(CONST_enlarge_proportion, CONST_enlarge_proportion, 1.0)];
	}
	
	[view.layer addAnimation:scalingAnimation forKey:@"scaling"];
	view.layer.transform = CATransform3DMakeScale(CONST_enlarge_proportion, CONST_enlarge_proportion, 1.0);
	[UIView commitAnimations];
}

- (IBAction) deactivate:(UIView*)view
{
	CGContextRef context = UIGraphicsGetCurrentContext();
	[UIView beginAnimations:nil context:context];
	[UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
	[UIView setAnimationDuration:CONST_animation_time];
	[view setCenter:DownPointOfView(view)];
	
	CABasicAnimation *scalingAnimation = (CABasicAnimation *)[view.layer animationForKey:@"descaling"];
	
	if (!scalingAnimation)
	{
		scalingAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
		scalingAnimation.repeatCount=1; 
		scalingAnimation.duration=CONST_animation_time;
		scalingAnimation.autoreverses=NO;
		scalingAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
		scalingAnimation.fromValue=[NSValue valueWithCATransform3D:CATransform3DMakeScale(CONST_enlarge_proportion, CONST_enlarge_proportion, 1.0)];
		scalingAnimation.toValue=[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)];
	}
	
	[view.layer addAnimation:scalingAnimation forKey:@"descaling"];
	view.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0);
	[UIView commitAnimations];
}

- (BOOL) isMultipleTouchEnabled {return NO;}

UIView *activeView = nil;

- (BOOL) animateView :(UIView*)view atPoint:(CGPoint)point
{
	BOOL isviewActive = ([view isEqual:activeView]);
	
	if (Distance(view.center, point) <= 30)
	{
		if (!isviewActive)
		{
			[self activate:view];
			activeView = view;
			return YES;
		}
	}
	else if (isviewActive)
	{
		[self deactivate:view];
		activeView = nil;
		return YES;
	}
	
	return NO;
}

- (UIView*) nearestViewToPoint:(CGPoint)point
{
	UIView *candidateView = nil;
	CGFloat candidateDistance = 100000;
	
	for (UIView *v in [self subviews])
	{
		CGFloat dist = Distance(v.center, point);
		if (dist < candidateDistance)
		{
			candidateView = v;
			candidateDistance = dist;
		}
	}
	
	return candidateView;
}

- (void) touchesMoved:(NSSet *) touches withEvent:(UIEvent *) event
{
	CGPoint pt = [[touches anyObject] locationInView:self];
	
	UIView *nearestView = [self nearestViewToPoint:pt];
	if (![activeView isEqual:nearestView])
	{
		[self deactivate:activeView];
		activeView = nil;
		
		if (Distance(nearestView.center, pt) <= 30)
		{
			[self activate:nearestView];
			activeView = nearestView;
		}
	}
	else if (Distance(activeView.center, pt) > 50)
	{
		[self deactivate:activeView];
		activeView = nil;
	}

	[self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet*)touches  withEvent:(UIEvent*)event
{
	if (activeView)
	{
		[self deactivate:activeView]; 
		activeView = nil;
	}
}

- (void) touchesBegan:(NSSet *) touches withEvent:(UIEvent *) event
{
	if (!activeView)
		[self touchesMoved:touches withEvent:event]; 
}

@end
