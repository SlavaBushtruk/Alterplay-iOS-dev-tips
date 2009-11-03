//
//  AsyncImageViewController.h
//  AsyncImage
//
//  Created by Слава on 03.11.09.
//  Copyright Slava Bushtruk 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AsynchronousImageView.h"

@interface AsyncImageViewController : UIViewController 
{
	IBOutlet AsynchronousImageView *asynchronousImageView;
}

@end