//
//  ViewController.h
//  ThermometerGauge
//
//  Created by Thomas Kelly on 18/10/2013.
//  Copyright (c) 2013 Scott Logic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ShinobiGauges/ShinobiGauges.h>

@interface ViewController : UIViewController<SGaugeDelegate>

@property (weak, nonatomic) IBOutlet UIView *placeholder;

@end
