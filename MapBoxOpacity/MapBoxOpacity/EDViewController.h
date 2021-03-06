//
//  EDViewController.h
//  MapBoxOpacity
//
//  Created by murray king on 29/11/2013.
//  Copyright (c) 2013 Edina. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RMMapView;
#import "RMTileSource.h"

@interface EDViewController : UIViewController
@property (weak, nonatomic) IBOutlet RMMapView *mapView;
- (IBAction)changeOverlayOpacity:(id)sender;
@property (nonatomic, strong) id <RMTileSource> overlay;


@end
