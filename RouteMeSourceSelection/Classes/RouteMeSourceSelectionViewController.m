//
//  RouteMeSourceSelectionViewController.m
//  RouteMeSourceSelection
//
//  Created by Слава on 25.12.09.
//  Copyright Slava Bushtruk 2009. All rights reserved.
//

#import "RouteMeSourceSelectionViewController.h"

#import "RMVirtualEarthSource.h"
#import "RMYahooMapSource.h"
#import "RMCloudMadeMapSource.h"
#import "RMOpenStreetMapsSource.h"

#define CONST_MAP_KEY_bing @""
#define CONST_MAP_KEY_cloud @""

@implementation RouteMeSourceSelectionViewController

int mapSourceNumber = 0;

- (void) setMapSourceWithNumber:(int)number
{
	if (mapSourceNumber == number)
		return;
	
	switch (number) {
		case 0:
			mapView.contents.tileSource = [[RMOpenStreetMapsSource alloc] init];
			break;
		case 1:
			mapView.contents.tileSource = [[RMYahooMapSource alloc] init]; 
			break;
			
		case 2:
			mapView.contents.tileSource = [[RMVirtualEarthSource alloc] initWithAerialThemeUsingAccessKey:CONST_MAP_KEY_bing]; 
			break;
		case 3:
			mapView.contents.tileSource = [[RMVirtualEarthSource alloc] initWithHybridThemeUsingAccessKey:CONST_MAP_KEY_bing]; 
			break;
		case 4:
			mapView.contents.tileSource = [[RMVirtualEarthSource alloc] initWithRoadThemeUsingAccessKey:CONST_MAP_KEY_bing]; 
			break;
			
		case 5:
			mapView.contents.tileSource = [[RMCloudMadeMapSource alloc] initWithAccessKey:CONST_MAP_KEY_cloud styleNumber:7];
			break;
			
		default:
			return;
			break;
	}
	
	// this traick refreshs maps with new source
	[mapView moveBy:CGSizeMake(640,960)]; 
	[mapView moveBy:CGSizeMake(-640,-960)];
	
	mapSourceNumber = number;
	// remember user choice between runnings
	[[NSUserDefaults standardUserDefaults] setInteger:mapSourceNumber forKey:@"mapSourceNumber"];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	[RMMapView class];
	[mapView setDelegate:self];
	
	int number = [[NSUserDefaults standardUserDefaults] integerForKey:@"mapSourceNumber"];
	[self setMapSourceWithNumber:number];
	[mapSourcePicker selectRow:mapSourceNumber inComponent:0 animated:NO];
}

- (void)dealloc {
    [super dealloc];
}

- (IBAction) showMapsSettings
{
	BOOL toShow = [mapSourcePicker isHidden];
	
	if (toShow)
	{
		[mapSettingsBarButton setStyle:UIBarButtonItemStyleDone];
	}
	else // hidding
	{
		[mapSettingsBarButton setStyle:UIBarButtonItemStyleBordered];
		[self setMapSourceWithNumber:[mapSourcePicker selectedRowInComponent:0]];
	}
	
	[mapSourcePicker setHidden:![mapSourcePicker isHidden]];
	[mapView setUserInteractionEnabled:[mapSourcePicker isHidden]];
}

///
/// PICKER
///

static NSArray *titles = nil;

- (NSString *)pickerView:(UIPickerView *)pickerView 
			 titleForRow:(NSInteger)row 
			forComponent:(NSInteger)component
{
	return [titles objectAtIndex:row];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView 
numberOfRowsInComponent:(NSInteger)component
{
	if (!titles)
	{
		titles = [[NSArray alloc] initWithObjects:
				  @"Open Street Maps", 
				  @"Yahoo Map",
				  @"Virtual Earth Aerial", 
				  @"Virtual Earth Hybrid", 
				  @"Virtual Earth Road", 
				  @"Cloud Made Map", 
				  nil];
	}
	
	return [titles count];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}


@end
