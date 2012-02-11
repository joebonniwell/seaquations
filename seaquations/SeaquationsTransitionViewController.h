//
//  SeaquationsTransitionViewController.h
//  seaquations
//
//  Created by goVertex on 10/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SeaquationsTransitionViewControllerDelegate <NSObject>

- (NSTimeInterval)elapsedTransitionTime;

@end

@interface SeaquationsTransitionViewController : UIViewController 
{
    id delegate;
@private
    UIImageView *column1ImageView_gv;
    UIImageView *column2ImageView_gv;
    UIImageView *column3ImageView_gv;
    UIImageView *column4ImageView_gv;
    UIImageView *column5ImageView_gv;
    UIImageView *column6ImageView_gv;
}
@property (nonatomic, assign) id delegate;
@property (nonatomic, readonly, retain) UIImageView *column1ImageView;
@property (nonatomic, readonly, retain) UIImageView *column2ImageView;
@property (nonatomic, readonly, retain) UIImageView *column3ImageView;
@property (nonatomic, readonly, retain) UIImageView *column4ImageView;
@property (nonatomic, readonly, retain) UIImageView *column5ImageView;
@property (nonatomic, readonly, retain) UIImageView *column6ImageView;

#pragma mark -
#pragma mark Methods
// Transition Update Methods
- (void)updateTransitionFromLeftToRightWithDuration:(NSTimeInterval)argDuration;
- (void)updateTransitionFromRightToLeftWithDuration:(NSTimeInterval)argDuration;
- (void)transitionStarted;
- (void)transitionEnded;

@end