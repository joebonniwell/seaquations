//
//  SeaquationsMenuView_PostGameMenu.m
//  seaquations
//
//  Created by goVertex on 10/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SeaquationsMenuView_PostGameMenu.h"

@implementation SeaquationsMenuView_PostGameMenu

- (id)initWithFrame:(CGRect)argFrame delegate:(id)argDelegate
{
    self = [super initWithFrame:argFrame];
    if (self) 
    {
        [self setDelegate:argDelegate];
        // BoardView
        UIImageView *tempBoardView;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempBoardView = [[UIImageView alloc] initWithFrame:CGRectMake(kPostGameMenu_BoardX_iPad, kPostGameMenu_BoardY_iPad, kPostGameMenu_BoardWidth_iPad, kPostGameMenu_BoardHeight_iPad)];
            [tempBoardView setImage:[UIImage imageNamed:@"Seaquations-BoardHD.png"]];
        }
        else
        {
            tempBoardView = [[UIImageView alloc] initWithFrame:CGRectMake(kPostGameMenu_BoardX_iPhone, kPostGameMenu_BoardY_iPhone, kPostGameMenu_BoardWidth_iPhone, kPostGameMenu_BoardHeight_iPhone)];
            [tempBoardView setImage:[UIImage imageNamed:@"Seaquations-Board.png"]];
        }
        [self addSubview:tempBoardView];
        // Good Job Label
        UILabel *tempGoodJobLabel;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempGoodJobLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPostGameMenu_GoodJobLabelX_iPad, kPostGameMenu_GoodJobLabelY_iPad, kPostGameMenu_GoodJobLabelWidth_iPad, kPostGameMenu_GoodJobLabelHeight_iPad)];
            [tempGoodJobLabel setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            tempGoodJobLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPostGameMenu_GoodJobLabelX_iPhone, kPostGameMenu_GoodJobLabelY_iPhone, kPostGameMenu_GoodJobLabelWidth_iPhone, kPostGameMenu_GoodJobLabelHeight_iPhone)];
            [tempGoodJobLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempGoodJobLabel setTextAlignment:UITextAlignmentCenter];
        [tempGoodJobLabel setTextColor:[UIColor whiteColor]];
        [tempGoodJobLabel setOpaque:NO];
        [tempGoodJobLabel setBackgroundColor:[UIColor clearColor]];
        [tempGoodJobLabel setText:@"Good Job!"];
        [self addSubview:tempGoodJobLabel];
        [tempGoodJobLabel release];
        // Game Score Text Label
        UILabel *tempGameScoreTextLabel;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempGameScoreTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPostGameMenu_GameScoreTextLabelX_iPad, kPostGameMenu_GameScoreTextLabelY_iPad, kPostGameMenu_GameScoreTextLabelWidth_iPad, kPostGameMenu_GameScoreTextLabelHeight_iPad)];
            [tempGameScoreTextLabel setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            tempGameScoreTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPostGameMenu_GameScoreTextLabelX_iPhone, kPostGameMenu_GameScoreTextLabelY_iPhone, kPostGameMenu_GameScoreTextLabelWidth_iPhone, kPostGameMenu_GameScoreTextLabelHeight_iPhone)];
            [tempGameScoreTextLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempGameScoreTextLabel setTextColor:[UIColor whiteColor]];
        [tempGameScoreTextLabel setText:@"Game Score"];
        [tempGameScoreTextLabel setOpaque:NO];
        [tempGameScoreTextLabel setBackgroundColor:[UIColor clearColor]];
        [self addSubview:tempGameScoreTextLabel];
        [tempGameScoreTextLabel release];
        // Game Score Value Label
        UILabel *tempGameScoreValueLabel;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempGameScoreValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPostGameMenu_GameScoreValueLabelX_iPad, kPostGameMenu_GameScoreValueLabelY_iPad, kPostGameMenu_GameScoreValueLabelWidth_iPad, kPostGameMenu_GameScoreValueLabelHeight_iPad)];
            [tempGameScoreValueLabel setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            tempGameScoreValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPostGameMenu_GameScoreValueLabelX_iPhone, kPostGameMenu_GameScoreValueLabelY_iPhone, kPostGameMenu_GameScoreValueLabelWidth_iPhone, kPostGameMenu_GameScoreValueLabelHeight_iPhone)];
            [tempGameScoreValueLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempGameScoreValueLabel setTextColor:[UIColor whiteColor]];
        [tempGameScoreValueLabel setTextAlignment:UITextAlignmentRight];
        [tempGameScoreValueLabel setText:@"0"];
        [tempGameScoreValueLabel setOpaque:NO];
        [tempGameScoreValueLabel setBackgroundColor:[UIColor clearColor]];
        [self addSubview:tempGameScoreValueLabel];
        [self setGameScoreValueLabel:tempGameScoreValueLabel];
        [tempGameScoreValueLabel release];
        // Game Equations Created Text Label
        UILabel *tempGameEquationsTextLabel;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempGameEquationsTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPostGameMenu_GameEquationsTextLabelX_iPad, kPostGameMenu_GameEquationsTextLabelY_iPad, kPostGameMenu_GameEquationsTextLabelWidth_iPad, kPostGameMenu_GameEquationsTextLabelHeight_iPad)];
            [tempGameEquationsTextLabel setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            tempGameEquationsTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPostGameMenu_GameEquationsTextLabelX_iPhone, kPostGameMenu_GameEquationsTextLabelY_iPhone, kPostGameMenu_GameEquationsTextLabelWidth_iPhone, kPostGameMenu_GameEquationsTextLabelHeight_iPhone)];
            [tempGameEquationsTextLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempGameEquationsTextLabel setTextColor:[UIColor whiteColor]];
        [tempGameEquationsTextLabel setText:@"Equations Created"];
        [tempGameEquationsTextLabel setOpaque:NO];
        [tempGameEquationsTextLabel setBackgroundColor:[UIColor clearColor]];
        [self addSubview:tempGameEquationsTextLabel];
        [tempGameEquationsTextLabel release];
        // Game Equations Created Value Label
        UILabel *tempGameEquationsValueLabel;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempGameEquationsValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPostGameMenu_GameEquationsValueLabelX_iPad, kPostGameMenu_GameEquationsValueLabelY_iPad, kPostGameMenu_GameEquationsValueLabelWidth_iPad, kPostGameMenu_GameEquationsValueLabelHeight_iPad)];
            [tempGameEquationsValueLabel setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            tempGameEquationsValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPostGameMenu_GameEquationsValueLabelX_iPhone, kPostGameMenu_GameEquationsValueLabelY_iPhone, kPostGameMenu_GameEquationsValueLabelWidth_iPhone, kPostGameMenu_GameEquationsValueLabelHeight_iPhone)];
            [tempGameEquationsValueLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempGameEquationsValueLabel setTextColor:[UIColor whiteColor]];
        [tempGameEquationsValueLabel setTextAlignment:UITextAlignmentRight];
        [tempGameEquationsValueLabel setText:@"0"];
        [tempGameEquationsValueLabel setOpaque:NO];
        [tempGameEquationsValueLabel setBackgroundColor:[UIColor clearColor]];
        [self addSubview:tempGameEquationsValueLabel];
        [self setGameEquationsValueLabel:tempGameEquationsValueLabel];
        [tempGameEquationsValueLabel release];
        // Total Game Time Text Label
        UILabel *tempGameTimeTextLabel;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempGameTimeTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPostGameMenu_GameTimeTextLabelX_iPad, kPostGameMenu_GameTimeTextLabelY_iPad, kPostGameMenu_GameTimeTextLabelWidth_iPad, kPostGameMenu_GameTimeTextLabelHeight_iPad)];
            [tempGameTimeTextLabel setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            tempGameTimeTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPostGameMenu_GameTimeTextLabelX_iPhone, kPostGameMenu_GameTimeTextLabelY_iPhone, kPostGameMenu_GameTimeTextLabelWidth_iPhone, kPostGameMenu_GameTimeTextLabelHeight_iPhone)];
            [tempGameTimeTextLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempGameTimeTextLabel setTextColor:[UIColor whiteColor]];
        [tempGameTimeTextLabel setText:@"Game Length"];
        [tempGameTimeTextLabel setOpaque:NO];
        [tempGameTimeTextLabel setBackgroundColor:[UIColor clearColor]];
        [self addSubview:tempGameTimeTextLabel];
        [tempGameTimeTextLabel release];
        // Total Game Time Value Label
        UILabel *tempGameTimeValueLabel;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempGameTimeValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPostGameMenu_GameTimeValueLabelX_iPad, kPostGameMenu_GameTimeValueLabelY_iPad, kPostGameMenu_GameTimeValueLabelWidth_iPad, kPostGameMenu_GameTimeValueLabelHeight_iPad)];
            [tempGameTimeValueLabel setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            tempGameTimeValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPostGameMenu_GameTimeValueLabelX_iPhone, kPostGameMenu_GameTimeValueLabelY_iPhone, kPostGameMenu_GameTimeValueLabelWidth_iPhone, kPostGameMenu_GameTimeValueLabelHeight_iPhone)];
            [tempGameTimeValueLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempGameTimeValueLabel setTextColor:[UIColor whiteColor]];
        [tempGameTimeValueLabel setTextAlignment:UITextAlignmentRight];
        [tempGameTimeValueLabel setText:@"0:00"];
        [tempGameTimeValueLabel setOpaque:NO];
        [tempGameTimeValueLabel setBackgroundColor:[UIColor clearColor]];
        [self addSubview:tempGameTimeValueLabel];
        [self setGameTimeValueLabel:tempGameTimeValueLabel];
        [tempGameTimeValueLabel release];
        // Play Again Button
        UIButton *tempPlayAgainButton = [UIButton buttonWithType:UIButtonTypeCustom];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            [tempPlayAgainButton setFrame:CGRectMake(kPostGameMenu_PlayAgainButtonX_iPad, kPostGameMenu_PlayAgainButtonY_iPad, kPostGameMenu_PlayAgainButtonWidth_iPad, kPostGameMenu_PlayAgainButtonHeight_iPad)];
            [[tempPlayAgainButton titleLabel] setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            [tempPlayAgainButton setFrame:CGRectMake(kPostGameMenu_PlayAgainButtonX_iPhone, kPostGameMenu_PlayAgainButtonY_iPhone, kPostGameMenu_PlayAgainButtonWidth_iPhone, kPostGameMenu_PlayAgainButtonHeight_iPhone)];
            [[tempPlayAgainButton titleLabel] setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempPlayAgainButton addTarget:[self delegate] action:@selector(postGameMenu_PlayAgainButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [tempPlayAgainButton setTitle:@"Play Again" forState:UIControlStateNormal];
        [tempPlayAgainButton setBackgroundImage:[[self delegate] bubbleButtonImageLarge] forState:UIControlStateNormal];
        [self addSubview:tempPlayAgainButton];
        // Main Menu Button
        UIButton *tempMainMenuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            [tempMainMenuButton setFrame:CGRectMake(kPostGameMenu_MainMenuButtonX_iPad, kPostGameMenu_MainMenuButtonY_iPad, kPostGameMenu_MainMenuButtonWidth_iPad, kPostGameMenu_MainMenuButtonHeight_iPad)];
            [[tempMainMenuButton titleLabel] setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            [tempMainMenuButton setFrame:CGRectMake(kPostGameMenu_MainMenuButtonX_iPhone, kPostGameMenu_MainMenuButtonY_iPhone, kPostGameMenu_MainMenuButtonWidth_iPhone, kPostGameMenu_MainMenuButtonHeight_iPhone)];
            [[tempMainMenuButton titleLabel] setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempMainMenuButton addTarget:[self delegate] action:@selector(postGameMenu_MainMenuButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [tempMainMenuButton setTitle:@"Main Menu" forState:UIControlStateNormal];
        [tempMainMenuButton setBackgroundImage:[[self delegate] bubbleButtonImageLarge] forState:UIControlStateNormal];
        [self addSubview:tempMainMenuButton];
    }
    return self;
}

- (void)dealloc
{
    [self setGameScoreValueLabel:nil];
    [self setGameTimeValueLabel:nil];
    [self setGameEquationsValueLabel:nil];
    [super dealloc];
}

@synthesize delegate;
// Data Fields
@synthesize gameScoreValueLabel;
@synthesize gameTimeValueLabel;
@synthesize gameEquationsValueLabel;
@end
