//
//  SeaquationsBackgroundViewController.m
//  seaquations
//
//  Created by goVertex on 10/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SeaquationsBackgroundViewController.h"

@implementation SeaquationsBackgroundViewController

#pragma mark -
#pragma mark Object Lifecycle

- (void)dealloc
{
    if (backgroundFishTravelingRightImageView_gv)
    {
        [backgroundFishTravelingRightImageView_gv release];
        backgroundFishTravelingRightImageView_gv = nil;
    }
    if (backgroundFishTravelingLeftImageView_gv)
    {
        [backgroundFishTravelingLeftImageView_gv release];
        backgroundFishTravelingLeftImageView_gv = nil;
    }
    if (backgroundCloudImageView_gv)
    {
        [backgroundCloudImageView_gv release];
        backgroundCloudImageView_gv = nil;
    }
    if (foregroundLeftCloudImageView_gv)
    {
        [foregroundLeftCloudImageView_gv release];
        foregroundLeftCloudImageView_gv = nil;
    }
    if (foregroundRightCloudImageView_gv)
    {
        [foregroundRightCloudImageView_gv release];
        foregroundRightCloudImageView_gv = nil;
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
    [tempView setBackgroundColor:[UIColor colorWithRed:0.0f green:0.0f blue:0.2f alpha:1.0f]];
    [self setView:tempView];
    [tempView release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Background
    UIImageView *tempBackgroundImageView;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        tempBackgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Seaquations-BackgroundHD.png"]];
        [tempBackgroundImageView setFrame:CGRectMake(0.0f, 0.0f, 768.0f, 1024.0f)];
    }
    else
    {
        tempBackgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Seaquations-Background.png"]];
        [tempBackgroundImageView setFrame:CGRectMake(0.0f, 0.0f, 320.0f, 480.0f)];
    }
    [[self view] addSubview:tempBackgroundImageView];
    [tempBackgroundImageView release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    if (backgroundFishTravelingRightImageView_gv)
    {
        [backgroundFishTravelingRightImageView_gv release];
        backgroundFishTravelingRightImageView_gv = nil;
    }
    if (backgroundFishTravelingLeftImageView_gv)
    {
        [backgroundFishTravelingLeftImageView_gv release];
        backgroundFishTravelingLeftImageView_gv = nil;
    }
    if (backgroundCloudImageView_gv)
    {
        [backgroundCloudImageView_gv release];
        backgroundCloudImageView_gv = nil;
    }
    if (foregroundLeftCloudImageView_gv)
    {
        [foregroundLeftCloudImageView_gv release];
        foregroundLeftCloudImageView_gv = nil;
    }
    if (foregroundRightCloudImageView_gv)
    {
        [foregroundRightCloudImageView_gv release];
        foregroundRightCloudImageView_gv = nil;
    }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark Background Update Methods

- (void)updateBackgroundFishImageViewPositionForDuration:(NSTimeInterval)argDuration
{
    float deltaDistance = argDuration * kFishImageViewSpeed;
    
    float fishImageView_CenterMinX;
    float fishImageView_CenterMinY;
    float fishImageView_CenterMaxX;
    float fishImageView_CenterMaxY;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        fishImageView_CenterMinX = kFishImageView_CenterMinX_iPad;
        fishImageView_CenterMinY = kFishImageView_CenterMinY_iPad;
        fishImageView_CenterMaxX = kFishImageView_CenterMaxX_iPad;
        fishImageView_CenterMaxY = kFishImageView_CenterMaxY_iPad;
    }
    else
    {
        fishImageView_CenterMinX = kFishImageView_CenterMinX_iPhone;
        fishImageView_CenterMinY = kFishImageView_CenterMinY_iPhone;
        fishImageView_CenterMaxX = kFishImageView_CenterMaxX_iPhone;
        fishImageView_CenterMaxY = kFishImageView_CenterMaxY_iPhone;
    }
    // Update the fish image position
    if (fishTravelingRightToLeft)
        [[self backgroundFishTravelingLeftImageView] setCenter:CGPointMake(([[self backgroundFishTravelingLeftImageView] center].x - deltaDistance), [[self backgroundFishTravelingLeftImageView] center].y)];
    else
        [[self backgroundFishTravelingRightImageView] setCenter:CGPointMake(([[self backgroundFishTravelingRightImageView] center].x + deltaDistance), [[self backgroundFishTravelingRightImageView] center].y)];
    // Check for completion of movement
    if (fishTravelingRightToLeft && [[self backgroundFishTravelingLeftImageView] center].x <= -fishImageView_CenterMinX)
    {
        float newFishY = fmodf(arc4random(), (fishImageView_CenterMaxY - fishImageView_CenterMinY)) + fishImageView_CenterMinY;
        [[self backgroundFishTravelingLeftImageView] setCenter:CGPointMake(fishImageView_CenterMaxX, newFishY)];
        fishTravelingRightToLeft = FALSE;
    }
    else if (!fishTravelingRightToLeft && [[self backgroundFishTravelingRightImageView] center].x >= fishImageView_CenterMaxX)
    {
        float newFishY = fmodf(arc4random(), (fishImageView_CenterMaxY - fishImageView_CenterMinY)) + fishImageView_CenterMinY;
        [[self backgroundFishTravelingRightImageView] setCenter:CGPointMake(-fishImageView_CenterMinX, newFishY)];
        fishTravelingRightToLeft = TRUE;
    }
}

- (void)updateBackgroundCloudImageViewPositionForDuration:(NSTimeInterval)argDuration
{
    float deltaDistance = argDuration * kCloudImageViewSpeed;
    // Update the cloud image position
    [[self backgroundCloudImageView] setCenter:CGPointMake(([[self backgroundCloudImageView] center].x + deltaDistance), [[self backgroundCloudImageView] center].y)];
    // Check for completion of movement
    float cloudImageView_CenterMaxX;
    float cloudImageView_CenterMaxY;
    float cloudImageView_CenterMinX;
    float cloudImageView_CenterMinY;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        cloudImageView_CenterMaxX = kCloudImageView_CenterMaxX_iPad;
        cloudImageView_CenterMaxY = kCloudImageView_CenterMaxY_iPad;
        cloudImageView_CenterMinX = kCloudImageView_CenterMinX_iPad;
        cloudImageView_CenterMinY = kCloudImageView_CenterMinY_iPad;
    }
    else
    {
        cloudImageView_CenterMaxX = kCloudImageView_CenterMaxX_iPhone;
        cloudImageView_CenterMaxY = kCloudImageView_CenterMaxY_iPhone;
        cloudImageView_CenterMinX = kCloudImageView_CenterMinX_iPhone;
        cloudImageView_CenterMinY = kCloudImageView_CenterMinY_iPhone;
    }
    
    if ([[self backgroundCloudImageView] center].x >= cloudImageView_CenterMaxX)
    {
        float newCloudY = fmodf(arc4random(), (cloudImageView_CenterMaxY - cloudImageView_CenterMinY)) + cloudImageView_CenterMinY;
        [[self backgroundCloudImageView] setCenter:CGPointMake(-cloudImageView_CenterMinX, newCloudY)];
    }
}

#pragma mark -
#pragma mark Foreground Update Methods

- (void)updateForegroundCloudImageViewPositionsOnscreenForDuration:(NSTimeInterval)argDuration
{
    float foregroundLeftCloud_OnscreenX;
    float foregroundLeftCloud_OffscreenX;
    float foregroundRightCloud_OnscreenX;
    float foregroundRightCloud_OffscreenX;
    float foregroundCloudY;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        foregroundLeftCloud_OnscreenX = kForegroundLeftCloud_OnscreenX_iPad;
        foregroundLeftCloud_OffscreenX = kForegroundLeftCloud_OffscreenX_iPad;
        foregroundRightCloud_OnscreenX = kForegroundRightCloud_OnscreenX_iPad;
        foregroundRightCloud_OffscreenX = kForegroundRightCloud_OffscreenX_iPad;
        foregroundCloudY = kForegroundCloudY_iPad;
    }
    else
    {
        foregroundLeftCloud_OnscreenX = kForegroundLeftCloud_OnscreenX_iPhone;
        foregroundLeftCloud_OffscreenX = kForegroundLeftCloud_OffscreenX_iPhone;
        foregroundRightCloud_OnscreenX = kForegroundRightCloud_OnscreenX_iPhone;
        foregroundRightCloud_OffscreenX = kForegroundRightCloud_OffscreenX_iPhone;
        foregroundCloudY = kForegroundCloudY_iPhone;
    }
    
    // Left Cloud
    float foregroundLeftCloudTravelDistance = (argDuration / kTransitionAnimationDuration) * (foregroundLeftCloud_OnscreenX + foregroundLeftCloud_OffscreenX);
    if ([[self foregroundLeftCloudImageView] center].x + foregroundLeftCloudTravelDistance > foregroundLeftCloud_OnscreenX)
        [[self foregroundLeftCloudImageView] setCenter:CGPointMake(foregroundLeftCloud_OnscreenX, foregroundCloudY)];
    else
        [[self foregroundLeftCloudImageView] setCenter:CGPointMake([[self foregroundLeftCloudImageView] center].x + foregroundLeftCloudTravelDistance, foregroundCloudY)];
    // Right Cloud
    float foregroundRightCloudTravelDistance = (argDuration / kTransitionAnimationDuration) * (foregroundRightCloud_OffscreenX - foregroundRightCloud_OnscreenX);
    if ([[self foregroundRightCloudImageView] center].x - foregroundRightCloudTravelDistance < foregroundRightCloud_OnscreenX)
        [[self foregroundRightCloudImageView] setCenter:CGPointMake(foregroundRightCloud_OnscreenX, foregroundCloudY)];
    else
        [[self foregroundRightCloudImageView] setCenter:CGPointMake([[self foregroundRightCloudImageView] center].x - foregroundRightCloudTravelDistance, foregroundCloudY)];
}

