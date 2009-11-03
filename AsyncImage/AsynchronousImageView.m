//
//  AsynchronousImageView.m
//  GLOSS
//
//  Created by Слава on 22.10.09.
//  Copyright 2009 Slava Bushtruk. All rights reserved.
//

#import "AsynchronousImageView.h"

@implementation AsynchronousImageView

- (void)loadImageFromURLString:(NSString *)theUrlString
{
	[self.image release], self.image = nil;
	NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:theUrlString] 
											 cachePolicy:NSURLRequestReturnCacheDataElseLoad 
										 timeoutInterval:30.0];
	
	connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *)theConnection 
	didReceiveData:(NSData *)incrementalData 
{
    if (data == nil)
        data = [[NSMutableData alloc] initWithCapacity:2048];
	
    [data appendData:incrementalData];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)theConnection 
{
    self.image = [UIImage imageWithData:data];
    [data release], data = nil;
	[connection release], connection = nil;
}

- (void)dealloc {
	[data release];
	[connection release];
    [super dealloc];
}

@end