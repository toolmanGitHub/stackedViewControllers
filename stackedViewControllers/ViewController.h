//
//  ViewController.h
//  stackedViewControllers
//
//  Created by Tim and Jennifer Taylor on 11/19/11.
//  Copyright (c) 2011 Big Diggy SW. All rights reserved.
//

#import <UIKit/UIKit.h>
@class childViewController;
@interface ViewController : UIViewController
@property (nonatomic,retain) childViewController *currentViewController;
@property NSInteger childNumber;

-(void)swapViewControllers;
-(void)pushViewControllers;
@end