- (void)updateForegroundCloudImageViewPositionsOffscreenForDuration:(NSTimeInterval)argDuration
{
    float foregroundLeftCloud_OnscreenX;
    float foregroundLeftCloud_OffscreenX;
    float foregroundRightCloud_OnscreenX;
    float foregroundRightCloud_OffscreenX;
    float foregroundCloudY;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        foregroundLeftCloud_OnscreenX = kForegroundLeftCloud_OnscreenX_iPad;
        foregroundLeftCloud_OffscreenX = kForegroundLeftCloud_OffscreenX_iPad;
        foregroundRightCloud_OnscreenX = kForegroundRightCloud_OnscreenX_iPad;
        foregroundRightCloud_OffscreenX = kForegroundRightCloud_OffscreenX_iPad;
        foregroundCloudY = kForegroundCloudY_iPad;
    }
    else
    {
        foregroundLeftCloud_OnscreenX = kForegroundLeftCloud_OnscreenX_iPhone;
        foregroundLeftCloud_OffscreenX = kForegroundLeftCloud_OffscreenX_iPhone;
        foregroundRightCloud_OnscreenX = kForegroundRightCloud_OnscreenX_iPhone;
        foregroundRightCloud_OffscreenX = kForegroundRightCloud_OffscreenX_iPhone;
        foregroundCloudY = kForegroundCloudY_iPhone;
    }
    
    // Left Cloud
    float foregroundLeftCloudTravelDistance = (argDuration / kTransitionAnimationDuration) * (foregroundLeftCloud_OnscreenX + foregroundLeftCloud_OffscreenX);
    if ([[self foregroundLeftCloudImageView] center].x - foregroundLeftCloudTravelDistance < -foregroundLeftCloud_OffscreenX)
        [[self foregroundLeftCloudImageView] setCenter:CGPointMake(-foregroundLeftCloud_OffscreenX, foregroundCloudY)];
    else
        [[self foregroundLeftCloudImageView] setCenter:CGPointMake([[self foregroundLeftCloudImageView] center].x - foregroundLeftCloudTravelDistance, foregroundCloudY)];
    // Right Cloud
    float foregroundRightCloudTravelDistance = (argDuration / kTransitionAnimationDuration) * (foregroundRightCloud_OffscreenX - foregroundRightCloud_OnscreenX);
    if ([[self foregroundRightCloudImageView] center].x + foregroundRightCloudTravelDistance > foregroundRightCloud_OffscreenX)
        [[self foregroundRightCloudImageView] setCenter:CGPointMake(foregroundRightCloud_OffscreenX, foregroundCloudY)];
    else
        [[self foregroundRightCloudImageView] setCenter:CGPointMake([[self foregroundRightCloudImageView] center].x + foregroundRightCloudTravelDistance, foregroundCloudY)];
}

