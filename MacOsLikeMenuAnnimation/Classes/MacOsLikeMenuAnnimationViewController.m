//
//  MacOsLikeMenuAnnimationViewController.m
//  MacOsLikeMenuAnnimation
//
//  Created by Слава on 18.11.09.
//  Copyright Slava Bushtruk 2009. All rights reserved.
//

#import "MacOsLikeMenuAnnimationViewController.h"
#import <QuartzCore/CoreAnimation.h>

#define CONST_button_size 60
#define CONST_dist_between_buttons 20
#define CONST_butons_count 4

@implementation MacOsLikeMenuAnnimationViewController

UIButton *currentButton;

- (void) buttonPressed :(UIButton*)button
{
	[self.view touchesMoved:nil withEvent:nil];
}

- (void) viewDidLoad
{
	/*
	for (int i=0; i<CONST_butons_count; ++i)
	//for (int j=0; j<CONST_butons_count; ++j)
	{
		SubView *b = [[SubView alloc] initWithFrame:CGRectMake(10 + CONST_dist_between_buttons*i + i*CONST_button_size, 
							   380,
							   CONST_button_size, CONST_button_size)];
		//[b setTitle:[NSString stringWithFormat:@"%d", i] forState:UIControlStateNormal];
		[b setBackgroundColor:[UIColor grayColor]];
		[self.view addSubview:b];
		//[b release];
	}
	*/
}

@end
