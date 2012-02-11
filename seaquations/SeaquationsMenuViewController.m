//
//  SeaquationsMenuViewController.m
//  seaquations
//
//  Created by goVertex on 10/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SeaquationsMenuViewController.h"

@implementation SeaquationsMenuViewController

#pragma mark -
#pragma mark View Controller Methods

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Releases the view if it doesn't have a superview.
    
    // Can check if the instance variables are active, and if not, release and set to nil
    
    if (mainMenu_gv)
    {
        if (![mainMenu_gv superview])
        {
            [mainMenu_gv release];
            mainMenu_gv = nil;
        }
    }
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)loadView
{
    UIView *tempView;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        tempView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 768.0f, 1024.0f)];
    else
        tempView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 480.0f)];
    [tempView setOpaque:NO];
    [self setView:tempView];
    [tempView release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // State Management    
    if ([self currentMenuState] > 0)
        [self transitionToMenuState:[self currentMenuState]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    if (mainMenu_gv)
    {
        [mainMenu_gv release];
        mainMenu_gv = nil;
    }
    if (mainMenuInProgressGame_gv)
    {
        [mainMenuInProgressGame_gv release];
        mainMenuInProgressGame_gv = nil;
    }
    if (highScoresMenu_gv)
    {
        [highScoresMenu_gv release];
        highScoresMenu_gv = nil;
    }
    if (howToPlayMenu_gv)
    {
        [howToPlayMenu_gv release];
        howToPlayMenu_gv = nil;
    }
    if (postGameMenu_gv)
    {
        [postGameMenu_gv release];
        postGameMenu_gv = nil;
    }
    if (postGameMenuNewHighScore_gv)
    {
        [postGameMenuNewHighScore_gv release];
        postGameMenuNewHighScore_gv = nil;
    }
}

#pragma mark -
#pragma mark Menu Transitions

- (void)transitionToMenuState:(NSInteger)argToMenuState
{
    switch (argToMenuState) 
    {
        case kMainMenuState:
            [[[[self view] subviews] lastObject] removeFromSuperview];
            [[self view] addSubview:[self mainMenu]];
            break;
        case kMainMenuInProgressGameState:
            [[[[self view] subviews] lastObject] removeFromSuperview];
            [[self view] addSubview:[self mainMenuInProgressGame]];
            break;
        case kHighScoresMenuState:
            [[[[self view] subviews] lastObject] removeFromSuperview];
            [[self view] addSubview:[self highScoresMenu]];
            break;
        case kHowToPlayMenuState:
            [[[[self view] subviews] lastObject] removeFromSuperview];
            [[self view] addSubview:[self howToPlayMenu]];
            break;
        case kPostGameMenuState:
            [[[[self view] subviews] lastObject] removeFromSuperview];
            [[self view] addSubview:[self postGameMenu]];
            break;
        case kPostGameMenuNewHighScoreState:
            [[[[self view] subviews] lastObject] removeFromSuperview];
            [[self view] addSubview:[self postGameMenuNewHighScore]];
            break;
        default:
            break;
    }
    [self setCurrentMenuState:argToMenuState];
}

#pragma mark -
#pragma mark Post Game Display Methods

- (void)displayPostGameScoreValue:(NSInteger)argScore
{
    [[[self postGameMenu] gameScoreValueLabel] setText:[NSString stringWithFormat:@"%d", argScore]];
}

- (void)displayPostGameEquationsValue:(NSInteger)argEquations
{
    [[[self postGameMenu] gameEquationsValueLabel] setText:[NSString stringWithFormat:@"%d", argEquations]];
}

- (void)displayPostGameTimeValue:(NSTimeInterval)argDuration
{
    long minutes = (long)argDuration / 60;
    long seconds = (long)argDuration % 60;
    NSString *gameDurationString = [NSString stringWithFormat:@"%ld:%02ld", minutes, seconds];
    [[[self postGameMenu] gameTimeValueLabel] setText:gameDurationString];
}

#pragma mark -
#pragma mark Post Game New High Score Display Methods

- (void)displayPostGameNewHighScorePlace:(NSInteger)argPlace
{
    [[[self postGameMenuNewHighScore] highScorePlaceLabel] setText:[NSString stringWithFormat:@"%d.", argPlace]];
}

- (void)displayPostGameNewHighScoreValue:(NSInteger)argScore
{
    [[[self postGameMenuNewHighScore] highScoreValueLabel] setText:[NSString stringWithFormat:@"%d", argScore]];
}

- (void)displayPostGameNewHighScoreEquationsValue:(NSInteger)argEquations
{
    [[[self postGameMenuNewHighScore] gameEquationsValueLabel] setText:[NSString stringWithFormat:@"%d", argEquations]];
}

- (void)displayPostGameNewHighScoreTimeValue:(NSTimeInterval)argDuration
{
    long minutes = (long)argDuration / 60;
    long seconds = (long)argDuration % 60;
    NSString *gameDurationString = [NSString stringWithFormat:@"%ld:%02ld", minutes, seconds];
    [[[self postGameMenuNewHighScore] gameTimeValueLabel] setText:gameDurationString];
}

#pragma mark -
#pragma mark High Score Menu Display Methods

- (void)displayHighScoresMenuTotalGamesPlayedValue:(NSInteger)argTotalGamesPlayed
{
    [[[self highScoresMenu] totalGamesPlayedValueLabel] setText:[NSString stringWithFormat:@"%d", argTotalGamesPlayed]];
}

- (void)displayHighScoresMenuTotalEquationsValue:(NSInteger)argTotalEquations
{
    [[[self highScoresMenu] totalEquationsCreatedValueLabel] setText:[NSString stringWithFormat:@"%d", argTotalEquations]];
}

- (void)displayHighScoresMenuTotalTimePlayedValue:(NSTimeInterval)argTotalPlayTime
{
    long days = (long)argTotalPlayTime / (60 * 60 * 24);
    long hours = ((long)argTotalPlayTime / (60 * 60)) % 24;
    long minutes = ((long)argTotalPlayTime / 60) % 60;
    long seconds = (long)argTotalPlayTime % 60;
    if (days > 1)
        [[[self highScoresMenu] totalTimePlayedValueLabel] setText:[NSString stringWithFormat:@"%d days %d hours %d min %d sec", days, hours, minutes, seconds]];
    else if (hours > 1)
        [[[self highScoresMenu] totalTimePlayedValueLabel] setText:[NSString stringWithFormat:@"%d hours %d min %d sec", days, hours, minutes, seconds]];
    else
        [[[self highScoresMenu] totalTimePlayedValueLabel] setText:[NSString stringWithFormat:@"%d:%02d", minutes, seconds]];
}

#pragma mark -
#pragma mark Image Getters

- (UIImage*)easyButtonImage
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        return [UIImage imageNamed:@"Seaquations-DifficultyButtonEasyUnselectedHD.png"];
    else
        return [UIImage imageNamed:@"Seaquations-DifficultyButtonEasyUnselected.png"];
}

