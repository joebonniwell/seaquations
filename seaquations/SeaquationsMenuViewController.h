//
//  SeaquationsMenuViewController.h
//  seaquations
//
//  Created by goVertex on 10/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h>
#import "SeaquationsMenuView_MainMenu.h"
#import "SeaquationsMenuView_MainMenuInProgressGame.h"
#import "SeaquationsMenuView_HighScoresMenu.h"
#import "SeaquationsMenuView_HowToPlayMenu.h"
#import "SeaquationsMenuView_PostGameMenu.h"
#import "SeaquationsMenuView_PostGameMenuNewHighScore.h"

@protocol SeaquationsMenuViewControllerDelegate <NSObject>

- (void)newGame;
- (void)resumeGame;
- (void)showMainMenuFromMenu;
- (void)showHighScoresMenu;
- (void)showHowToPlayMenu;
- (void)resetScoresAndStats;
- (NSMutableArray*)highScoresArray;
- (void)recordCurrentHighScoreWithName:(NSString*)argPlayerName;
- (void)showGoVertexView;
- (void)stopAllSounds;
- (void)playBubbleTapSound;

@end

@interface SeaquationsMenuViewController : UIViewController <   UIScrollViewDelegate, UITableViewDelegate, 
                                                                UITableViewDataSource, UITextFieldDelegate, 
                                                                SeaquationsMenuView_MainMenuDelegate, 
                                                                SeaquationsMenuView_MainMenuInProgressGameDelegate, 
                                                                SeaquationsMenuView_HighScoresMenuDelegate, 
                                                                SeaquationsMenuView_HowToPlayMenuDelegate, 
                                                                SeaquationsMenuView_PostGameMenuDelegate, 
                                                                SeaquationsMenuView_PostGameMenuNewHighScoreDelegate>
{
    // Delegate
    id delegate;
    // Menu State
    NSInteger currentMenuState;
    
    @private
    // MenuViews
    SeaquationsMenuView_MainMenu *mainMenu_gv;
    SeaquationsMenuView_MainMenuInProgressGame *mainMenuInProgressGame_gv;
    SeaquationsMenuView_HighScoresMenu *highScoresMenu_gv;
    SeaquationsMenuView_HowToPlayMenu *howToPlayMenu_gv;
    SeaquationsMenuView_PostGameMenu *postGameMenu_gv;
    SeaquationsMenuView_PostGameMenuNewHighScore *postGameMenuNewHighScore_gv;
}
// Delegate
@property (nonatomic, assign) id delegate;
// Menu State
@property (nonatomic) NSInteger currentMenuState;
// Menu Views
@property (nonatomic, readonly, retain) SeaquationsMenuView_MainMenu *mainMenu;
@property (nonatomic, readonly, retain) SeaquationsMenuView_MainMenuInProgressGame *mainMenuInProgressGame;
@property (nonatomic, readonly, retain) SeaquationsMenuView_HighScoresMenu *highScoresMenu;
@property (nonatomic, readonly, retain) SeaquationsMenuView_HowToPlayMenu *howToPlayMenu;
@property (nonatomic, readonly, retain) SeaquationsMenuView_PostGameMenu *postGameMenu;
@property (nonatomic, readonly, retain) SeaquationsMenuView_PostGameMenuNewHighScore *postGameMenuNewHighScore;

#pragma mark -
#pragma mark Methods
// Transition Methods
- (void)transitionToMenuState:(NSInteger)argToMenuState;
// Post Game Display Methods
- (void)displayPostGameScoreValue:(NSInteger)argScore;
- (void)displayPostGameEquationsValue:(NSInteger)argEquations;
- (void)displayPostGameTimeValue:(NSTimeInterval)argDuration;
// Post Game New High Score Display Methods
- (void)displayPostGameNewHighScorePlace:(NSInteger)argPlace;
- (void)displayPostGameNewHighScoreValue:(NSInteger)argScore;
- (void)displayPostGameNewHighScoreEquationsValue:(NSInteger)argEquations;
- (void)displayPostGameNewHighScoreTimeValue:(NSTimeInterval)argDuration;
// High Score Display Methods
- (void)displayHighScoresMenuTotalGamesPlayedValue:(NSInteger)argTotalGamesPlayed;
- (void)displayHighScoresMenuTotalEquationsValue:(NSInteger)argTotalEquations;
- (void)displayHighScoresMenuTotalTimePlayedValue:(NSTimeInterval)argTotalPlayTime;
// Difficulty Configuration Methods
- (void)displayDifficultyEasy;
- (void)displayDifficultyNormal;
// Sound Display Methods
- (void)displaySoundOn;
- (void)displaySoundOff;
// Image Methods
- (UIImage*)theNewGameButtonImage_Easy;
- (UIImage*)theNewGameButtonImage_Normal;
- (UIImage*)easyButtonImage;
- (UIImage*)easyButtonImage_Selected;
- (UIImage*)normalButtonImage;
- (UIImage*)normalButtonImage_Selected;
- (UIImage*)bubbleButtonImageLarge;
- (UIImage*)goVertexButtonImage;
- (UIImage*)soundOnImage;
- (UIImage*)soundOffImage;
@end
