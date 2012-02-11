//
//  SeaquationsMenuView_PostGameMenuNewHighScore.m
//  seaquations
//
//  Created by goVertex on 10/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SeaquationsMenuView_PostGameMenuNewHighScore.h"

@implementation SeaquationsMenuView_PostGameMenuNewHighScore

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
            tempBoardView = [[UIImageView alloc] initWithFrame:CGRectMake(kPostGameNewHighScoreMenu_BoardX_iPad, kPostGameNewHighScoreMenu_BoardY_iPad, kPostGameNewHighScoreMenu_BoardWidth_iPad, kPostGameNewHighScoreMenu_BoardHeight_iPad)];
            [tempBoardView setImage:[UIImage imageNamed:@"Seaquations-BoardHD.png"]];
        }
        else
        {
            tempBoardView = [[UIImageView alloc] initWithFrame:CGRectMake(kPostGameNewHighScoreMenu_BoardX_iPhone, kPostGameNewHighScoreMenu_BoardY_iPhone, kPostGameNewHighScoreMenu_BoardWidth_iPhone, kPostGameNewHighScoreMenu_BoardHeight_iPhone)];
            [tempBoardView setImage:[UIImage imageNamed:@"Seaquations-Board.png"]];
        }
        [self addSubview:tempBoardView];
        // Congratulations Banner
        UILabel *tempCongratulationsLabel;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempCongratulationsLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPostGameNewHighScoreMenu_CongratulationsLabelX_iPad, kPostGameNewHighScoreMenu_CongratulationsLabelY_iPad, kPostGameNewHighScoreMenu_CongratulationsLabelWidth_iPad, kPostGameNewHighScoreMenu_CongratulationsLabelHeight_iPad)];
            [tempCongratulationsLabel setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            tempCongratulationsLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPostGameNewHighScoreMenu_CongratulationsLabelX_iPhone, kPostGameNewHighScoreMenu_CongratulationsLabelY_iPhone, kPostGameNewHighScoreMenu_CongratulationsLabelWidth_iPhone, kPostGameNewHighScoreMenu_CongratulationsLabelHeight_iPhone)];
            [tempCongratulationsLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempCongratulationsLabel setTextColor:[UIColor whiteColor]];
        [tempCongratulationsLabel setTextAlignment:UITextAlignmentCenter];
        [tempCongratulationsLabel setText:@"New High Score!"];
        [tempCongratulationsLabel setBackgroundColor:[UIColor clearColor]];
        [tempCongratulationsLabel setOpaque:NO];
        [self addSubview:tempCongratulationsLabel];
        [tempCongratulationsLabel release];
        // High Score Place Label
        UILabel *tempHighScorePlaceLabel;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempHighScorePlaceLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPostGameNewHighScoreMenu_HighScorePlaceLabelX_iPad, kPostGameNewHighScoreMenu_HighScorePlaceLabelY_iPad, kPostGameNewHighScoreMenu_HighScorePlaceLabelWidth_iPad, kPostGameNewHighScoreMenu_HighScorePlaceLabelHeight_iPad)];
            [tempHighScorePlaceLabel setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            tempHighScorePlaceLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPostGameNewHighScoreMenu_HighScorePlaceLabelX_iPhone, kPostGameNewHighScoreMenu_HighScorePlaceLabelY_iPhone, kPostGameNewHighScoreMenu_HighScorePlaceLabelWidth_iPhone, kPostGameNewHighScoreMenu_HighScorePlaceLabelHeight_iPhone)];
            [tempHighScorePlaceLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempHighScorePlaceLabel setTextColor:[UIColor whiteColor]];
        [tempHighScorePlaceLabel setText:@"1."];
        [tempHighScorePlaceLabel setOpaque:NO];
        [tempHighScorePlaceLabel setBackgroundColor:[UIColor clearColor]];
        [self addSubview:tempHighScorePlaceLabel];
        [self setHighScorePlaceLabel:tempHighScorePlaceLabel];
        [tempHighScorePlaceLabel release];
        // High Score Name TextField
        UITextField *tempHighScoreNameTextField;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempHighScoreNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(kPostGameNewHighScoreMenu_HighScoreNameTextFieldX_iPad, kPostGameNewHighScoreMenu_HighScoreNameTextFieldY_iPad, kPostGameNewHighScoreMenu_HighScoreNameTextFieldWidth_iPad, kPostGameNewHighScoreMenu_HighScoreNameTextFieldHeight_iPad)];
            [tempHighScoreNameTextField setFont:[UIFont systemFontOfSize:36.0f]];
            [tempHighScoreNameTextField setBackground:[UIImage imageNamed:@"Seaquations-BoardTextFieldInsetHD.png"]];
        }
        else
        {
            tempHighScoreNameTextField = [[UITextField alloc] initWithFrame:CGRectMake(kPostGameNewHighScoreMenu_HighScoreNameTextFieldX_iPhone, kPostGameNewHighScoreMenu_HighScoreNameTextFieldY_iPhone, kPostGameNewHighScoreMenu_HighScoreNameTextFieldWidth_iPhone, kPostGameNewHighScoreMenu_HighScoreNameTextFieldHeight_iPhone)];
            [tempHighScoreNameTextField setFont:[UIFont systemFontOfSize:18.0f]];
            [tempHighScoreNameTextField setBackground:[UIImage imageNamed:@"Seaquations-BoardTextFieldInset.png"]];
        }
        [tempHighScoreNameTextField setTextColor:[UIColor whiteColor]];
        [tempHighScoreNameTextField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [tempHighScoreNameTextField setTextAlignment:UITextAlignmentCenter];
        [tempHighScoreNameTextField setText:@"Anonymous"];
        [tempHighScoreNameTextField setClearsOnBeginEditing:YES];
        [tempHighScoreNameTextField setDelegate:argDelegate];
        [self addSubview:tempHighScoreNameTextField];
        [self setHighScoreNameTextField:tempHighScoreNameTextField];
        [tempHighScoreNameTextField release];
        // High Score Score
        UILabel *tempHighScoreValueLabel;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempHighScoreValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPostGameNewHighScoreMenu_HighScoreValueLabelX_iPad, kPostGameNewHighScoreMenu_HighScoreValueLabelY_iPad, kPostGameNewHighScoreMenu_HighScoreValueLabelWidth_iPad, kPostGameNewHighScoreMenu_HighScoreValueLabelHeight_iPad)];
            [tempHighScoreValueLabel setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            tempHighScoreValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPostGameNewHighScoreMenu_HighScoreValueLabelX_iPhone, kPostGameNewHighScoreMenu_HighScoreValueLabelY_iPhone, kPostGameNewHighScoreMenu_HighScoreValueLabelWidth_iPhone, kPostGameNewHighScoreMenu_HighScoreValueLabelHeight_iPhone)];
            [tempHighScoreValueLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempHighScoreValueLabel setTextColor:[UIColor whiteColor]];
        [tempHighScoreValueLabel setTextAlignment:UITextAlignmentRight];
        [tempHighScoreValueLabel setText:@"0"];
        [tempHighScoreValueLabel setOpaque:NO];
        [tempHighScoreValueLabel setBackgroundColor:[UIColor clearColor]];
        [self addSubview:tempHighScoreValueLabel];
        [self setHighScoreValueLabel:tempHighScoreValueLabel];
        [tempHighScoreValueLabel release];
        // Game Equations Text Label
        UILabel *tempGameEquationsTextLabel;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempGameEquationsTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPostGameNewHighScoreMenu_GameEquationsTextLabelX_iPad, kPostGameNewHighScoreMenu_GameEquationsTextLabelY_iPad, kPostGameNewHighScoreMenu_GameEquationsTextLabelWidth_iPad, kPostGameNewHighScoreMenu_GameEquationsTextLabelHeight_iPad)];
            [tempGameEquationsTextLabel setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            tempGameEquationsTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPostGameNewHighScoreMenu_GameEquationsTextLabelX_iPhone, kPostGameNewHighScoreMenu_GameEquationsTextLabelY_iPhone, kPostGameNewHighScoreMenu_GameEquationsTextLabelWidth_iPhone, kPostGameNewHighScoreMenu_GameEquationsTextLabelHeight_iPhone)];
            [tempGameEquationsTextLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempGameEquationsTextLabel setTextColor:[UIColor whiteColor]];
        [tempGameEquationsTextLabel setText:@"Equations Created"];
        [tempGameEquationsTextLabel setOpaque:NO];
        [tempGameEquationsTextLabel setBackgroundColor:[UIColor clearColor]];
        [self addSubview:tempGameEquationsTextLabel];
        [tempGameEquationsTextLabel release];
        // Game Equations Value Label
        UILabel *tempGameEquationsValueLabel;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempGameEquationsValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPostGameNewHighScoreMenu_GameEquationsValueLabelX_iPad, kPostGameNewHighScoreMenu_GameEquationsValueLabelY_iPad, kPostGameNewHighScoreMenu_GameEquationsValueLabelWidth_iPad, kPostGameNewHighScoreMenu_GameEquationsValueLabelHeight_iPad)];
            [tempGameEquationsValueLabel setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            tempGameEquationsValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPostGameNewHighScoreMenu_GameEquationsValueLabelX_iPhone, kPostGameNewHighScoreMenu_GameEquationsValueLabelY_iPhone, kPostGameNewHighScoreMenu_GameEquationsValueLabelWidth_iPhone, kPostGameNewHighScoreMenu_GameEquationsValueLabelHeight_iPhone)];
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
        // Game Time Text Label
        UILabel *tempGameTimeTextLabel;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempGameTimeTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPostGameNewHighScoreMenu_GameTimeTextLabelX_iPad, kPostGameNewHighScoreMenu_GameTimeTextLabelY_iPad, kPostGameNewHighScoreMenu_GameTimeTextLabelWidth_iPad, kPostGameNewHighScoreMenu_GameTimeTextLabelHeight_iPad)];
            [tempGameTimeTextLabel setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            tempGameTimeTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPostGameNewHighScoreMenu_GameTimeTextLabelX_iPhone, kPostGameNewHighScoreMenu_GameTimeTextLabelY_iPhone, kPostGameNewHighScoreMenu_GameTimeTextLabelWidth_iPhone, kPostGameNewHighScoreMenu_GameTimeTextLabelHeight_iPhone)];
            [tempGameTimeTextLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempGameTimeTextLabel setTextColor:[UIColor whiteColor]];
        [tempGameTimeTextLabel setText:@"Game Length"];
        [tempGameTimeTextLabel setOpaque:NO];
        [tempGameTimeTextLabel setBackgroundColor:[UIColor clearColor]];
        [self addSubview:tempGameTimeTextLabel];
        [tempGameTimeTextLabel release];
        // Game Time Value Label
        UILabel *tempGameTimeValueLabel;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempGameTimeValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPostGameNewHighScoreMenu_GameTimeValueLabelX_iPad, kPostGameNewHighScoreMenu_GameTimeValueLabelY_iPad, kPostGameNewHighScoreMenu_GameTimeValueLabelWidth_iPad, kPostGameNewHighScoreMenu_GameTimeValueLabelHeight_iPad)];
            [tempGameTimeValueLabel setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            tempGameTimeValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(kPostGameNewHighScoreMenu_GameTimeValueLabelX_iPhone, kPostGameNewHighScoreMenu_GameTimeValueLabelY_iPhone, kPostGameNewHighScoreMenu_GameTimeValueLabelWidth_iPhone, kPostGameNewHighScoreMenu_GameTimeValueLabelHeight_iPhone)];
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
            [tempPlayAgainButton setFrame:CGRectMake(kPostGameNewHighScoreMenu_PlayAgainButtonX_iPad, kPostGameNewHighScoreMenu_PlayAgainButtonY_iPad, kPostGameNewHighScoreMenu_PlayAgainButtonWidth_iPad, kPostGameNewHighScoreMenu_PlayAgainButtonHeight_iPad)];
            [[tempPlayAgainButton titleLabel] setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            [tempPlayAgainButton setFrame:CGRectMake(kPostGameNewHighScoreMenu_PlayAgainButtonX_iPhone, kPostGameNewHighScoreMenu_PlayAgainButtonY_iPhone, kPostGameNewHighScoreMenu_PlayAgainButtonWidth_iPhone, kPostGameNewHighScoreMenu_PlayAgainButtonHeight_iPhone)];
            [[tempPlayAgainButton titleLabel] setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempPlayAgainButton addTarget:[self delegate] action:@selector(postGameNewHighScoreMenu_PlayAgainButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [tempPlayAgainButton setTitle:@"Play Again" forState:UIControlStateNormal];
        [tempPlayAgainButton setBackgroundImage:[[self delegate] bubbleButtonImageLarge] forState:UIControlStateNormal];
        [self addSubview:tempPlayAgainButton];
        // Main Menu Button
        UIButton *tempMainMenuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            [tempMainMenuButton setFrame:CGRectMake(kPostGameNewHighScoreMenu_MainMenuButtonX_iPad, kPostGameNewHighScoreMenu_MainMenuButtonY_iPad, kPostGameNewHighScoreMenu_MainMenuButtonWidth_iPad, kPostGameNewHighScoreMenu_MainMenuButtonHeight_iPad)];
            [[tempMainMenuButton titleLabel] setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            [tempMainMenuButton setFrame:CGRectMake(kPostGameNewHighScoreMenu_MainMenuButtonX_iPhone, kPostGameNewHighScoreMenu_MainMenuButtonY_iPhone, kPostGameNewHighScoreMenu_MainMenuButtonWidth_iPhone, kPostGameNewHighScoreMenu_MainMenuButtonHeight_iPhone)];
            [[tempMainMenuButton titleLabel] setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempMainMenuButton addTarget:[self delegate] action:@selector(postGameNewHighScoreMenu_MainMenuButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [tempMainMenuButton setTitle:@"Main Menu" forState:UIControlStateNormal];
        [tempMainMenuButton setBackgroundImage:[[self delegate] bubbleButtonImageLarge] forState:UIControlStateNormal];
        [self addSubview:tempMainMenuButton];
    }
    return self;
}

- (void)dealloc
{
    [self setHighScorePlaceLabel:nil];
    [self setHighScoreNameTextField:nil];
    [self setHighScoreValueLabel:nil];
    [self setGameTimeValueLabel:nil];
    [self setGameEquationsValueLabel:nil];
    [super dealloc];
}

@synthesize delegate;
// Data Fields
@synthesize highScorePlaceLabel;
@synthesize highScoreNameTextField;
@synthesize highScoreValueLabel;
@synthesize gameTimeValueLabel;
@synthesize gameEquationsValueLabel;
@end