- (UIImage*)easyButtonImage_Selected
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        return [UIImage imageNamed:@"Seaquations-DifficultyButtonEasySelectedHD.png"];
    else
        return [UIImage imageNamed:@"Seaquations-DifficultyButtonEasySelected.png"];
}

- (UIImage*)normalButtonImage
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        return [UIImage imageNamed:@"Seaquations-DifficultyButtonNormalUnselectedHD.png"];
    else
        return [UIImage imageNamed:@"Seaquations-DifficultyButtonNormalUnselected.png"];
}

- (UIImage*)normalButtonImage_Selected
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        return [UIImage imageNamed:@"Seaquations-DifficultyButtonNormalSelectedHD.png"];
    else
        return [UIImage imageNamed:@"Seaquations-DifficultyButtonNormalSelected.png"];
}

- (UIImage*)theNewGameButtonImage_Easy
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        return [UIImage imageNamed:@"Seaquations-NewGameButtonEasyHD.png"];
    else
        return [UIImage imageNamed:@"Seaquations-NewGameButtonEasy.png"];
}

- (UIImage*)theNewGameButtonImage_Normal
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        return [UIImage imageNamed:@"Seaquations-NewGameButtonNormalHD.png"];
    else
        return [UIImage imageNamed:@"Seaquations-NewGameButtonNormal.png"];
}

