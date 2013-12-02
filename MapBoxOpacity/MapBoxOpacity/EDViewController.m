//
//  EDViewController.m
//  MapBoxOpacity
//
//  Created by murray king on 29/11/2013.
//  Copyright (c) 2013 Edina. All rights reserved.
//

#import "EDViewController.h"
#import "MapBox.h"
#import "RMOpenStreetMapSource.h"
#import "RMTileSource.h"

@interface EDViewController ()

@end

@implementation EDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    RMOpenStreetMapSource * openStreetMap = [[RMOpenStreetMapSource alloc] init];
    RMGenericMapSource * historicMap = [[RMGenericMapSource alloc] initWithHost:@"geo.nls.uk/mapdata3/os/london" tileCacheKey:@"Historic" minZoom:0 maxZoom:18];

  
    self.mapView.tileSource = openStreetMap;

    
     [self.mapView addTileSource:historicMap];
    
    
    NSLog(@"zooming to london");
        CLLocationCoordinate2D northEastLondon = CLLocationCoordinate2DMake(51.520814,-0.076046);
        CLLocationCoordinate2D southWestLondon = CLLocationCoordinate2DMake(51.503614,-0.112782);
        [self.mapView zoomWithLatitudeLongitudeBoundsSouthWest:southWestLondon northEast:northEastLondon animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