#pragma mark -
#pragma mark Getters

-(UIImageView*)backgroundFishTravelingRightImageView
{
    if (backgroundFishTravelingRightImageView_gv)
        return backgroundFishTravelingRightImageView_gv;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        backgroundFishTravelingRightImageView_gv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Seaquations-BackgroundFishTravelingRightHD.png"]];
        [backgroundFishTravelingRightImageView_gv setFrame:CGRectMake(0.0f, 0.0f, 200.0f, 140.0f)];
        float randomFishY = fmodf(arc4random(), (kFishImageView_CenterMaxY_iPad - kFishImageView_CenterMinY_iPad)) + kFishImageView_CenterMinY_iPad;
        [backgroundFishTravelingRightImageView_gv setCenter:CGPointMake(kFishImageView_CenterMinX_iPad, randomFishY)];
    }
    else
    {
        backgroundFishTravelingRightImageView_gv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Seaquations-BackgroundFishTravelingRight.png"]];
        [backgroundFishTravelingRightImageView_gv setFrame:CGRectMake(0.0f, 0.0f, 100.0f, 70.0f)];
        float randomFishY = fmodf(arc4random(), (kFishImageView_CenterMaxY_iPhone - kFishImageView_CenterMinY_iPhone)) + kFishImageView_CenterMinY_iPhone;
        [backgroundFishTravelingRightImageView_gv setCenter:CGPointMake(kFishImageView_CenterMinX_iPhone, randomFishY)];
        
    }
    
    [[self view] addSubview:backgroundFishTravelingRightImageView_gv];
    return backgroundFishTravelingRightImageView_gv;
}