- (UIImage*)bubbleButtonImageLarge
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        return [UIImage imageNamed:@"Seaquations-MenuBubbleButtonHD.png"];
    else
        return [UIImage imageNamed:@"Seaquations-MenuBubbleButton.png"];
}

- (UIImage*)goVertexButtonImage
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        return [UIImage imageNamed:@"Seaquations-goVertexButtonHD.png"];
    else
        return [UIImage imageNamed:@"Seaquations-goVertexButton.png"];
}

- (UIImage*)soundOnImage
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        return [UIImage imageNamed:@"Seaquations-SoundOnHD.png"];
    else
        return [UIImage imageNamed:@"Seaquations-SoundOn.png"];
}

- (UIImage*)soundOffImage
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        return [UIImage imageNamed:@"Seaquations-SoundOffHD.png"];
    else
        return [UIImage imageNamed:@"Seaquations-SoundOff.png"];
}

- (UIImage*)gameStatsTabUnselectedImage
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        return [UIImage imageNamed:@"Seaquations-BoardTabRightUnselectedHD.png"];
    else
        return [UIImage imageNamed:@"Seaquations-BoardTabRightUnselected.png"];
}

- (UIImage*)highScoresTabSelectedImage
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        return [UIImage imageNamed:@"Seaquations-BoardTabLeftSelectedHD.png"];
    else
        return [UIImage imageNamed:@"Seaquations-BoardTabLeftSelected.png"];
}

#pragma mark -
#pragma mark Menu View Getters

- (SeaquationsMenuView_MainMenu*)mainMenu
{
    if (mainMenu_gv)
        return mainMenu_gv;
    mainMenu_gv = [[SeaquationsMenuView_MainMenu alloc] initWithFrame:[[self view] bounds] delegate:self];
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"EasyDifficulty"] == YES)
    {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            [[mainMenu_gv theNewGameButton] setBackgroundImage:[UIImage imageNamed:@"Seaquations-NewGameButtonEasyHD.png"] forState:UIControlStateNormal];
            [[mainMenu_gv difficultyButtonEasy] setBackgroundImage:[UIImage imageNamed:@"Seaquations-DifficultyButtonEasySelectedHD.png"] forState:UIControlStateNormal];
            [[mainMenu_gv difficultyButtonNormal] setBackgroundImage:[UIImage imageNamed:@"Seaquations-DifficultyButtonNormalUnselectedHD.png"] forState:UIControlStateNormal];
        }
        else
        {
            [[mainMenu_gv theNewGameButton] setBackgroundImage:[UIImage imageNamed:@"Seaquations-NewGameButtonEasy.png"] forState:UIControlStateNormal];
            [[mainMenu_gv difficultyButtonEasy] setBackgroundImage:[UIImage imageNamed:@"Seaquations-DifficultyButtonEasySelected.png"] forState:UIControlStateNormal];
            [[mainMenu_gv difficultyButtonNormal] setBackgroundImage:[UIImage imageNamed:@"Seaquations-DifficultyButtonNormalUnselected.png"] forState:UIControlStateNormal];
        }
    }
    else
    {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            [[mainMenu_gv theNewGameButton] setBackgroundImage:[UIImage imageNamed:@"Seaquations-NewGameButtonNormalHD.png"] forState:UIControlStateNormal];
            [[mainMenu_gv difficultyButtonEasy] setBackgroundImage:[UIImage imageNamed:@"Seaquations-DifficultyButtonEasyUnselectedHD.png"] forState:UIControlStateNormal];
            [[mainMenu_gv difficultyButtonNormal] setBackgroundImage:[UIImage imageNamed:@"Seaquations-DifficultyButtonNormalSelectedHD.png"] forState:UIControlStateNormal];
        }
        else
        {
            [[mainMenu_gv theNewGameButton] setBackgroundImage:[UIImage imageNamed:@"Seaquations-NewGameButtonNormal.png"] forState:UIControlStateNormal];
            [[mainMenu_gv difficultyButtonEasy] setBackgroundImage:[UIImage imageNamed:@"Seaquations-DifficultyButtonEasyUnselected.png"] forState:UIControlStateNormal];
            [[mainMenu_gv difficultyButtonNormal] setBackgroundImage:[UIImage imageNamed:@"Seaquations-DifficultyButtonNormalSelected.png"] forState:UIControlStateNormal];
        }
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"SoundEnabled"] == YES)
    {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            [[mainMenu_gv soundButton] setImage:[UIImage imageNamed:@"Seaquations-SoundOnHD.png"] forState:UIControlStateNormal];
        else
            [[mainMenu_gv soundButton] setImage:[UIImage imageNamed:@"Seaquations-SoundOn.png"] forState:UIControlStateNormal];
    }
    else
    {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            [[mainMenu_gv soundButton] setImage:[UIImage imageNamed:@"Seaquations-SoundOffHD.png"] forState:UIControlStateNormal];
        else
            [[mainMenu_gv soundButton] setImage:[UIImage imageNamed:@"Seaquations-SoundOff.png"] forState:UIControlStateNormal];
    }
    return mainMenu_gv;
}

