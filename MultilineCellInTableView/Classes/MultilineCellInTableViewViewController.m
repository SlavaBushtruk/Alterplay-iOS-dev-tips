//
//  MultilineCellInTableViewViewController.m
//  MultilineCellInTableView
//
//  Created by Слава on 02.11.09.
//  Copyright Slava Bushtruk 2009. All rights reserved.
//

#import "MultilineCellInTableViewViewController.h"



@implementation MultilineCellInTableViewViewController

static NSArray *titles;
static NSArray *subtitles;

- (void)viewDidLoad {
    [super viewDidLoad];
	
	if (!titles)
		titles = [[NSArray arrayWithObjects:
				  @"Shakespeare's Sonnet 1: From Fairest Creatures We Desire Increase",
				  @"Shakespeare's Sonnet 2: When Forty Winters Shall Besiege Thy Brow",
				  @"Shakespeare's Sonnet 3: Look In Thy Glass, And Tell The Face Thous Viewest",
				  nil] retain];
	if (!subtitles)
		subtitles = [[NSArray arrayWithObjects: 
					 @"We want all beautiful creatures to reproduce themselves so that beauty’s flower will not die out; but as an old man dies in time, he leaves a young heir to carry on his memory.",
					 @"When forty winters have attacked your brow and wrinkled your beautiful skin, the pride and impressiveness of your youth, so much admired by everyone now, will be have become a worthless, tattered weed.",
					 @"Look in your mirror and tell the face you see that it's time it should create another If you do not renew yourself you would be depriving the world, and stop some woman from becoming a mother.",
					 nil] retain];
}



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

#pragma mark 
#pragma mark Helpers

#define CONST_Cell_height 44.0f
#define CONST_Cell_width 270.0f

#define CONST_textLabelFontSize     17
#define CONST_detailLabelFontSize   15

static UIFont *subFont;
static UIFont *titleFont;

- (UIFont*) TitleFont;
{
	if (!titleFont) titleFont = [UIFont boldSystemFontOfSize:CONST_textLabelFontSize];
	return titleFont;
}

- (UIFont*) SubFont;
{
	if (!subFont) subFont = [UIFont systemFontOfSize:CONST_detailLabelFontSize];
	return subFont;
}

- (UITableViewCell*) CreateMultilinesCell :(NSString*)cellIdentifier
{
	UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle 
													reuseIdentifier:cellIdentifier] autorelease];
	
	cell.textLabel.numberOfLines = 0;
	cell.textLabel.font = [self TitleFont];
	
	cell.detailTextLabel.numberOfLines = 0;
	cell.detailTextLabel.font = [self SubFont];
	
	return cell;
}

- (int) heightOfCellWithTitle :(NSString*)titleText 
				   andSubtitle:(NSString*)subtitleText
{
	CGSize titleSize = {0, 0};
	CGSize subtitleSize = {0, 0};
	
	if (titleText && ![titleText isEqualToString:@""]) 
		titleSize = [titleText sizeWithFont:[self TitleFont] 
						  constrainedToSize:CGSizeMake(CONST_Cell_width, 4000) 
							  lineBreakMode:UILineBreakModeWordWrap];
	
	if (subtitleText && ![subtitleText isEqualToString:@""]) 
		subtitleSize = [subtitleText sizeWithFont:[self SubFont] 
								constrainedToSize:CGSizeMake(CONST_Cell_width, 4000) 
									lineBreakMode:UILineBreakModeWordWrap];
	
	return titleSize.height + subtitleSize.height;
}

#pragma mark 
#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return MIN([titles count], [subtitles count]);
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [self CreateMultilinesCell:CellIdentifier];
    }
    
    cell.textLabel.text = [titles objectAtIndex:indexPath.row];
	cell.detailTextLabel.text = [subtitles objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *title = [titles objectAtIndex:indexPath.row];
	NSString *subtitle = [subtitles objectAtIndex:indexPath.row];

	int height = 10 + [self heightOfCellWithTitle:title andSubtitle:subtitle];
	return (height < CONST_Cell_height ? CONST_Cell_height : height);
}

@end
