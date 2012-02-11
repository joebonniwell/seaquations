//
//  seaquationsAppDelegate.h
//  seaquations
//
//  Created by goVertex on 7/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GameKit/GameKit.h>
#import <AVFoundation/AVFoundation.h>
// View Controllers
#import "SeaquationsGameViewController.h"
#import "SeaquationsMenuViewController.h"
#import "SeaquationsBackgroundViewController.h"
#import "SeaquationsTransitionViewController.h"
#import "SeaquationsGoVertexViewController.h"
// Related Files
#import "seaquationsGameState.h"
#import "seaquationsTile.h"
// 3rd Party Frameworks
#import "LocalyticsSession.h"

@interface seaquationsAppDelegate : NSObject <  UIApplicationDelegate, SeaquationsMenuViewControllerDelegate, 
                                                SeaquationsGameViewControllerDelegate, seaquationsGameStateDelegate, 
                                                SeaquationsGoVertexViewControllerDelegate, AVAudioPlayerDelegate> 
{
    BOOL gameIsActive;
    BOOL gameLossAnimationIsActive;
    BOOL viewsAreTransitioning;
    // View Controllers
    SeaquationsGameViewController *gameViewController;
    SeaquationsMenuViewController *menuViewController;
    SeaquationsBackgroundViewController *backgroundViewController;
    SeaquationsTransitionViewController *transitionViewController;
    SeaquationsGoVertexViewController *goVertexViewController;
    // Data
    seaquationsGameState *currentGameState;
    AVAudioPlayer *gameEndAudioPlayer;
    AVAudioPlayer *bubbleTapAudioPlayerPrimary;
    AVAudioPlayer *bubbleTapAudioPlayerSecondary;
    AVAudioPlayer *alarmAudioPlayer;
    // Update
    CADisplayLink *masterDisplayLink;
    // Transition
    NSInteger activeTransition;
    NSTimeInterval elapsedTransitionTime;
    BOOL firstHalfTransitionElapsed;
    // Stored Data
    NSMutableArray *highScoresArray_gv;
    NSMutableDictionary *gameStatsDictionary_gv;
    
@private
    NSMutableDictionary *newHighScoreValues;
    // Images
    UIImage *tileNormal_;
    UIImage *tileSelected_;
    UIImage *powerUpTime_;
    UIImage *powerUpScore_;
    UIImage *powerUpTiles_;
}
#pragma mark -
#pragma mark Properties
// Window
@property (nonatomic, retain) IBOutlet UIWindow *window;
// Status
@property (nonatomic) BOOL gameIsActive;
@property (nonatomic) BOOL gameLossAnimationIsActive;
@property (nonatomic) BOOL viewsAreTransitioning;
// View Controllers
@property (nonatomic, retain) SeaquationsGameViewController *gameViewController;
@property (nonatomic, retain) SeaquationsMenuViewController *menuViewController;
@property (nonatomic, retain) SeaquationsBackgroundViewController *backgroundViewController;
@property (nonatomic, retain) SeaquationsTransitionViewController *transitionViewController;
@property (nonatomic, retain) SeaquationsGoVertexViewController *goVertexViewController;
// Data
@property (nonatomic, retain) seaquationsGameState *currentGameState;
@property (nonatomic, retain) AVAudioPlayer *gameEndAudioPlayer;
@property (nonatomic, retain) AVAudioPlayer *bubbleTapAudioPlayerPrimary;
@property (nonatomic, retain) AVAudioPlayer *bubbleTapAudioPlayerSecondary;
@property (nonatomic, retain) AVAudioPlayer *alarmAudioPlayer;
// Update
@property (nonatomic, retain) CADisplayLink *masterDisplayLink;
// Transition
@property (nonatomic) NSInteger activeTransition;
@property (nonatomic) NSTimeInterval elapsedTransitionTime;
@property (nonatomic) BOOL firstHalfTransitionElapsed;
// Stored Data
@property (nonatomic, readonly, retain) NSMutableArray *highScoresArray;
@property (nonatomic, readonly, retain) NSMutableDictionary *gameStatsDictionary;
// Image Properties
@property (nonatomic, retain, readonly) UIImage *tileNormal;
@property (nonatomic, retain, readonly) UIImage *tileSelected;
@property (nonatomic, retain, readonly) UIImage *powerUpTime;
@property (nonatomic, retain, readonly) UIImage *powerUpScore;
@property (nonatomic, retain, readonly) UIImage *powerUpTiles;

#pragma mark -
#pragma mark Methods
- (void)loadGameStateUsingExistingGameState:(BOOL)argUseExisting;
// Event Methods
- (void)showMainMenuFromGame;
- (void)showMainMenuFromMenu;
- (void)newGame;
- (void)resumeGame;
- (void)showHighScoresMenu;
- (void)showPostGameMenu;
- (void)showPostGameMenuWithNewHighScore;
- (void)gameEnded;
// Sound Control Methods
- (void)startPlayingWarningSound;
- (void)stopPlayingWarningSound;
- (void)playBubbleTapSound;
- (void)playAlarmSound;
- (void)playGameEndSound;
// Display Methods
- (void)displayMenu;
- (void)displayGame;
// File Methods
- (void)saveGameStateToFile;
- (void)saveGameStatsToFile;
- (void)saveHighScoresToFile;
// File Helper Methods
- (NSString*)gameStateFilePath;
- (NSString*)gameStatsFilePath;
- (NSString*)highScoresFilePath;
// Game Center Methods
- (BOOL)isGameCenterAvailable;
- (void)authenticateLocalPlayer;
- (void)reportScore:(int64_t)score forCategory:(NSString*)category;
- (void)showLeaderBoard;
- (void)leaderBoardViewControllerDidFinish:(GKLeaderboardViewController*)leaderBoardViewController;

@end
