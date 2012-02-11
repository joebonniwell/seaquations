//
//  SeaquationsMenuView_MainMenuInProgressGame.h
//  seaquations
//
//  Created by goVertex on 10/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SeaquationsMenuView_MainMenuInProgressGameDelegate <NSObject>
// Action Methods
- (void)mainMenuInProgressGame_ResumeGameButtonTapped;
- (void)mainMenuInProgressGame_NewGameButtonTapped;
- (void)mainMenuInProgressGame_DifficultyEasyButtonTapped;
- (void)mainMenuInProgressGame_DifficultyNormalButtonTapped;
- (void)mainMenuInProgressGame_HighScoresButtonTapped;
- (void)mainMenuInProgressGame_HowToPlayButtonTapped;
- (void)mainMenuInProgressGame_goVertexButtonTapped;
- (void)mainMenuInProgressGame_SoundButtonTapped;
// Image Methods
- (UIImage*)bubbleButtonImageLarge;
- (UIImage*)goVertexButtonImage;
@end

@interface SeaquationsMenuView_MainMenuInProgressGame : UIView 
{
    id delegate;
    // Buttons
    UIButton *theNewGameButton;
    UIButton *difficultyButtonEasy;
    UIButton *difficultyButtonNormal;
    UIButton *soundButton;
}
@property (nonatomic, assign) id delegate;
@property (nonatomic, retain) UIButton *theNewGameButton;
@property (nonatomic, retain) UIButton *difficultyButtonEasy;
@property (nonatomic, retain) UIButton *difficultyButtonNormal;
@property (nonatomic, retain) UIButton *soundButton;

#pragma mark -
#pragma mark Methods

- (id)initWithFrame:(CGRect)argFrame delegate:(id)argDelegate;

@end