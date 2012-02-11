//
//  SeaquationsBackgroundViewController.h
//  seaquations
//
//  Created by goVertex on 10/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SeaquationsBackgroundViewController : UIViewController
{
    @private
    BOOL fishTravelingRightToLeft;
    UIImageView *backgroundFishTravelingRightImageView_gv;
    UIImageView *backgroundFishTravelingLeftImageView_gv;
    UIImageView *backgroundCloudImageView_gv;
    UIImageView *foregroundLeftCloudImageView_gv;
    UIImageView *foregroundRightCloudImageView_gv;
}
@property (nonatomic, readonly, retain) UIImageView *backgroundFishTravelingRightImageView;
@property (nonatomic, readonly, retain) UIImageView *backgroundFishTravelingLeftImageView;
@property (nonatomic, readonly, retain) UIImageView *backgroundCloudImageView;
@property (nonatomic, readonly, retain) UIImageView *foregroundLeftCloudImageView;
@property (nonatomic, readonly, retain) UIImageView *foregroundRightCloudImageView;

#pragma mark -
#pragma mark Movable Background Update Methods

- (void)updateBackgroundFishImageViewPositionForDuration:(NSTimeInterval)argDuration;
- (void)updateBackgroundCloudImageViewPositionForDuration:(NSTimeInterval)argDuration;
- (void)updateForegroundCloudImageViewPositionsOnscreenForDuration:(NSTimeInterval)argDuration;
- (void)updateForegroundCloudImageViewPositionsOffscreenForDuration:(NSTimeInterval)argDuration;

@end
