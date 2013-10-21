//
//  ViewController.m
//  ThermometerGauge
//
//  Created by Thomas Kelly on 18/10/2013.
//  Copyright (c) 2013 Scott Logic. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [ShinobiGauges setLicenseKey:@""]; // Add license key here
    
    //Create the Gauge
    SGaugeLinear *gauge = [[SGaugeLinear alloc] initWithFrame:_placeholder.bounds fromMinimum:@-40 toMaximum:@50];
    gauge.orientation = SGaugeLinearOrientationVertical;
    [_placeholder addSubview:gauge];
    
    //Set a value
    gauge.value = 25;
    
    //Style the gauge
    gauge.style.bevelSecondaryColor = [UIColor darkGrayColor];
    gauge.style.bevelPrimaryColor = gauge.style.bevelSecondaryColor;
    gauge.style.bevelWidth = 5;
    gauge.style.cornerRadius = 25;
    gauge.style.tickMarkAlignment = SGaugeTickAlignBottom;
    gauge.style.tickBaselinePosition = 0.03;

    //Style the axis
    gauge.style.tickLabelOffsetFromBaseline = -45;
    gauge.style.tickLabelColor = [UIColor darkGrayColor];
    gauge.style.tickBaselineWidth = 0;

    //Remove the needle
    gauge.style.needleWidth = 0;
    gauge.style.needleBorderWidth = 0;
    
    //Add the "Mercury"
    gauge.style.fillToValue = YES;
    gauge.style.fillValueInnerRadius = 0.75;
    gauge.style.fillValueOuterRadius = 0.85;

    //Add a Fahrenheit axis
    SGaugeAxis *fahrenheitAxis = [[SGaugeAxis alloc] initWithGauge:gauge];
    fahrenheitAxis.minimumValue = [self fahrenheitFromCelsius:gauge.axis.minimumValue];
    fahrenheitAxis.maximumValue = [self fahrenheitFromCelsius:gauge.axis.maximumValue];
    fahrenheitAxis.tickBaselinePosition = 0.97;
    fahrenheitAxis.tickMarkAlignment = SGaugeTickAlignTop;
    fahrenheitAxis.tickLabelOffsetFromBaseline = 45;
    
    [gauge addSubview:fahrenheitAxis];
}

#pragma mark - Utility Methods

-(double)fahrenheitFromCelsius:(double)celsius
{
    return (celsius * 9.0 / 5.0) + 32;
}

@end
