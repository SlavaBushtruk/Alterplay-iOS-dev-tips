//
//  RouteMeSourceSelectionViewController.h
//  RouteMeSourceSelection
//
//  Created by Слава on 25.12.09.
//  Copyright Slava Bushtruk 2009. All rights reserved.
//

#import "UIKit/UIKit.h"
#import "RMMapView.h"
#import "CoreLocation/CoreLocation.h"

@interface RouteMeSourceSelectionViewController : UIViewController
<RMMapViewDelegate,
UIPickerViewDelegate, UIPickerViewDataSource,
CLLocationManagerDelegate>
{
	IBOutlet RMMapView *mapView;
	IBOutlet UIPickerView *mapSourcePicker;
	IBOutlet UIBarButtonItem *mapSettingsBarButton;
	IBOutlet UIBarButtonItem *findmeBarButton;
	
	CLLocationManager* locationManager;
}

- (IBAction) showMapsSettings;

- (IBAction)	startFinding;
- (void)		stopFinding;

- (void) showFinding;
- (void) hideFinding;

@end