-(UIImageView*)backgroundFishTravelingLeftImageView
{
    if (backgroundFishTravelingLeftImageView_gv)
        return backgroundFishTravelingLeftImageView_gv;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        backgroundFishTravelingLeftImageView_gv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Seaquations-BackgroundFishTravelingLeftHD.png"]];
        [backgroundFishTravelingLeftImageView_gv setFrame:CGRectMake(0.0f, 0.0f, 200.0f, 140.0f)];
        float randomFishY = fmodf(arc4random(), (kFishImageView_CenterMaxY_iPad - kFishImageView_CenterMinY_iPad)) + kFishImageView_CenterMinY_iPad;
        [backgroundFishTravelingLeftImageView_gv setCenter:CGPointMake(kFishImageView_CenterMaxX_iPad, randomFishY)];
    }
    else
    {
        backgroundFishTravelingLeftImageView_gv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Seaquations-BackgroundFishTravelingLeft.png"]];
        [backgroundFishTravelingLeftImageView_gv setFrame:CGRectMake(0.0f, 0.0f, 100.0f, 70.0f)];
        float randomFishY = fmodf(arc4random(), (kFishImageView_CenterMaxY_iPhone - kFishImageView_CenterMinY_iPhone)) + kFishImageView_CenterMinY_iPhone;
        [backgroundFishTravelingLeftImageView_gv setCenter:CGPointMake(kFishImageView_CenterMaxX_iPhone, randomFishY)];
    }
    
    [[self view] addSubview:backgroundFishTravelingLeftImageView_gv];
    return backgroundFishTravelingLeftImageView_gv;
}

