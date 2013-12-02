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
    RMGenericMapSource * weatherMap = [[RMGenericMapSource alloc] initWithHost:@"tile.openweathermap.org/map/clouds" tileCacheKey:@"cloudCover" minZoom:0 maxZoom:18];
    
    
    self.mapView.tileSource = openStreetMap;
    
    
    [self.mapView addTileSource:weatherMap];
    
    self.overlay = weatherMap;
    // rough bb W = -30.0 degrees; E = 50.0 degrees; S = +35.0 degrees; N = +70.0 degrees
    NSLog(@"zooming to europe");
    CLLocationCoordinate2D northEastLondon = CLLocationCoordinate2DMake(70,-30);
    CLLocationCoordinate2D southWestLondon = CLLocationCoordinate2DMake(35,50);
    [self.mapView zoomWithLatitudeLongitudeBoundsSouthWest:southWestLondon northEast:northEastLondon animated:YES];
    
    [self.mapView setOpacity:0.5 forTileSource: self.overlay];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeOverlayOpacity:(UISlider *)sender {
    
    NSLog(@"Slider value changed %f", sender.value );
    [self.mapView setOpacity:sender.value forTileSource: self.overlay];
    
}
@end
