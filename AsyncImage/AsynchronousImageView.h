//
//  AsynchronousImageView.h
//  GLOSS
//
//  Created by Слава on 22.10.09.
//  Copyright 2009 Slava Bushtruk. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface AsynchronousImageView : UIImageView 
{
    NSURLConnection *connection;
    NSMutableData *data;
}

- (void)loadImageFromURLString:(NSString *)theUrlString;

@end