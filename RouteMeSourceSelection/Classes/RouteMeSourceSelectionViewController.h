//
//  RouteMeSourceSelectionViewController.h
//  RouteMeSourceSelection
//
//  Created by Слава on 25.12.09.
//  Copyright Slava Bushtruk 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMMapView.h"

@interface RouteMeSourceSelectionViewController : UIViewController
<RMMapViewDelegate,
UIPickerViewDelegate, UIPickerViewDataSource>
{
	IBOutlet RMMapView *mapView;
	IBOutlet UIPickerView *mapSourcePicker;
	IBOutlet UIBarButtonItem *mapSettingsBarButton;
}

- (IBAction) showMapsSettings;

@end

