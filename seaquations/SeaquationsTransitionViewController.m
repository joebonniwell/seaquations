//
//  SeaquationsTransitionViewController.m
//  seaquations
//
//  Created by goVertex on 10/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SeaquationsTransitionViewController.h"

@implementation SeaquationsTransitionViewController

#pragma mark -
#pragma mark Object Lifecycle

- (void)dealloc
{
    if (column1ImageView_gv)
    {
        [column1ImageView_gv release];
        column1ImageView_gv = nil;
    }
    if (column2ImageView_gv)
    {
        [column2ImageView_gv release];
        column2ImageView_gv = nil;
    }
    if (column3ImageView_gv)
    {
        [column3ImageView_gv release];
        column3ImageView_gv = nil;
    }
    if (column4ImageView_gv)
    {
        [column4ImageView_gv release];
        column4ImageView_gv = nil;
    }
    if (column5ImageView_gv)
    {
        [column5ImageView_gv release];
        column5ImageView_gv = nil;
    }
    if (column6ImageView_gv)
    {
        [column6ImageView_gv release];
        column6ImageView_gv = nil;
    }
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark - View Lifecycle

- (void)loadView
{
    UIView *tempView;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        tempView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 768.0f, 1024.0f)];
    else
        tempView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 480.0f)];
    [tempView setOpaque:NO];
    [tempView setBackgroundColor:[UIColor clearColor]];
    [self setView:tempView];
    [tempView release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    if (column1ImageView_gv)
    {
        [column1ImageView_gv release];
        column1ImageView_gv = nil;
    }
    if (column2ImageView_gv)
    {
        [column2ImageView_gv release];
        column2ImageView_gv = nil;
    }
    if (column3ImageView_gv)
    {
        [column3ImageView_gv release];
        column3ImageView_gv = nil;
    }
    if (column4ImageView_gv)
    {
        [column4ImageView_gv release];
        column4ImageView_gv = nil;
    }
    if (column5ImageView_gv)
    {
        [column5ImageView_gv release];
        column5ImageView_gv = nil;
    }
    if (column6ImageView_gv)
    {
        [column6ImageView_gv release];
        column6ImageView_gv = nil;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark Transition Update Methods

- (void)updateTransitionFromLeftToRightWithDuration:(NSTimeInterval)argDuration
{
    float alphaChange = (3.5f / kTransitionAnimationDuration) * argDuration;
    NSTimeInterval elapsedTransitionTime = [[self delegate] elapsedTransitionTime];
    if (elapsedTransitionTime < ((1.0/13.0) * kTransitionAnimationDuration))
    {
        [[self column1ImageView] setAlpha:([[self column1ImageView] alpha] + alphaChange)];
    }
    else if (elapsedTransitionTime < ((2.0/13.0) * kTransitionAnimationDuration))
    {
        [[self column1ImageView] setAlpha:([[self column1ImageView] alpha] + alphaChange)];
        [[self column2ImageView] setAlpha:([[self column2ImageView] alpha] + alphaChange)];
    }
    else if (elapsedTransitionTime < ((3.0/13.0) * kTransitionAnimationDuration))
    {
        [[self column1ImageView] setAlpha:([[self column1ImageView] alpha] + alphaChange)];
        [[self column2ImageView] setAlpha:([[self column2ImageView] alpha] + alphaChange)];
        [[self column3ImageView] setAlpha:([[self column3ImageView] alpha] + alphaChange)];
    }
    else if (elapsedTransitionTime < ((4.0/13.0) * kTransitionAnimationDuration))
    {
        [[self column1ImageView] setAlpha:([[self column1ImageView] alpha] + alphaChange)];
        [[self column2ImageView] setAlpha:([[self column2ImageView] alpha] + alphaChange)];
        [[self column3ImageView] setAlpha:([[self column3ImageView] alpha] + alphaChange)];
        [[self column4ImageView] setAlpha:([[self column4ImageView] alpha] + alphaChange)];
    }
    else if (elapsedTransitionTime < ((5.0/13.0) * kTransitionAnimationDuration))
    {
        [[self column1ImageView] setAlpha:([[self column1ImageView] alpha] - alphaChange)];
        [[self column2ImageView] setAlpha:([[self column2ImageView] alpha] + alphaChange)];
        [[self column3ImageView] setAlpha:([[self column3ImageView] alpha] + alphaChange)];
        [[self column4ImageView] setAlpha:([[self column4ImageView] alpha] + alphaChange)];
        [[self column5ImageView] setAlpha:([[self column5ImageView] alpha] + alphaChange)];
    }
    else if (elapsedTransitionTime < ((6.0/13.0) * kTransitionAnimationDuration))
    {
        [[self column1ImageView] setAlpha:([[self column1ImageView] alpha] - alphaChange)];
        [[self column2ImageView] setAlpha:([[self column2ImageView] alpha] - alphaChange)];
        [[self column3ImageView] setAlpha:([[self column3ImageView] alpha] + alphaChange)];
        [[self column4ImageView] setAlpha:([[self column4ImageView] alpha] + alphaChange)];
        [[self column5ImageView] setAlpha:([[self column5ImageView] alpha] + alphaChange)];
        [[self column6ImageView] setAlpha:([[self column6ImageView] alpha] + alphaChange)];
    }
    else if (elapsedTransitionTime < ((7.0/13.0) * kTransitionAnimationDuration))
    {
        [[self column1ImageView] setAlpha:([[self column1ImageView] alpha] - alphaChange)];
        [[self column2ImageView] setAlpha:([[self column2ImageView] alpha] - alphaChange)];
        [[self column3ImageView] setAlpha:([[self column3ImageView] alpha] - alphaChange)];
        [[self column4ImageView] setAlpha:([[self column4ImageView] alpha] + alphaChange)];
        [[self column5ImageView] setAlpha:([[self column5ImageView] alpha] + alphaChange)];
        [[self column6ImageView] setAlpha:([[self column6ImageView] alpha] + alphaChange)];
    }
    else if (elapsedTransitionTime < ((8.0/13.0) * kTransitionAnimationDuration))
    {
        [[self column1ImageView] setAlpha:([[self column1ImageView] alpha] - alphaChange)];
        [[self column2ImageView] setAlpha:([[self column2ImageView] alpha] - alphaChange)];
        [[self column3ImageView] setAlpha:([[self column3ImageView] alpha] - alphaChange)];
        [[self column4ImageView] setAlpha:([[self column4ImageView] alpha] - alphaChange)];
        [[self column5ImageView] setAlpha:([[self column5ImageView] alpha] + alphaChange)];
        [[self column6ImageView] setAlpha:([[self column6ImageView] alpha] + alphaChange)];
    }
    else if (elapsedTransitionTime < ((9.0/13.0) * kTransitionAnimationDuration))
    {
        [[self column1ImageView] setAlpha:0];
        [[self column2ImageView] setAlpha:([[self column2ImageView] alpha] - alphaChange)];
        [[self column3ImageView] setAlpha:([[self column3ImageView] alpha] - alphaChange)];
        [[self column4ImageView] setAlpha:([[self column4ImageView] alpha] - alphaChange)];
        [[self column5ImageView] setAlpha:([[self column5ImageView] alpha] - alphaChange)];
        [[self column6ImageView] setAlpha:([[self column6ImageView] alpha] + alphaChange)];
    }
    else if (elapsedTransitionTime < ((10.0/13.0) * kTransitionAnimationDuration))
    {
        [[self column2ImageView] setAlpha:0];
        [[self column3ImageView] setAlpha:([[self column3ImageView] alpha] - alphaChange)];
        [[self column4ImageView] setAlpha:([[self column4ImageView] alpha] - alphaChange)];
        [[self column5ImageView] setAlpha:([[self column5ImageView] alpha] - alphaChange)];
        [[self column6ImageView] setAlpha:([[self column6ImageView] alpha] - alphaChange)];
    }
    else if (elapsedTransitionTime < ((11.0/13.0) * kTransitionAnimationDuration))
    {
        [[self column3ImageView] setAlpha:0];
        [[self column4ImageView] setAlpha:([[self column4ImageView] alpha] - alphaChange)];
        [[self column5ImageView] setAlpha:([[self column5ImageView] alpha] - alphaChange)];
        [[self column6ImageView] setAlpha:([[self column6ImageView] alpha] - alphaChange)];
    }
    else if (elapsedTransitionTime < ((12.0/13.0) * kTransitionAnimationDuration))
    {
        [[self column4ImageView] setAlpha:0];
        [[self column5ImageView] setAlpha:([[self column5ImageView] alpha] - alphaChange)];
        [[self column6ImageView] setAlpha:([[self column6ImageView] alpha] - alphaChange)];
    }
    else if (elapsedTransitionTime < kTransitionAnimationDuration)
    {
        [[self column6ImageView] setAlpha:([[self column6ImageView] alpha] - alphaChange)];
    }
}

- (void)updateTransitionFromRightToLeftWithDuration:(NSTimeInterval)argDuration
{
    float alphaChange = (3.5f / kTransitionAnimationDuration) * argDuration;
    NSTimeInterval elapsedTransitionTime = [[self delegate] elapsedTransitionTime];
    if (elapsedTransitionTime < ((1.0/13.0) * kTransitionAnimationDuration))
    {
        [[self column6ImageView] setAlpha:([[self column6ImageView] alpha] + alphaChange)];
    }
    else if (elapsedTransitionTime < ((2.0/13.0) * kTransitionAnimationDuration))
    {
        [[self column6ImageView] setAlpha:([[self column6ImageView] alpha] + alphaChange)];
        [[self column5ImageView] setAlpha:([[self column5ImageView] alpha] + alphaChange)];
    }
    else if (elapsedTransitionTime < ((3.0/13.0) * kTransitionAnimationDuration))
    {
        [[self column6ImageView] setAlpha:([[self column6ImageView] alpha] + alphaChange)];
        [[self column5ImageView] setAlpha:([[self column5ImageView] alpha] + alphaChange)];
        [[self column4ImageView] setAlpha:([[self column4ImageView] alpha] + alphaChange)];
    }
    else if (elapsedTransitionTime < ((4.0/13.0) * kTransitionAnimationDuration))
    {
        [[self column6ImageView] setAlpha:([[self column6ImageView] alpha] + alphaChange)];
        [[self column5ImageView] setAlpha:([[self column5ImageView] alpha] + alphaChange)];
        [[self column4ImageView] setAlpha:([[self column4ImageView] alpha] + alphaChange)];
        [[self column3ImageView] setAlpha:([[self column3ImageView] alpha] + alphaChange)];
    }
    else if (elapsedTransitionTime < ((5.0/13.0) * kTransitionAnimationDuration))
    {
        [[self column6ImageView] setAlpha:([[self column6ImageView] alpha] - alphaChange)];
        [[self column5ImageView] setAlpha:([[self column5ImageView] alpha] + alphaChange)];
        [[self column4ImageView] setAlpha:([[self column4ImageView] alpha] + alphaChange)];
        [[self column3ImageView] setAlpha:([[self column3ImageView] alpha] + alphaChange)];
        [[self column2ImageView] setAlpha:([[self column2ImageView] alpha] + alphaChange)];
    }
    else if (elapsedTransitionTime < ((6.0/13.0) * kTransitionAnimationDuration))
    {
        [[self column6ImageView] setAlpha:([[self column6ImageView] alpha] - alphaChange)];
        [[self column5ImageView] setAlpha:([[self column5ImageView] alpha] - alphaChange)];
        [[self column4ImageView] setAlpha:([[self column4ImageView] alpha] + alphaChange)];
        [[self column3ImageView] setAlpha:([[self column3ImageView] alpha] + alphaChange)];
        [[self column2ImageView] setAlpha:([[self column2ImageView] alpha] + alphaChange)];
        [[self column1ImageView] setAlpha:([[self column1ImageView] alpha] + alphaChange)];
    }
    else if (elapsedTransitionTime < ((7.0/13.0) * kTransitionAnimationDuration))
    {
        [[self column6ImageView] setAlpha:([[self column6ImageView] alpha] - alphaChange)];
        [[self column5ImageView] setAlpha:([[self column5ImageView] alpha] - alphaChange)];
        [[self column4ImageView] setAlpha:([[self column4ImageView] alpha] - alphaChange)];
        [[self column3ImageView] setAlpha:([[self column3ImageView] alpha] + alphaChange)];
        [[self column2ImageView] setAlpha:([[self column2ImageView] alpha] + alphaChange)];
        [[self column1ImageView] setAlpha:([[self column1ImageView] alpha] + alphaChange)];
    }
    else if (elapsedTransitionTime < ((8.0/13.0) * kTransitionAnimationDuration))
    {
        [[self column6ImageView] setAlpha:([[self column6ImageView] alpha] - alphaChange)];
        [[self column5ImageView] setAlpha:([[self column5ImageView] alpha] - alphaChange)];
        [[self column4ImageView] setAlpha:([[self column4ImageView] alpha] - alphaChange)];
        [[self column3ImageView] setAlpha:([[self column3ImageView] alpha] - alphaChange)];
        [[self column2ImageView] setAlpha:([[self column2ImageView] alpha] + alphaChange)];
        [[self column1ImageView] setAlpha:([[self column1ImageView] alpha] + alphaChange)];
    }
    else if (elapsedTransitionTime < ((9.0/13.0) * kTransitionAnimationDuration))
    {
        [[self column6ImageView] setAlpha:0];
        [[self column5ImageView] setAlpha:([[self column5ImageView] alpha] - alphaChange)];
        [[self column4ImageView] setAlpha:([[self column4ImageView] alpha] - alphaChange)];
        [[self column3ImageView] setAlpha:([[self column3ImageView] alpha] - alphaChange)];
        [[self column2ImageView] setAlpha:([[self column2ImageView] alpha] - alphaChange)];
        [[self column1ImageView] setAlpha:([[self column1ImageView] alpha] + alphaChange)];
    }
    else if (elapsedTransitionTime < ((10.0/13.0) * kTransitionAnimationDuration))
    {
        [[self column5ImageView] setAlpha:0];
        [[self column4ImageView] setAlpha:([[self column4ImageView] alpha] - alphaChange)];
        [[self column3ImageView] setAlpha:([[self column3ImageView] alpha] - alphaChange)];
        [[self column2ImageView] setAlpha:([[self column2ImageView] alpha] - alphaChange)];
        [[self column1ImageView] setAlpha:([[self column1ImageView] alpha] - alphaChange)];
    }
    else if (elapsedTransitionTime < ((11.0/13.0) * kTransitionAnimationDuration))
    {
        [[self column4ImageView] setAlpha:0];
        [[self column3ImageView] setAlpha:([[self column3ImageView] alpha] - alphaChange)];
        [[self column2ImageView] setAlpha:([[self column2ImageView] alpha] - alphaChange)];
        [[self column1ImageView] setAlpha:([[self column1ImageView] alpha] - alphaChange)];
    }
    else if (elapsedTransitionTime < ((12.0/13.0) * kTransitionAnimationDuration))
    {
        [[self column3ImageView] setAlpha:0];
        [[self column2ImageView] setAlpha:([[self column2ImageView] alpha] - alphaChange)];
        [[self column1ImageView] setAlpha:([[self column1ImageView] alpha] - alphaChange)];
    }
    else if (elapsedTransitionTime < kTransitionAnimationDuration)
    {
        [[self column1ImageView] setAlpha:([[self column1ImageView] alpha] - alphaChange)];
    }
}

- (void)transitionStarted
{
    [[self column1ImageView] setAlpha:0];
    [[self column2ImageView] setAlpha:0];
    [[self column3ImageView] setAlpha:0];
    [[self column4ImageView] setAlpha:0];
    [[self column5ImageView] setAlpha:0];
    [[self column6ImageView] setAlpha:0];
    [[self view] setHidden:NO];
}

- (void)transitionEnded
{
    [[self column1ImageView] setAlpha:0];
    [[self column2ImageView] setAlpha:0];
    [[self column3ImageView] setAlpha:0];
    [[self column4ImageView] setAlpha:0];
    [[self column5ImageView] setAlpha:0];
    [[self column6ImageView] setAlpha:0];
    [[self view] setHidden:YES];
}

#pragma mark -
#pragma mark Getters

- (UIImageView*)column1ImageView
{
    if (column1ImageView_gv)
        return column1ImageView_gv;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        column1ImageView_gv = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 100.0f, 180.0f, 924.0f)];
        [column1ImageView_gv setImage:[UIImage imageNamed:@"Seaquations-TransitionBubblesColumn1HD.png"]];
    }
    else
    {
        column1ImageView_gv = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 50.0f, 75.0f, 430.0f)];
        [column1ImageView_gv setImage:[UIImage imageNamed:@"Seaquations-TransitionBubblesColumn1.png"]];
    }
    
    [column1ImageView_gv setOpaque:NO];
    [column1ImageView_gv setBackgroundColor:[UIColor clearColor]];
    [column1ImageView_gv setAlpha:0.0f];
    [[self view] addSubview:column1ImageView_gv];
    return column1ImageView_gv;
}

