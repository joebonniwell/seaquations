//
//  SeaquationsMenuView_MainMenuInProgressGame.m
//  seaquations
//
//  Created by goVertex on 10/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SeaquationsMenuView_MainMenuInProgressGame.h"

@implementation SeaquationsMenuView_MainMenuInProgressGame

#pragma mark -
#pragma mark Lifecycle Methods

- (id)initWithFrame:(CGRect)argFrame delegate:(id)argDelegate
{
    self = [super initWithFrame:argFrame];
    if (self) 
    {
        [self setDelegate:argDelegate];
        // Resume Game Button
        UIButton *tempResumeGameButton = [UIButton buttonWithType:UIButtonTypeCustom];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            [tempResumeGameButton setFrame:CGRectMake(kGVMenuView_MainMenuInProgressGame_ResumeGameButtonX_iPad, kGVMenuView_MainMenuInProgressGame_ResumeGameButtonY_iPad, kGVMenuView_MainMenuInProgressGame_ResumeGameButtonWidth_iPad, kGVMenuView_MainMenuInProgressGame_ResumeGameButtonHeight_iPad)];
            [[tempResumeGameButton titleLabel] setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            [tempResumeGameButton setFrame:CGRectMake(kGVMenuView_MainMenuInProgressGame_ResumeGameButtonX_iPhone, kGVMenuView_MainMenuInProgressGame_ResumeGameButtonY_iPhone, kGVMenuView_MainMenuInProgressGame_ResumeGameButtonWidth_iPhone, kGVMenuView_MainMenuInProgressGame_ResumeGameButtonHeight_iPhone)];
            [[tempResumeGameButton titleLabel] setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempResumeGameButton addTarget:[self delegate] action:@selector(mainMenuInProgressGame_ResumeGameButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [tempResumeGameButton setTitle:@"Resume Game" forState:UIControlStateNormal];
        [tempResumeGameButton setBackgroundImage:[[self delegate] bubbleButtonImageLarge] forState:UIControlStateNormal];
        [self addSubview:tempResumeGameButton];
        // New Game Button
        UIButton *tempNewGameButton = [UIButton buttonWithType:UIButtonTypeCustom];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            [tempNewGameButton setFrame:CGRectMake(kGVMenuView_MainMenuInProgressGame_NewGameButtonX_iPad, kGVMenuView_MainMenuInProgressGame_NewGameButtonY_iPad, kGVMenuView_MainMenuInProgressGame_NewGameButtonWidth_iPad, kGVMenuView_MainMenuInProgressGame_NewGameButtonHeight_iPad)];
            [[tempNewGameButton titleLabel] setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            [tempNewGameButton setFrame:CGRectMake(kGVMenuView_MainMenuInProgressGame_NewGameButtonX_iPhone, kGVMenuView_MainMenuInProgressGame_NewGameButtonY_iPhone, kGVMenuView_MainMenuInProgressGame_NewGameButtonWidth_iPhone, kGVMenuView_MainMenuInProgressGame_NewGameButtonHeight_iPhone)];
            [[tempNewGameButton titleLabel] setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempNewGameButton addTarget:[self delegate] action:@selector(mainMenuInProgressGame_NewGameButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [tempNewGameButton setTitle:@"New Game" forState:UIControlStateNormal];
        [self setTheNewGameButton:tempNewGameButton];
        [self addSubview:tempNewGameButton];
        // Difficulty Button - Addition and Subtraction
        UIButton *tempDifficultyButtonAdditionSubtraction = [UIButton buttonWithType:UIButtonTypeCustom];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            [tempDifficultyButtonAdditionSubtraction setFrame:CGRectMake(kGVMenuView_MainMenuInProgressGame_DifficultyEasyButtonX_iPad, kGVMenuView_MainMenuInProgressGame_DifficultyEasyButtonY_iPad, kGVMenuView_MainMenuInProgressGame_DifficultyEasyButtonWidth_iPad, kGVMenuView_MainMenuInProgressGame_DifficultyEasyButtonHeight_iPad)];
            [[tempDifficultyButtonAdditionSubtraction titleLabel] setFont:[UIFont boldSystemFontOfSize:36.0f]];

        }
        else
        {
            [tempDifficultyButtonAdditionSubtraction setFrame:CGRectMake(kGVMenuView_MainMenuInProgressGame_DifficultyEasyButtonX_iPhone, kGVMenuView_MainMenuInProgressGame_DifficultyEasyButtonY_iPhone, kGVMenuView_MainMenuInProgressGame_DifficultyEasyButtonWidth_iPhone, kGVMenuView_MainMenuInProgressGame_DifficultyEasyButtonHeight_iPhone)];
            [[tempDifficultyButtonAdditionSubtraction titleLabel] setFont:[UIFont boldSystemFontOfSize:18.0f]];

        }
        [tempDifficultyButtonAdditionSubtraction addTarget:[self delegate] action:@selector(mainMenuInProgressGame_DifficultyEasyButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [tempDifficultyButtonAdditionSubtraction setTitle:@" + -" forState:UIControlStateNormal];
        [self addSubview:tempDifficultyButtonAdditionSubtraction];
        [self setDifficultyButtonEasy:tempDifficultyButtonAdditionSubtraction];
        // Difficulty Button - Addition, Subtraction, Multiplication and Division
        UIButton *tempDifficultyButtonAdditionSubtractionMultiplicationDivision = [UIButton buttonWithType:UIButtonTypeCustom];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            [tempDifficultyButtonAdditionSubtractionMultiplicationDivision setFrame:CGRectMake(kGVMenuView_MainMenuInProgressGame_DifficultyNormalButtonX_iPad, kGVMenuView_MainMenuInProgressGame_DifficultyNormalButtonY_iPad, kGVMenuView_MainMenuInProgressGame_DifficultyNormalButtonWidth_iPad, kGVMenuView_MainMenuInProgressGame_DifficultyNormalButtonHeight_iPad)];
            [[tempDifficultyButtonAdditionSubtractionMultiplicationDivision titleLabel] setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            [tempDifficultyButtonAdditionSubtractionMultiplicationDivision setFrame:CGRectMake(kGVMenuView_MainMenuInProgressGame_DifficultyNormalButtonX_iPhone, kGVMenuView_MainMenuInProgressGame_DifficultyNormalButtonY_iPhone, kGVMenuView_MainMenuInProgressGame_DifficultyNormalButtonWidth_iPhone, kGVMenuView_MainMenuInProgressGame_DifficultyNormalButtonHeight_iPhone)];
            [[tempDifficultyButtonAdditionSubtractionMultiplicationDivision titleLabel] setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempDifficultyButtonAdditionSubtractionMultiplicationDivision addTarget:[self delegate] action:@selector(mainMenuInProgressGame_DifficultyNormalButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [tempDifficultyButtonAdditionSubtractionMultiplicationDivision setTitle:@"+ - * /" forState:UIControlStateNormal];
        [self addSubview:tempDifficultyButtonAdditionSubtractionMultiplicationDivision];
        [self setDifficultyButtonNormal:tempDifficultyButtonAdditionSubtractionMultiplicationDivision];
        // High Score Button
        UIButton *tempHighScoresButton = [UIButton buttonWithType:UIButtonTypeCustom];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            [tempHighScoresButton setFrame:CGRectMake(kGVMenuView_MainMenuInProgressGame_HighScoresButtonX_iPad, kGVMenuView_MainMenuInProgressGame_HighScoresButtonY_iPad, kGVMenuView_MainMenuInProgressGame_HighScoresButtonWidth_iPad, kGVMenuView_MainMenuInProgressGame_HighScoresButtonHeight_iPad)];
            [[tempHighScoresButton titleLabel] setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            [tempHighScoresButton setFrame:CGRectMake(kGVMenuView_MainMenuInProgressGame_HighScoresButtonX_iPhone, kGVMenuView_MainMenuInProgressGame_HighScoresButtonY_iPhone, kGVMenuView_MainMenuInProgressGame_HighScoresButtonWidth_iPhone, kGVMenuView_MainMenuInProgressGame_HighScoresButtonHeight_iPhone)];
            [[tempHighScoresButton titleLabel] setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempHighScoresButton addTarget:[self delegate] action:@selector(mainMenuInProgressGame_HighScoresButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [tempHighScoresButton setTitle:@"High Scores" forState:UIControlStateNormal];
        [tempHighScoresButton setBackgroundImage:[[self delegate] bubbleButtonImageLarge] forState:UIControlStateNormal];
        [self addSubview:tempHighScoresButton];
        // How To Play Button
        UIButton *tempHowToPlayButton = [UIButton buttonWithType:UIButtonTypeCustom];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            [tempHowToPlayButton setFrame:CGRectMake(kGVMenuView_MainMenuInProgressGame_HowtoPlayButtonX_iPad, kGVMenuView_MainMenuInProgressGame_HowtoPlayButtonY_iPad, kGVMenuView_MainMenuInProgressGame_HowtoPlayButtonWidth_iPad, kGVMenuView_MainMenuInProgressGame_HowtoPlayButtonHeight_iPad)];
            [[tempHowToPlayButton titleLabel] setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            [tempHowToPlayButton setFrame:CGRectMake(kGVMenuView_MainMenuInProgressGame_HowtoPlayButtonX_iPhone, kGVMenuView_MainMenuInProgressGame_HowtoPlayButtonY_iPhone, kGVMenuView_MainMenuInProgressGame_HowtoPlayButtonWidth_iPhone, kGVMenuView_MainMenuInProgressGame_HowtoPlayButtonHeight_iPhone)];
            [[tempHowToPlayButton titleLabel] setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempHowToPlayButton addTarget:[self delegate] action:@selector(mainMenuInProgressGame_HowToPlayButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [tempHowToPlayButton setTitle:@"How To Play" forState:UIControlStateNormal];
        [tempHowToPlayButton setBackgroundImage:[[self delegate] bubbleButtonImageLarge] forState:UIControlStateNormal];
        [self addSubview:tempHowToPlayButton];
        // goVertex Button
        UIButton *tempGoVertexButton = [UIButton buttonWithType:UIButtonTypeCustom];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            [tempGoVertexButton setFrame:CGRectMake(kGVMenuView_MainMenuInProgressGame_goVertexButtonX_iPad, kGVMenuView_MainMenuInProgressGame_goVertexButtonY_iPad, kGVMenuView_MainMenuInProgressGame_goVertexButtonWidth_iPad, kGVMenuView_MainMenuInProgressGame_goVertexButtonHeight_iPad)];
        else
            [tempGoVertexButton setFrame:CGRectMake(kGVMenuView_MainMenuInProgressGame_goVertexButtonX_iPhone, kGVMenuView_MainMenuInProgressGame_goVertexButtonY_iPhone, kGVMenuView_MainMenuInProgressGame_goVertexButtonWidth_iPhone, kGVMenuView_MainMenuInProgressGame_goVertexButtonHeight_iPhone)];
        [tempGoVertexButton setImage:[[self delegate] goVertexButtonImage] forState:UIControlStateNormal];
        [tempGoVertexButton addTarget:[self delegate] action:@selector(mainMenuInProgressGame_goVertexButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:tempGoVertexButton];
        // Mute Button
        UIButton *tempSoundButton = [UIButton buttonWithType:UIButtonTypeCustom];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            [tempSoundButton setFrame:CGRectMake(kGVMenuView_MainMenuInProgressGame_MuteButtonX_iPad, kGVMenuView_MainMenuInProgressGame_MuteButtonY_iPad, kGVMenuView_MainMenuInProgressGame_MuteButtonWidth_iPad, kGVMenuView_MainMenuInProgressGame_MuteButtonHeight_iPad)];
        else
            [tempSoundButton setFrame:CGRectMake(kGVMenuView_MainMenuInProgressGame_MuteButtonX_iPhone, kGVMenuView_MainMenuInProgressGame_MuteButtonY_iPhone, kGVMenuView_MainMenuInProgressGame_MuteButtonWidth_iPhone, kGVMenuView_MainMenuInProgressGame_MuteButtonHeight_iPhone)];
        [tempSoundButton addTarget:[self delegate] action:@selector(mainMenuInProgressGame_SoundButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:tempSoundButton];
        [self setSoundButton:tempSoundButton];
    }
    return self;
}

- (void)dealloc
{
    [self setTheNewGameButton:nil];
    [self setDifficultyButtonEasy:nil];
    [self setDifficultyButtonNormal:nil];
    [self setSoundButton:nil];
    [super dealloc];
}

@synthesize delegate;
// Buttons
@synthesize theNewGameButton;
@synthesize difficultyButtonEasy;
@synthesize difficultyButtonNormal;
@synthesize soundButton;
@end
