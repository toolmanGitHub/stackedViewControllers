//
//  ViewController.m
//  stackedViewControllers
//
//  Created by Tim and Jennifer Taylor on 11/19/11.
//  Copyright (c) 2011 Big Diggy SW. All rights reserved.
//

#import "ViewController.h"
#import "childViewController.h"

@implementation ViewController
@synthesize currentViewController = currentViewController_;
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"ViewController:  %@",self);
    currentViewController_ = [[childViewController alloc] initWithNibName:@"childViewController" bundle:nil];
    [self addChildViewController:self.currentViewController];
    [self.view addSubview:self.currentViewController.view];
    [self.currentViewController didMoveToParentViewController:self];
    [self.currentViewController.swapViewControllerButton setTitle:@"Swap" forState:UIControlStateNormal];
   
    
}

#pragma mark -
#pragma mark UIViewController Container Methods
- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers{
    return YES;
}

-(void)swapViewControllers{
    childViewController *aNewViewController = [[childViewController alloc] initWithNibName:@"childViewController" bundle:nil] ;
    
    [self addChildViewController:aNewViewController];
    [self transitionFromViewController:self.currentViewController
                      toViewController:aNewViewController
                              duration:1.0 
                               options:UIViewAnimationOptionTransitionCurlUp
                            animations:nil
                            completion:^(BOOL finished) {
                                [aNewViewController didMoveToParentViewController:self];
                                [self.currentViewController removeFromParentViewController];
                                [aNewViewController.swapViewControllerButton setTitle:@"Swap" forState:UIControlStateNormal];
                                
                                self.currentViewController=[aNewViewController autorelease];
                            }];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