- (UIImageView*)column2ImageView
{
    if (column2ImageView_gv)
        return column2ImageView_gv;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        column2ImageView_gv = [[UIImageView alloc] initWithFrame:CGRectMake(120.0f, 100.0f, 180.0f, 924.0f)];
        [column2ImageView_gv setImage:[UIImage imageNamed:@"Seaquations-TransitionBubblesColumn2HD.png"]];
    }
    else
    {
        column2ImageView_gv = [[UIImageView alloc] initWithFrame:CGRectMake(50.0f, 50.0f, 75.0f, 430.0f)];
        [column2ImageView_gv setImage:[UIImage imageNamed:@"Seaquations-TransitionBubblesColumn2.png"]];
    }

    [column2ImageView_gv setOpaque:NO];
    [column2ImageView_gv setBackgroundColor:[UIColor clearColor]];
    [column2ImageView_gv setAlpha:0.0f];
    [[self view] addSubview:column2ImageView_gv];
    return column2ImageView_gv;
}

- (UIImageView*)column3ImageView
{
    if (column3ImageView_gv)
        return column3ImageView_gv;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        column3ImageView_gv = [[UIImageView alloc] initWithFrame:CGRectMake(240.0f, 100.0f, 180.0f, 924.0f)];
        [column3ImageView_gv setImage:[UIImage imageNamed:@"Seaquations-TransitionBubblesColumn3HD.png"]];
    }
    else
    {
        column3ImageView_gv = [[UIImageView alloc] initWithFrame:CGRectMake(100.0f, 50.0f, 75.0f, 430.0f)];
        [column3ImageView_gv setImage:[UIImage imageNamed:@"Seaquations-TransitionBubblesColumn3.png"]];
    }
    
    [column3ImageView_gv setOpaque:NO];
    [column3ImageView_gv setBackgroundColor:[UIColor clearColor]];
    [column3ImageView_gv setAlpha:0.0f];
    [[self view] addSubview:column3ImageView_gv];
    return column3ImageView_gv;
}