-(UIImageView*)backgroundCloudImageView
{
    if (backgroundCloudImageView_gv)
        return backgroundCloudImageView_gv;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        backgroundCloudImageView_gv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Seaquations-BackgroundCloudHD.png"]];
        [backgroundCloudImageView_gv setFrame:CGRectMake(0.0, 0.0, 110.0f, 60.0f)];
        float randomCloudY = fmodf(arc4random(), (kCloudImageView_CenterMaxY_iPad - kCloudImageView_CenterMinY_iPad)) + kCloudImageView_CenterMinY_iPad;
        [backgroundCloudImageView_gv setCenter:CGPointMake(-kCloudImageView_CenterMinX_iPad, randomCloudY)];
    }
    else
    {
        backgroundCloudImageView_gv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Seaquations-BackgroundCloud.png"]];
        [backgroundCloudImageView_gv setFrame:CGRectMake(0.0, 0.0, 55.0f, 30.0f)];
        float randomCloudY = fmodf(arc4random(), (kCloudImageView_CenterMaxY_iPhone - kCloudImageView_CenterMinY_iPhone)) + kCloudImageView_CenterMinY_iPhone;
        [backgroundCloudImageView_gv setCenter:CGPointMake(-kCloudImageView_CenterMinX_iPhone, randomCloudY)];
    }
    
    [[self view] addSubview:backgroundCloudImageView_gv];
    return backgroundCloudImageView_gv;
}

-(UIImageView*)foregroundLeftCloudImageView
{
    if (foregroundLeftCloudImageView_gv)
        return foregroundLeftCloudImageView_gv;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        foregroundLeftCloudImageView_gv = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 384.0f, 100.0f)];
        [foregroundLeftCloudImageView_gv setImage:[UIImage imageNamed:@"Seaquations-LeftCloudHD.png"]];
        [foregroundLeftCloudImageView_gv setCenter:CGPointMake(-192.0f, 50.0f)];
    }
    else
    {
        foregroundLeftCloudImageView_gv = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 160.0f, 50.0f)];
        [foregroundLeftCloudImageView_gv setImage:[UIImage imageNamed:@"Seaquations-LeftCloud.png"]];
        [foregroundLeftCloudImageView_gv setCenter:CGPointMake(-80.0f, 25.0f)];
    }
    
    [[self view] addSubview:foregroundLeftCloudImageView_gv];
    return foregroundLeftCloudImageView_gv;
}

-(UIImageView*)foregroundRightCloudImageView
{
    if (foregroundRightCloudImageView_gv)
        return foregroundRightCloudImageView_gv;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        foregroundRightCloudImageView_gv = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 384.0f, 100.0f)];
        [foregroundRightCloudImageView_gv setImage:[UIImage imageNamed:@"Seaquations-RightCloudHD.png"]];
        [foregroundRightCloudImageView_gv setCenter:CGPointMake(960.0f, 50.0f)];
    }
    else
    {
        foregroundRightCloudImageView_gv = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 160.0f, 50.0f)];
        [foregroundRightCloudImageView_gv setImage:[UIImage imageNamed:@"Seaquations-RightCloud.png"]];
        [foregroundRightCloudImageView_gv setCenter:CGPointMake(400.0f, 25.0f)];
    }
    
    [[self view] addSubview:foregroundRightCloudImageView_gv];
    return foregroundRightCloudImageView_gv;
}

@end
