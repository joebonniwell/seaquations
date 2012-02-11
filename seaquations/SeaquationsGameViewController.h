//
//  SeaquationsGameViewController.h
//  seaquations
//
//  Created by goVertex on 10/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "SeaquationsGameState.h"
#import "GVDecimalNumber.h"
#import "GVOperator.h"
#import "seaquationsTile.h"

@protocol SeaquationsGameViewControllerDelegate <NSObject>

- (void)showMainMenuFromGame;
- (seaquationsGameState*)currentGameState;
- (void)gameEnded;
- (void)setGameIsActive:(BOOL)state;
- (void)setGameLossAnimationIsActive:(BOOL)state;
- (void)startPlayingWarningSound;
- (void)stopPlayingWarningSound;
- (void)playBubbleTapSound;
- (void)playGameEndSound;
- (NSInteger)numberOfHighScores;

@end

@interface SeaquationsGameViewController : UIViewController
{
    // Model
    BOOL warningIsActive;
    BOOL warningImageDecreasingOpacity;
    BOOL tapGuideIsActive;
    BOOL tapGuideImageDecreasingOpacity;
    BOOL warningHasBeenPlayed;
    BOOL popBubbleThisFrame;
    NSTimeInterval gameLossAnimationAccumulatedDuration;
    NSTimeInterval individualBubblePopAccumulator;
    NSTimeInterval individualBubblePopThreshold;
    //  View
    UIImageView *warningImageView;
    UIView *boardView;
    UILabel *registerLabel;
    UIButton *backspaceButton;
    UIButton *clearAllButton;
    UILabel *scoreLabel;
    UIButton *mainMenuButton;
    // Controller
    id delegate;
    
}
// Model
@property (nonatomic) BOOL popBubbleThisFrame;
@property (nonatomic) BOOL warningIsActive;
@property (nonatomic) NSTimeInterval gameLossAnimationAccumulatedDuration;
// View
@property (nonatomic, retain) UIImageView *warningImageView;
@property (nonatomic, retain) UIView *boardView;
@property (nonatomic, retain) UILabel *registerLabel;
@property (nonatomic, retain) UIButton *backspaceButton;
@property (nonatomic, retain) UIButton *clearAllButton;
@property (nonatomic, retain) UILabel *scoreLabel;
@property (nonatomic, retain) UIButton *mainMenuButton;
// Controller
@property (nonatomic, assign) id delegate;
@property (nonatomic, retain) NSDate *previousUpdateDate;
@property (nonatomic, retain) NSTimer *timer;

- (void)tileWasSelected:(seaquationsTile*)argTile;
- (seaquationsGameState*)gameState;
- (void)gameWillAppear;
// Timer Methods
- (void)updateTilesVisible;
- (void)displayNewTilesWithOvershoot:(float)argOvershoot;

- (void)removeTile:(seaquationsTile*)argTile;
- (void)updateDisplay;

- (void)updateForDuration:(NSTimeInterval)argDuration;
- (void)updateGameLossAnimationForDuration:(NSTimeInterval)argDuration;

@end

