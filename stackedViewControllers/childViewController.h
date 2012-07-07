//
//  childViewController.h
//  stackedViewControllers
//
//  Created by Tim and Jennifer Taylor on 11/19/11.
//  Copyright (c) 2011 Big Diggy SW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface childViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIButton *swapViewControllerButton;
- (IBAction)swapViewController:(id)sender;
@property (retain, nonatomic) IBOutlet UILabel *childNumberLabel;

@end