- (UIImageView*)column4ImageView
{
    if (column4ImageView_gv)
        return column4ImageView_gv;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        column4ImageView_gv = [[UIImageView alloc] initWithFrame:CGRectMake(348.0f, 100.0f, 180.0f, 924.0f)];
        [column4ImageView_gv setImage:[UIImage imageNamed:@"Seaquations-TransitionBubblesColumn4HD.png"]];
    }
    else
    {
        column4ImageView_gv = [[UIImageView alloc] initWithFrame:CGRectMake(170.0f, 50.0f, 75.0f, 430.0f)];
        [column4ImageView_gv setImage:[UIImage imageNamed:@"Seaquations-TransitionBubblesColumn4.png"]];
    }
    
    [column4ImageView_gv setOpaque:NO];
    [column4ImageView_gv setBackgroundColor:[UIColor clearColor]];
    [column4ImageView_gv setAlpha:0.0f];
    [[self view] addSubview:column4ImageView_gv];
    return column4ImageView_gv;
}

- (UIImageView*)column5ImageView
{
    if (column5ImageView_gv)
        return column5ImageView_gv;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        column5ImageView_gv = [[UIImageView alloc] initWithFrame:CGRectMake(468.0f, 100.0f, 180.0f, 924.0f)];
        [column5ImageView_gv setImage:[UIImage imageNamed:@"Seaquations-TransitionBubblesColumn5HD.png"]];
    }
    else
    {
        column5ImageView_gv = [[UIImageView alloc] initWithFrame:CGRectMake(220.0f, 50.0f, 75.0f, 430.0f)];
        [column5ImageView_gv setImage:[UIImage imageNamed:@"Seaquations-TransitionBubblesColumn5.png"]];
    }
    
    [column5ImageView_gv setOpaque:NO];
    [column5ImageView_gv setBackgroundColor:[UIColor clearColor]];
    [column5ImageView_gv setAlpha:0.0f];
    [[self view] addSubview:column5ImageView_gv];
    return column5ImageView_gv;
}