- (SeaquationsMenuView_MainMenuInProgressGame*)mainMenuInProgressGame
{
    if (mainMenuInProgressGame_gv)
        return mainMenuInProgressGame_gv;
    mainMenuInProgressGame_gv = [[SeaquationsMenuView_MainMenuInProgressGame alloc] initWithFrame:[[self view] bounds] delegate:self];
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"EasyDifficulty"] == YES)
    {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            [[mainMenuInProgressGame_gv theNewGameButton] setBackgroundImage:[UIImage imageNamed:@"Seaquations-NewGameButtonEasyHD.png"] forState:UIControlStateNormal];
            [[mainMenuInProgressGame_gv difficultyButtonEasy] setBackgroundImage:[UIImage imageNamed:@"Seaquations-DifficultyButtonEasySelectedHD.png"] forState:UIControlStateNormal];
            [[mainMenuInProgressGame_gv difficultyButtonNormal] setBackgroundImage:[UIImage imageNamed:@"Seaquations-DifficultyButtonNormalUnselectedHD.png"] forState:UIControlStateNormal];
        }
        else
        {
            [[mainMenuInProgressGame_gv theNewGameButton] setBackgroundImage:[UIImage imageNamed:@"Seaquations-NewGameButtonEasy.png"] forState:UIControlStateNormal];
            [[mainMenuInProgressGame_gv difficultyButtonEasy] setBackgroundImage:[UIImage imageNamed:@"Seaquations-DifficultyButtonEasySelected.png"] forState:UIControlStateNormal];
            [[mainMenuInProgressGame_gv difficultyButtonNormal] setBackgroundImage:[UIImage imageNamed:@"Seaquations-DifficultyButtonNormalUnselected.png"] forState:UIControlStateNormal];
        }
    }
    else
    {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            [[mainMenuInProgressGame_gv theNewGameButton] setBackgroundImage:[UIImage imageNamed:@"Seaquations-NewGameButtonNormalHD.png"] forState:UIControlStateNormal];
            [[mainMenuInProgressGame_gv difficultyButtonEasy] setBackgroundImage:[UIImage imageNamed:@"Seaquations-DifficultyButtonEasyUnselectedHD.png"] forState:UIControlStateNormal];
            [[mainMenuInProgressGame_gv difficultyButtonNormal] setBackgroundImage:[UIImage imageNamed:@"Seaquations-DifficultyButtonNormalSelectedHD.png"] forState:UIControlStateNormal];
        }
        else
        {
            [[mainMenuInProgressGame_gv theNewGameButton] setBackgroundImage:[UIImage imageNamed:@"Seaquations-NewGameButtonNormal.png"] forState:UIControlStateNormal];
            [[mainMenuInProgressGame_gv difficultyButtonEasy] setBackgroundImage:[UIImage imageNamed:@"Seaquations-DifficultyButtonEasyUnselected.png"] forState:UIControlStateNormal];
            [[mainMenuInProgressGame_gv difficultyButtonNormal] setBackgroundImage:[UIImage imageNamed:@"Seaquations-DifficultyButtonNormalSelected.png"] forState:UIControlStateNormal];
        }
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"SoundEnabled"] == YES)
    {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            [[mainMenuInProgressGame_gv soundButton] setImage:[UIImage imageNamed:@"Seaquations-SoundOnHD.png"] forState:UIControlStateNormal];
        else
            [[mainMenuInProgressGame_gv soundButton] setImage:[UIImage imageNamed:@"Seaquations-SoundOn.png"] forState:UIControlStateNormal];
    }
    else
    {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            [[mainMenuInProgressGame_gv soundButton] setImage:[UIImage imageNamed:@"Seaquations-SoundOffHD.png"] forState:UIControlStateNormal];
        else
            [[mainMenuInProgressGame_gv soundButton] setImage:[UIImage imageNamed:@"Seaquations-SoundOff.png"] forState:UIControlStateNormal];
    }
    return mainMenuInProgressGame_gv;
}

