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
@synthesize childNumber;
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    childNumber=0;
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"ViewController:  %@",self);
    currentViewController_ = [[childViewController alloc] initWithNibName:@"childViewController" bundle:nil];
    [self addChildViewController:self.currentViewController];
    [self.view addSubview:self.currentViewController.view];
    [self.currentViewController didMoveToParentViewController:self];
    [self.currentViewController.swapViewControllerButton setTitle:@"Swap" forState:UIControlStateNormal];
    
    self.currentViewController.childNumberLabel.text=[NSString stringWithFormat:@"Child Number:  %d",self.childNumber];
    
   
    
}

#pragma mark -
#pragma mark UIViewController Container Methods
- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers{
    return YES;
}

-(void)swapViewControllers{
    childViewController *aNewViewController = [[childViewController alloc] initWithNibName:@"childViewController" bundle:nil] ;
    
    childNumber++;
    
    [aNewViewController.view layoutIfNeeded];
    [aNewViewController.swapViewControllerButton setTitle:@"Swap" forState:UIControlStateNormal];
    aNewViewController.childNumberLabel.text=[NSString stringWithFormat:@"Child Number:  %d",self.childNumber];
    
    [self addChildViewController:aNewViewController];
    
    __weak __block ViewController *weakSelf=self;
    [self transitionFromViewController:self.currentViewController
                  toViewController:aNewViewController
                          duration:1.0 
                           options:UIViewAnimationOptionTransitionCurlUp
                        animations:nil
                        completion:^(BOOL finished) {
                            
                            [aNewViewController didMoveToParentViewController:weakSelf];
                            
                            [weakSelf.currentViewController willMoveToParentViewController:nil];
                            [weakSelf.currentViewController removeFromParentViewController];
                            
                            weakSelf.currentViewController=[aNewViewController autorelease];
                        }];
}

-(void)pushViewControllers{
    childViewController *aNewViewController = [[childViewController alloc] initWithNibName:@"childViewController" bundle:nil] ;
    
    childNumber++;
    
    [aNewViewController.view layoutIfNeeded];
    aNewViewController.childNumberLabel.text=[NSString stringWithFormat:@"Child Number:  %d",self.childNumber];
    
    CGRect inputViewFrame=self.view.frame;
    CGFloat inputViewWidth=inputViewFrame.size.width;
    
    CGRect newFrame=CGRectMake(self.view.bounds.size.width, 0, inputViewFrame.size.width, inputViewFrame.size.height);
    
    aNewViewController.view.frame=newFrame;
   
    [self addChildViewController:aNewViewController];
    
    [self.view addSubview:aNewViewController.view];
    
    [self.currentViewController willMoveToParentViewController:nil];
    
    CGRect offSetRect=CGRectOffset(newFrame, -inputViewWidth, 0.0f);
    
    __weak __block ViewController *weakSelf=self;
    [UIView animateWithDuration:0.4 animations:^{
        aNewViewController.view.frame=offSetRect;
    }
                     completion:^(BOOL finished){
                         [aNewViewController didMoveToParentViewController:weakSelf];
                         
                         [weakSelf.currentViewController.view removeFromSuperview];
                         [weakSelf.currentViewController removeFromParentViewController];
                         
                         weakSelf.currentViewController=[aNewViewController autorelease];
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