- (UIImageView*)column6ImageView
{
    if (column6ImageView_gv)
        return column6ImageView_gv;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        column6ImageView_gv = [[UIImageView alloc] initWithFrame:CGRectMake(588.0f, 100.0f, 180.0f, 924.0f)];
        [column6ImageView_gv setImage:[UIImage imageNamed:@"Seaquations-TransitionBubblesColumn6HD.png"]];
    }
    else
    {
        column6ImageView_gv = [[UIImageView alloc] initWithFrame:CGRectMake(270.0f, 50.0f, 75.0f, 430.0f)];
        [column6ImageView_gv setImage:[UIImage imageNamed:@"Seaquations-TransitionBubblesColumn6.png"]];
    }
    
    [column6ImageView_gv setOpaque:NO];
    [column6ImageView_gv setBackgroundColor:[UIColor clearColor]];
    [column6ImageView_gv setAlpha:0.0f];
    [[self view] addSubview:column6ImageView_gv];
    return column6ImageView_gv;
}

#pragma mark -
#pragma mark Properties
// Delegate
@synthesize delegate;
// Column Image Views
@synthesize column1ImageView;
@synthesize column2ImageView;
@synthesize column3ImageView;
@synthesize column4ImageView;
@synthesize column5ImageView;
@synthesize column6ImageView;

@end