- (SeaquationsMenuView_HighScoresMenu*)highScoresMenu
{
    if (highScoresMenu_gv)
        return highScoresMenu_gv;
    highScoresMenu_gv = [[SeaquationsMenuView_HighScoresMenu alloc] initWithFrame:[[self view] bounds] delegate:self];
    return highScoresMenu_gv;
}

- (SeaquationsMenuView_HowToPlayMenu*)howToPlayMenu
{
    if (howToPlayMenu_gv)
        return howToPlayMenu_gv;
    howToPlayMenu_gv = [[SeaquationsMenuView_HowToPlayMenu alloc] initWithFrame:[[self view] bounds] delegate:self];
    return howToPlayMenu_gv;
}

- (SeaquationsMenuView_PostGameMenu*)postGameMenu
{
    if (postGameMenu_gv)
        return postGameMenu_gv;
    postGameMenu_gv = [[SeaquationsMenuView_PostGameMenu alloc] initWithFrame:[[self view] bounds] delegate:self];
    return postGameMenu_gv;
}

- (SeaquationsMenuView_PostGameMenuNewHighScore*)postGameMenuNewHighScore
{
    if (postGameMenuNewHighScore_gv)
        return postGameMenuNewHighScore_gv;
    postGameMenuNewHighScore_gv = [[SeaquationsMenuView_PostGameMenuNewHighScore alloc] initWithFrame:[[self view] bounds] delegate:self];
    return postGameMenuNewHighScore_gv;
}

#pragma mark -
#pragma mark Difficuly Display Methods

- (void)displayDifficultyEasy
{
    [[[self mainMenu] theNewGameButton] setBackgroundImage:[self theNewGameButtonImage_Easy] forState:UIControlStateNormal];
    [[[self mainMenu] difficultyButtonEasy] setBackgroundImage:[self easyButtonImage_Selected] forState:UIControlStateNormal];
    [[[self mainMenu] difficultyButtonNormal] setBackgroundImage:[self normalButtonImage] forState:UIControlStateNormal];
    [[[self mainMenuInProgressGame] theNewGameButton] setBackgroundImage:[self theNewGameButtonImage_Easy] forState:UIControlStateNormal];
    [[[self mainMenuInProgressGame] difficultyButtonEasy] setBackgroundImage:[self easyButtonImage_Selected] forState:UIControlStateNormal];
    [[[self mainMenuInProgressGame] difficultyButtonNormal] setBackgroundImage:[self normalButtonImage] forState:UIControlStateNormal];
}

- (void)displayDifficultyNormal
{
    [[[self mainMenu] theNewGameButton] setBackgroundImage:[self theNewGameButtonImage_Normal] forState:UIControlStateNormal];
    [[[self mainMenu] difficultyButtonEasy] setBackgroundImage:[self easyButtonImage] forState:UIControlStateNormal];
    [[[self mainMenu] difficultyButtonNormal] setBackgroundImage:[self normalButtonImage_Selected] forState:UIControlStateNormal];
    [[[self mainMenuInProgressGame] theNewGameButton] setBackgroundImage:[self theNewGameButtonImage_Normal] forState:UIControlStateNormal];
    [[[self mainMenuInProgressGame] difficultyButtonEasy] setBackgroundImage:[self easyButtonImage] forState:UIControlStateNormal];
    [[[self mainMenuInProgressGame] difficultyButtonNormal] setBackgroundImage:[self normalButtonImage_Selected] forState:UIControlStateNormal];
}

#pragma mark -
#pragma mark Sound Display Methods

