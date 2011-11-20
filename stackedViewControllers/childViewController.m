//
//  childViewController.m
//  stackedViewControllers
//
//  Created by Tim and Jennifer Taylor on 11/19/11.
//  Copyright (c) 2011 Big Diggy SW. All rights reserved.
//

#import "childViewController.h"
#import "ViewController.h"

@implementation childViewController
@synthesize swapViewControllerButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setSwapViewControllerButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

- (void)dealloc {
    [swapViewControllerButton release];
    [super dealloc];
}
- (IBAction)swapViewController:(id)sender {
    NSLog(@"swapViewController start");
    NSLog(@"    parentViewController:  %@",self.parentViewController);
    [self.parentViewController swapViewControllers];
}
@end
