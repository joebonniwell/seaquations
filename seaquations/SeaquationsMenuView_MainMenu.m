//
//  SeaquationsMenuView_MainMenu.m
//  seaquations
//
//  Created by goVertex on 10/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SeaquationsMenuView_MainMenu.h"

@implementation SeaquationsMenuView_MainMenu

#pragma mark -
#pragma mark Lifecycle Methods

- (id)initWithFrame:(CGRect)argFrame delegate:(id)argDelegate
{
    self = [super initWithFrame:argFrame];
    if (self) 
    {
        [self setDelegate:argDelegate];
        // New Game Button
        UIButton *tempNewGameButton = [UIButton buttonWithType:UIButtonTypeCustom];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            [tempNewGameButton setFrame:CGRectMake(kGVMenuView_MainMenu_NewGameButtonX_iPad, kGVMenuView_MainMenu_NewGameButtonY_iPad, kGVMenuView_MainMenu_NewGameButtonWidth_iPad, kGVMenuView_MainMenu_NewGameButtonHeight_iPad)];
            [[tempNewGameButton titleLabel] setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            [tempNewGameButton setFrame:CGRectMake(kGVMenuView_MainMenu_NewGameButtonX_iPhone, kGVMenuView_MainMenu_NewGameButtonY_iPhone, kGVMenuView_MainMenu_NewGameButtonWidth_iPhone, kGVMenuView_MainMenu_NewGameButtonHeight_iPhone)];
            [[tempNewGameButton titleLabel] setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempNewGameButton addTarget:[self delegate] action:@selector(mainMenu_NewGameButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [tempNewGameButton setTitle:NSLocalizedString(@"New Game", @"New Game") forState:UIControlStateNormal];
        [self setTheNewGameButton:tempNewGameButton];
        [self addSubview:tempNewGameButton];
        // Difficulty Easy Button
        UIButton *tempDifficultyButtonAdditionSubtraction = [UIButton buttonWithType:UIButtonTypeCustom];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            [tempDifficultyButtonAdditionSubtraction setFrame:CGRectMake(kGVMenuView_MainMenu_DifficultyEasyButtonX_iPad, kGVMenuView_MainMenu_DifficultyEasyButtonY_iPad, kGVMenuView_MainMenu_DifficultyEasyButtonWidth_iPad, kGVMenuView_MainMenu_DifficultyEasyButtonHeight_iPad)];
            [[tempDifficultyButtonAdditionSubtraction titleLabel] setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            [tempDifficultyButtonAdditionSubtraction setFrame:CGRectMake(kGVMenuView_MainMenu_DifficultyEasyButtonX_iPhone, kGVMenuView_MainMenu_DifficultyEasyButtonY_iPhone, kGVMenuView_MainMenu_DifficultyEasyButtonWidth_iPhone, kGVMenuView_MainMenu_DifficultyEasyButtonHeight_iPhone)];
            [[tempDifficultyButtonAdditionSubtraction titleLabel] setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempDifficultyButtonAdditionSubtraction addTarget:[self delegate] action:@selector(mainMenu_DifficultyEasyButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [tempDifficultyButtonAdditionSubtraction setTitle:@" + -" forState:UIControlStateNormal];
        [self addSubview:tempDifficultyButtonAdditionSubtraction];
        [self setDifficultyButtonEasy:tempDifficultyButtonAdditionSubtraction];
        // Difficulty Normal Button
        UIButton *tempDifficultyButtonAdditionSubtractionMultiplicationDivision = [UIButton buttonWithType:UIButtonTypeCustom];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            [tempDifficultyButtonAdditionSubtractionMultiplicationDivision setFrame:CGRectMake(kGVMenuView_MainMenu_DifficultyNormalButtonX_iPad, kGVMenuView_MainMenu_DifficultyNormalButtonY_iPad, kGVMenuView_MainMenu_DifficultyNormalButtonWidth_iPad, kGVMenuView_MainMenu_DifficultyNormalButtonHeight_iPad)];
            [[tempDifficultyButtonAdditionSubtractionMultiplicationDivision titleLabel] setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            [tempDifficultyButtonAdditionSubtractionMultiplicationDivision setFrame:CGRectMake(kGVMenuView_MainMenu_DifficultyNormalButtonX_iPhone, kGVMenuView_MainMenu_DifficultyNormalButtonY_iPhone, kGVMenuView_MainMenu_DifficultyNormalButtonWidth_iPhone, kGVMenuView_MainMenu_DifficultyNormalButtonHeight_iPhone)];
            [[tempDifficultyButtonAdditionSubtractionMultiplicationDivision titleLabel] setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempDifficultyButtonAdditionSubtractionMultiplicationDivision addTarget:[self delegate] action:@selector(mainMenu_DifficultyNormalButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [tempDifficultyButtonAdditionSubtractionMultiplicationDivision setTitle:@"+ - * /" forState:UIControlStateNormal];
        [self addSubview:tempDifficultyButtonAdditionSubtractionMultiplicationDivision];
        [self setDifficultyButtonNormal:tempDifficultyButtonAdditionSubtractionMultiplicationDivision];
        // High Score Button
        UIButton *tempHighScoresButton = [UIButton buttonWithType:UIButtonTypeCustom];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            [tempHighScoresButton setFrame:CGRectMake(kGVMenuView_MainMenu_HighScoresButtonX_iPad, kGVMenuView_MainMenu_HighScoresButtonY_iPad, kGVMenuView_MainMenu_HighScoresButtonWidth_iPad, kGVMenuView_MainMenu_HighScoresButtonHeight_iPad)];
            [[tempHighScoresButton titleLabel] setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            [tempHighScoresButton setFrame:CGRectMake(kGVMenuView_MainMenu_HighScoresButtonX_iPhone, kGVMenuView_MainMenu_HighScoresButtonY_iPhone, kGVMenuView_MainMenu_HighScoresButtonWidth_iPhone, kGVMenuView_MainMenu_HighScoresButtonHeight_iPhone)];
            [[tempHighScoresButton titleLabel] setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempHighScoresButton addTarget:[self delegate] action:@selector(mainMenu_HighScoresButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [tempHighScoresButton setTitle:@"High Scores" forState:UIControlStateNormal];
        [tempHighScoresButton setBackgroundImage:[[self delegate] bubbleButtonImageLarge] forState:UIControlStateNormal];
        [self addSubview:tempHighScoresButton];
        // How To Play Button
        UIButton *tempHowToPlayButton = [UIButton buttonWithType:UIButtonTypeCustom];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            [tempHowToPlayButton setFrame:CGRectMake(kGVMenuView_MainMenu_HowtoPlayButtonX_iPad, kGVMenuView_MainMenu_HowtoPlayButtonY_iPad, kGVMenuView_MainMenu_HowtoPlayButtonWidth_iPad, kGVMenuView_MainMenu_HowtoPlayButtonHeight_iPad)];
            [[tempHowToPlayButton titleLabel] setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            [tempHowToPlayButton setFrame:CGRectMake(kGVMenuView_MainMenu_HowtoPlayButtonX_iPhone, kGVMenuView_MainMenu_HowtoPlayButtonY_iPhone, kGVMenuView_MainMenu_HowtoPlayButtonWidth_iPhone, kGVMenuView_MainMenu_HowtoPlayButtonHeight_iPhone)];
            [[tempHowToPlayButton titleLabel] setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempHowToPlayButton addTarget:[self delegate] action:@selector(mainMenu_HowToPlayButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [tempHowToPlayButton setTitle:@"How to Play" forState:UIControlStateNormal];
        [tempHowToPlayButton setBackgroundImage:[[self delegate] bubbleButtonImageLarge] forState:UIControlStateNormal];
        [self addSubview:tempHowToPlayButton];
        // goVertex Button
        UIButton *tempGoVertexButton = [UIButton buttonWithType:UIButtonTypeCustom];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            [tempGoVertexButton setFrame:CGRectMake(kGVMenuView_MainMenu_goVertexButtonX_iPad, kGVMenuView_MainMenu_goVertexButtonY_iPad, kGVMenuView_MainMenu_goVertexButtonWidth_iPad, kGVMenuView_MainMenu_goVertexButtonHeight_iPad)];
        else
            [tempGoVertexButton setFrame:CGRectMake(kGVMenuView_MainMenu_goVertexButtonX_iPhone, kGVMenuView_MainMenu_goVertexButtonY_iPhone, kGVMenuView_MainMenu_goVertexButtonWidth_iPhone, kGVMenuView_MainMenu_goVertexButtonHeight_iPhone)];
        [tempGoVertexButton setImage:[[self delegate] goVertexButtonImage] forState:UIControlStateNormal];
        [tempGoVertexButton addTarget:[self delegate] action:@selector(mainMenu_goVertexButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:tempGoVertexButton];
        // Mute Button
        UIButton *tempSoundButton = [UIButton buttonWithType:UIButtonTypeCustom];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            [tempSoundButton setFrame:CGRectMake(kGVMenuView_MainMenu_MuteButtonX_iPad, kGVMenuView_MainMenu_MuteButtonY_iPad, kGVMenuView_MainMenu_MuteButtonWidth_iPad, kGVMenuView_MainMenu_MuteButtonHeight_iPad)];
        else
            [tempSoundButton setFrame:CGRectMake(kGVMenuView_MainMenu_MuteButtonX_iPhone, kGVMenuView_MainMenu_MuteButtonY_iPhone, kGVMenuView_MainMenu_MuteButtonWidth_iPhone, kGVMenuView_MainMenu_MuteButtonHeight_iPhone)];
        [tempSoundButton addTarget:[self delegate] action:@selector(mainMenu_SoundButtonTapped) forControlEvents:UIControlEventTouchUpInside];
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
@synthesize theNewGameButton;
@synthesize difficultyButtonEasy;
@synthesize difficultyButtonNormal;
@synthesize soundButton;
@end