- (void)displaySoundOn
{
    [[[self mainMenu] soundButton] setImage:[self soundOnImage] forState:UIControlStateNormal];
    [[[self mainMenuInProgressGame] soundButton] setImage:[self soundOnImage] forState:UIControlStateNormal];
}

- (void)displaySoundOff
{
    [[[self mainMenu] soundButton] setImage:[self soundOffImage] forState:UIControlStateNormal];
    [[[self mainMenuInProgressGame] soundButton] setImage:[self soundOffImage] forState:UIControlStateNormal];
}

#pragma mark -
#pragma mark MainMenu Button Actions

- (void)mainMenu_NewGameButtonTapped
{
    [[self delegate] playBubbleTapSound];
    [[self delegate] newGame];
}

- (void)mainMenu_DifficultyEasyButtonTapped
{
    [[self delegate] playBubbleTapSound];
    [self displayDifficultyEasy];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"EasyDifficulty"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)mainMenu_DifficultyNormalButtonTapped
{
    [[self delegate] playBubbleTapSound];
    [self displayDifficultyNormal];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"EasyDifficulty"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)mainMenu_HighScoresButtonTapped
{
    [[self delegate] playBubbleTapSound];
    [[self delegate] showHighScoresMenu];
}

- (void)mainMenu_HowToPlayButtonTapped
{
    [[self delegate] playBubbleTapSound];
    [[self delegate] showHowToPlayMenu];
}

- (void)mainMenu_SoundButtonTapped
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"SoundEnabled"] == YES)
    {
        [self displaySoundOff];
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"SoundEnabled"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [[self delegate] stopAllSounds];
    }
    else
    {
        [self displaySoundOn];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"SoundEnabled"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [[self delegate] playBubbleTapSound];
    }
}

- (void)mainMenu_goVertexButtonTapped
{
    [[self delegate] playBubbleTapSound];
    [[self delegate] showGoVertexView];
}

#pragma mark -
#pragma mark MainMenuInProgressGame Button Actions

- (void)mainMenuInProgressGame_ResumeGameButtonTapped
{
    [[self delegate] playBubbleTapSound];
    [[self delegate] resumeGame];
}

- (void)mainMenuInProgressGame_NewGameButtonTapped
{
    [[self delegate] playBubbleTapSound];
    [[self delegate] newGame];
}

- (void)mainMenuInProgressGame_DifficultyEasyButtonTapped
{
    [[self delegate] playBubbleTapSound];
    [self displayDifficultyEasy];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"EasyDifficulty"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)mainMenuInProgressGame_DifficultyNormalButtonTapped
{
    [[self delegate] playBubbleTapSound];
    [self displayDifficultyNormal];
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"EasyDifficulty"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)mainMenuInProgressGame_HighScoresButtonTapped
{
    [[self delegate] playBubbleTapSound];
    [[self delegate] showHighScoresMenu];
}

- (void)mainMenuInProgressGame_HowToPlayButtonTapped
{
    [[self delegate] playBubbleTapSound];
    [[self delegate] showHowToPlayMenu];
}

- (void)mainMenuInProgressGame_SoundButtonTapped
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"SoundEnabled"] == YES)
    {
        [self displaySoundOff];
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"SoundEnabled"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    else
    {
        [self displaySoundOn];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"SoundEnabled"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [[self delegate] playBubbleTapSound];
    }
}

- (void)mainMenuInProgressGame_goVertexButtonTapped
{
    [[self delegate] playBubbleTapSound];
    [[self delegate] showGoVertexView];
}

#pragma mark -
#pragma mark HighScoresMenu Button Actions

- (void)highScoresMenu_MainMenuButtonTapped
{
    [[self delegate] playBubbleTapSound];
    [[self delegate] showMainMenuFromMenu];
}

