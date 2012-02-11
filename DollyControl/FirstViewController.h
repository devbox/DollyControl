//
//  FirstViewController.h
//  DollyControl
//
//  Created by David Rentsch on 11.02.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController
- (IBAction)switchValueChanged:(id)sender;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