- (void)highScoresMenu_HighScoresTabButtonTapped
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        [[[self highScoresMenu] highScoresTabButton] setBackgroundImage:[UIImage imageNamed:@"Seaquations-BoardTabLeftSelectedHD.png"] forState:UIControlStateNormal];
        [[[self highScoresMenu] gameStatsTabButton] setBackgroundImage:[UIImage imageNamed:@"Seaquations-BoardTabRightUnselectedHD.png"] forState:UIControlStateNormal];
    }
    else
    {
        [[[self highScoresMenu] highScoresTabButton] setBackgroundImage:[UIImage imageNamed:@"Seaquations-BoardTabLeftSelected.png"] forState:UIControlStateNormal];
        [[[self highScoresMenu] gameStatsTabButton] setBackgroundImage:[UIImage imageNamed:@"Seaquations-BoardTabRightUnselected.png"] forState:UIControlStateNormal];
    }
    [[[self highScoresMenu] totalGamesPlayedTextLabel] setHidden:YES];
    [[[self highScoresMenu] totalGamesPlayedValueLabel] setHidden:YES];
    [[[self highScoresMenu] totalEquationsCreatedTextLabel] setHidden:YES];
    [[[self highScoresMenu] totalEquationsCreatedValueLabel] setHidden:YES];
    [[[self highScoresMenu] totalTimePlayedTextLabel] setHidden:YES];
    [[[self highScoresMenu] totalTimePlayedValueLabel] setHidden:YES];
    [[[self highScoresMenu] boardTitleLabel] setText:@"High Scores"];
    [[[self highScoresMenu] highScoresTableView] setHidden:NO];
}

- (void)highScoresMenu_GameStatsTabButtonTapped
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        [[[self highScoresMenu] gameStatsTabButton] setBackgroundImage:[UIImage imageNamed:@"Seaquations-BoardTabRightSelectedHD.png"] forState:UIControlStateNormal];
        [[[self highScoresMenu] highScoresTabButton] setBackgroundImage:[UIImage imageNamed:@"Seaquations-BoardTabLeftUnselectedHD.png"] forState:UIControlStateNormal];
    }
    else
    {
        [[[self highScoresMenu] gameStatsTabButton] setBackgroundImage:[UIImage imageNamed:@"Seaquations-BoardTabRightSelected.png"] forState:UIControlStateNormal];
        [[[self highScoresMenu] highScoresTabButton] setBackgroundImage:[UIImage imageNamed:@"Seaquations-BoardTabLeftUnselected.png"] forState:UIControlStateNormal];
    }
    [[[self highScoresMenu] highScoresTableView] setHidden:YES];
    [[[self highScoresMenu] boardTitleLabel] setText:@"Game Stats"];
    [[[self highScoresMenu] totalGamesPlayedTextLabel] setHidden:NO];
    [[[self highScoresMenu] totalGamesPlayedValueLabel] setHidden:NO];
    [[[self highScoresMenu] totalEquationsCreatedTextLabel] setHidden:NO];
    [[[self highScoresMenu] totalEquationsCreatedValueLabel] setHidden:NO];
    [[[self highScoresMenu] totalTimePlayedTextLabel] setHidden:NO];
    [[[self highScoresMenu] totalTimePlayedValueLabel] setHidden:NO];
}

#pragma mark -
#pragma mark HowToPlayMenu Button Actions

- (void)howToPlayMenu_MainMenuButtonTapped
{
    [[self delegate] playBubbleTapSound];
    [[self delegate] showMainMenuFromMenu];
}

- (void)pageControlTapped
{
    if ([[[self howToPlayMenu] howToPlayPageControl] currentPage] == 0)
        [[[self howToPlayMenu] howToPlayScrollView] setContentOffset:CGPointMake(0, 0) animated:YES];
    else if ([[[self howToPlayMenu] howToPlayPageControl] currentPage] == 1)
        [[[self howToPlayMenu] howToPlayScrollView] setContentOffset:CGPointMake(240, 0) animated:YES];
    else if ([[[self howToPlayMenu] howToPlayPageControl] currentPage] == 2)
        [[[self howToPlayMenu] howToPlayScrollView] setContentOffset:CGPointMake(480, 0) animated:YES];
    else if ([[[self howToPlayMenu] howToPlayPageControl] currentPage] == 3)
        [[[self howToPlayMenu] howToPlayScrollView] setContentOffset:CGPointMake(720, 0) animated:YES];
}

#pragma mark -
#pragma mark PostGameMenu Button Actions

- (void)postGameMenu_PlayAgainButtonTapped
{
    [[self delegate] playBubbleTapSound];
    [[self delegate] newGame];
}

- (void)postGameMenu_MainMenuButtonTapped
{
    [[self delegate] playBubbleTapSound];
    [[self delegate] showMainMenuFromMenu];
}

#pragma mark -
#pragma mark PostGameNewHighScoreMenu Button Actions

- (void)postGameNewHighScoreMenu_PlayAgainButtonTapped
{
    [[self delegate] playBubbleTapSound];
    // Save the high score name
    NSString *nameForHighScore = [[[self postGameMenuNewHighScore] highScoreNameTextField] text];
    if ([nameForHighScore length] == 0)
        nameForHighScore = @"Anonymous";
    [[self delegate] recordCurrentHighScoreWithName:nameForHighScore];
    // Start the new game
    [[self delegate] newGame];
}

- (void)postGameNewHighScoreMenu_MainMenuButtonTapped
{
    [[self delegate] playBubbleTapSound];
    // Save the high score name
    NSString *nameForHighScore = [[[self postGameMenuNewHighScore] highScoreNameTextField] text];
    if ([nameForHighScore length] == 0)
        nameForHighScore = @"Anonymous";
    [[self delegate] recordCurrentHighScoreWithName:nameForHighScore];
    // Show Main Menu
    [[self delegate] showMainMenuFromMenu];
}

#pragma mark -
#pragma mark TableView Data Source Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView*)argTableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView*)argTableView numberOfRowsInSection:(NSInteger)argSection
{
    return 10;
}

- (UITableViewCell*)tableView:(UITableView*)argTableView cellForRowAtIndexPath:(NSIndexPath*)argIndexPath
{
    UITableViewCell *cell = [argTableView dequeueReusableCellWithIdentifier:@"HighScoreCellIdentifier"];
    if (!cell)
    {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"HighScoreCellIdentifier"] autorelease];
        [cell setOpaque:NO];
        [cell setBackgroundColor:[UIColor clearColor]];
        [[cell textLabel] setTextColor:[UIColor whiteColor]];
        [[cell textLabel] setFont:[UIFont systemFontOfSize:16.0f]];
        [[cell detailTextLabel] setTextColor:[UIColor whiteColor]];
        [[cell detailTextLabel] setFont:[UIFont boldSystemFontOfSize:16.0f]];
    }
    NSDictionary *highScoreRecord = [[[self delegate] highScoresArray] objectAtIndex:[argIndexPath row]];
    if ([[highScoreRecord valueForKey:@"Score"] integerValue] == 0)
    {
        // Display No High Scores for first record
        if ([argIndexPath row] == 0)
            [[cell textLabel] setText:@"1.  No High Scores"];
        else
            [[cell textLabel] setText:[NSString stringWithFormat:@"%d.  %@", [argIndexPath row] + 1, [highScoreRecord valueForKey:@"PlayerName"]]];
        [[cell detailTextLabel] setText:@""];
    }
    else
    {
        [[cell textLabel] setText:[NSString stringWithFormat:@"%d.  %@", [argIndexPath row] + 1, [highScoreRecord valueForKey:@"PlayerName"]]];
        [[cell detailTextLabel] setText:[NSString stringWithFormat:@"%d", [[highScoreRecord valueForKey:@"Score"] integerValue]]];
    }
    return cell;
}

#pragma mark -
#pragma mark UITextField Delegate Methods

- (BOOL)textFieldShouldReturn:(UITextField*)argTextField
{
    [argTextField resignFirstResponder];
    return YES;
}

#pragma mark -
#pragma mark ScrollView Delegate Methods

- (void)scrollViewDidScroll:(UIScrollView*)argScrollView
{
    if ([argScrollView tag] == kHowToPlayScrollView)
    {
        if ([argScrollView contentOffset].x <= 120)
            [[[self howToPlayMenu] howToPlayPageControl] setCurrentPage:0];
        else if ([argScrollView contentOffset].x <= 360)
            [[[self howToPlayMenu] howToPlayPageControl] setCurrentPage:1];
        else if ([argScrollView contentOffset].x <= 600)
            [[[self howToPlayMenu] howToPlayPageControl] setCurrentPage:2];
        else
            [[[self howToPlayMenu] howToPlayPageControl] setCurrentPage:3]; 
    }
}

#pragma mark -
#pragma mark Properties
// Delegate
@synthesize delegate;
// Menu State
@synthesize currentMenuState;

@end
