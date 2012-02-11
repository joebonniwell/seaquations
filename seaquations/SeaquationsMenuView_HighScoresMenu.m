//
//  SeaquationsMenuView_HighScoresMenu.m
//  seaquations
//
//  Created by goVertex on 10/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SeaquationsMenuView_HighScoresMenu.h"

@implementation SeaquationsMenuView_HighScoresMenu

#pragma mark -
#pragma mark Lifecycle Methods

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
            tempBoardView = [[UIImageView alloc] initWithFrame:CGRectMake(kGVMenuView_HighScoresMenu_BoardImageViewX_iPad, kGVMenuView_HighScoresMenu_BoardImageViewY_iPad, kGVMenuView_HighScoresMenu_BoardImageViewWidth_iPad, kGVMenuView_HighScoresMenu_BoardImageViewHeight_iPad)];
            [tempBoardView setImage:[UIImage imageNamed:@"Seaquations-BoardTabbedHD.png"]];
        }
        else
        {
            tempBoardView = [[UIImageView alloc] initWithFrame:CGRectMake(kGVMenuView_HighScoresMenu_BoardImageViewX_iPhone, kGVMenuView_HighScoresMenu_BoardImageViewY_iPhone, kGVMenuView_HighScoresMenu_BoardImageViewWidth_iPhone, kGVMenuView_HighScoresMenu_BoardImageViewHeight_iPhone)];
            [tempBoardView setImage:[UIImage imageNamed:@"Seaquations-BoardTabbed.png"]];
        }
        [self addSubview:tempBoardView];
        // High Scores & Stats Title Label
        UILabel *tempBoardTitleLabel;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempBoardTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kGVMenuView_HighScoresMenu_HighScoresAndStatsTitleLabelX_iPad, kGVMenuView_HighScoresMenu_HighScoresAndStatsTitleLabelY_iPad, kGVMenuView_HighScoresMenu_HighScoresAndStatsTitleLabelWidth_iPad, kGVMenuView_HighScoresMenu_HighScoresAndStatsTitleLabelHeight_iPad)];
            [tempBoardTitleLabel setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            tempBoardTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(kGVMenuView_HighScoresMenu_HighScoresAndStatsTitleLabelX_iPhone, kGVMenuView_HighScoresMenu_HighScoresAndStatsTitleLabelY_iPhone, kGVMenuView_HighScoresMenu_HighScoresAndStatsTitleLabelWidth_iPhone, kGVMenuView_HighScoresMenu_HighScoresAndStatsTitleLabelHeight_iPhone)];
            [tempBoardTitleLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempBoardTitleLabel setTextColor:[UIColor whiteColor]];
        [tempBoardTitleLabel setText:@"High Scores"];
        [tempBoardTitleLabel setTextAlignment:UITextAlignmentCenter];
        [tempBoardTitleLabel setOpaque:NO];
        [tempBoardTitleLabel setBackgroundColor:[UIColor clearColor]];
        [self addSubview:tempBoardTitleLabel];
        [self setBoardTitleLabel:tempBoardTitleLabel];
        [tempBoardTitleLabel release];
        // High Scores TableView
        UITableView *tempHighScoresTableView;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempHighScoresTableView = [[UITableView alloc] initWithFrame:CGRectMake(kGVMenuView_HighScoresMenu_HighScoresTableViewX_iPad, kGVMenuView_HighScoresMenu_HighScoresTableViewY_iPad, kGVMenuView_HighScoresMenu_HighScoresTableViewWidth_iPad, kGVMenuView_HighScoresMenu_HighScoresTableViewHeight_iPad) style:UITableViewStylePlain];
            [tempHighScoresTableView setRowHeight:60.0f];
        }
        else
        {
            tempHighScoresTableView = [[UITableView alloc] initWithFrame:CGRectMake(kGVMenuView_HighScoresMenu_HighScoresTableViewX_iPhone, kGVMenuView_HighScoresMenu_HighScoresTableViewY_iPhone, kGVMenuView_HighScoresMenu_HighScoresTableViewWidth_iPhone, kGVMenuView_HighScoresMenu_HighScoresTableViewHeight_iPhone) style:UITableViewStylePlain];
            [tempHighScoresTableView setRowHeight:30.0f];
        }
        [tempHighScoresTableView setDelegate:[self delegate]];
        [tempHighScoresTableView setDataSource:[self delegate]];
        [tempHighScoresTableView setAllowsSelection:NO];
        [tempHighScoresTableView setBackgroundColor:[UIColor clearColor]];
        [tempHighScoresTableView setOpaque:NO];
        [tempHighScoresTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [self addSubview:tempHighScoresTableView];
        [self setHighScoresTableView:tempHighScoresTableView];
        [tempHighScoresTableView release];
        // Total Games Played Text Label
        UILabel *tempTotalGamesPlayedTextLabel;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempTotalGamesPlayedTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(kGVMenuView_HighScoresMenu_TotalGamesPlayedTextLabelX_iPad, kGVMenuView_HighScoresMenu_TotalGamesPlayedTextLabelY_iPad, kGVMenuView_HighScoresMenu_TotalGamesPlayedTextLabelWidth_iPad, kGVMenuView_HighScoresMenu_TotalGamesPlayedTextLabelHeight_iPad)];
            [tempTotalGamesPlayedTextLabel setFont:[UIFont boldSystemFontOfSize:28.0f]];
        }
        else
        {
            tempTotalGamesPlayedTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(kGVMenuView_HighScoresMenu_TotalGamesPlayedTextLabelX_iPhone, kGVMenuView_HighScoresMenu_TotalGamesPlayedTextLabelY_iPhone, kGVMenuView_HighScoresMenu_TotalGamesPlayedTextLabelWidth_iPhone, kGVMenuView_HighScoresMenu_TotalGamesPlayedTextLabelHeight_iPhone)];
            [tempTotalGamesPlayedTextLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
        }
        [tempTotalGamesPlayedTextLabel setTextColor:[UIColor whiteColor]];
        [tempTotalGamesPlayedTextLabel setText:@"Total Games Played"];
        [tempTotalGamesPlayedTextLabel setTextAlignment:UITextAlignmentLeft];
        [tempTotalGamesPlayedTextLabel setOpaque:NO];
        [tempTotalGamesPlayedTextLabel setBackgroundColor:[UIColor clearColor]];
        [tempTotalGamesPlayedTextLabel setHidden:YES];
        [self addSubview:tempTotalGamesPlayedTextLabel];
        [self setTotalGamesPlayedTextLabel:tempTotalGamesPlayedTextLabel];
        [tempTotalGamesPlayedTextLabel release];
        // Total Games Played Value Label
        UILabel *tempTotalGamesPlayedValueLabel;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempTotalGamesPlayedValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(kGVMenuView_HighScoresMenu_TotalGamesPlayedValueLabelX_iPad, kGVMenuView_HighScoresMenu_TotalGamesPlayedValueLabelY_iPad, kGVMenuView_HighScoresMenu_TotalGamesPlayedValueLabelWidth_iPad, kGVMenuView_HighScoresMenu_TotalGamesPlayedValueLabelHeight_iPad)];
            [tempTotalGamesPlayedValueLabel setFont:[UIFont boldSystemFontOfSize:28.0f]];
        }
        else
        {
            tempTotalGamesPlayedValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(kGVMenuView_HighScoresMenu_TotalGamesPlayedValueLabelX_iPhone, kGVMenuView_HighScoresMenu_TotalGamesPlayedValueLabelY_iPhone, kGVMenuView_HighScoresMenu_TotalGamesPlayedValueLabelWidth_iPhone, kGVMenuView_HighScoresMenu_TotalGamesPlayedValueLabelHeight_iPhone)];
            [tempTotalGamesPlayedValueLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
        }
        [tempTotalGamesPlayedValueLabel setTextColor:[UIColor whiteColor]];
        [tempTotalGamesPlayedValueLabel setText:@"0"];
        [tempTotalGamesPlayedValueLabel setTextAlignment:UITextAlignmentRight];
        [tempTotalGamesPlayedValueLabel setOpaque:NO];
        [tempTotalGamesPlayedValueLabel setBackgroundColor:[UIColor clearColor]];
        [tempTotalGamesPlayedValueLabel setHidden:YES];
        [self addSubview:tempTotalGamesPlayedValueLabel];
        [self setTotalGamesPlayedValueLabel:tempTotalGamesPlayedValueLabel];
        [tempTotalGamesPlayedValueLabel release];
        // Total Equations Made Text Label
        UILabel *tempTotalEquationsCreatedTextLabel;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempTotalEquationsCreatedTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(kGVMenuView_HighScoresMenu_TotalEquationsCreatedTextLabelX_iPad, kGVMenuView_HighScoresMenu_TotalEquationsCreatedTextLabelY_iPad, kGVMenuView_HighScoresMenu_TotalEquationsCreatedTextLabelWidth_iPad, kGVMenuView_HighScoresMenu_TotalEquationsCreatedTextLabelHeight_iPad)];
            [tempTotalEquationsCreatedTextLabel setFont:[UIFont boldSystemFontOfSize:28.0f]];
        }
        else
        {
            tempTotalEquationsCreatedTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(kGVMenuView_HighScoresMenu_TotalEquationsCreatedTextLabelX_iPhone, kGVMenuView_HighScoresMenu_TotalEquationsCreatedTextLabelY_iPhone, kGVMenuView_HighScoresMenu_TotalEquationsCreatedTextLabelWidth_iPhone, kGVMenuView_HighScoresMenu_TotalEquationsCreatedTextLabelHeight_iPhone)];
            [tempTotalEquationsCreatedTextLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
        }
        [tempTotalEquationsCreatedTextLabel setTextColor:[UIColor whiteColor]];
        [tempTotalEquationsCreatedTextLabel setText:@"Total Equations"];
        [tempTotalEquationsCreatedTextLabel setTextAlignment:UITextAlignmentLeft];
        [tempTotalEquationsCreatedTextLabel setOpaque:NO];
        [tempTotalEquationsCreatedTextLabel setBackgroundColor:[UIColor clearColor]];
        [tempTotalEquationsCreatedTextLabel setHidden:YES];
        [self addSubview:tempTotalEquationsCreatedTextLabel];
        [self setTotalEquationsCreatedTextLabel:tempTotalEquationsCreatedTextLabel];
        [tempTotalEquationsCreatedTextLabel release];
        // Total Equations Made Value Label
        UILabel *tempTotalEquationsCreatedValueLabel;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempTotalEquationsCreatedValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(kGVMenuView_HighScoresMenu_TotalEquationsCreatedValueLabelX_iPad, kGVMenuView_HighScoresMenu_TotalEquationsCreatedValueLabelY_iPad, kGVMenuView_HighScoresMenu_TotalEquationsCreatedValueLabelWidth_iPad, kGVMenuView_HighScoresMenu_TotalEquationsCreatedValueLabelHeight_iPad)];
            [tempTotalEquationsCreatedValueLabel setFont:[UIFont boldSystemFontOfSize:28.0f]];
        }
        else
        {
            tempTotalEquationsCreatedValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(kGVMenuView_HighScoresMenu_TotalEquationsCreatedValueLabelX_iPhone, kGVMenuView_HighScoresMenu_TotalEquationsCreatedValueLabelY_iPhone, kGVMenuView_HighScoresMenu_TotalEquationsCreatedValueLabelWidth_iPhone, kGVMenuView_HighScoresMenu_TotalEquationsCreatedValueLabelHeight_iPhone)];
            [tempTotalEquationsCreatedValueLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
        }
        [tempTotalEquationsCreatedValueLabel setTextColor:[UIColor whiteColor]];
        [tempTotalEquationsCreatedValueLabel setText:@"0"];
        [tempTotalEquationsCreatedValueLabel setTextAlignment:UITextAlignmentRight];
        [tempTotalEquationsCreatedValueLabel setOpaque:NO];
        [tempTotalEquationsCreatedValueLabel setBackgroundColor:[UIColor clearColor]];
        [tempTotalEquationsCreatedValueLabel setHidden:YES];
        [self addSubview:tempTotalEquationsCreatedValueLabel];
        [self setTotalEquationsCreatedValueLabel:tempTotalEquationsCreatedValueLabel];
        [tempTotalEquationsCreatedValueLabel release];
        // Total Time Played Text Label
        UILabel *tempTotalTimePlayedTextLabel;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempTotalTimePlayedTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(kGVMenuView_HighScoresMenu_TotalTimePlayedTextLabelX_iPad, kGVMenuView_HighScoresMenu_TotalTimePlayedTextLabelY_iPad, kGVMenuView_HighScoresMenu_TotalTimePlayedTextLabelWidth_iPad, kGVMenuView_HighScoresMenu_TotalTimePlayedTextLabelHeight_iPad)];
            [tempTotalTimePlayedTextLabel setFont:[UIFont boldSystemFontOfSize:28.0f]];
        }
        else
        {
            tempTotalTimePlayedTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(kGVMenuView_HighScoresMenu_TotalTimePlayedTextLabelX_iPhone, kGVMenuView_HighScoresMenu_TotalTimePlayedTextLabelY_iPhone, kGVMenuView_HighScoresMenu_TotalTimePlayedTextLabelWidth_iPhone, kGVMenuView_HighScoresMenu_TotalTimePlayedTextLabelHeight_iPhone)];
            [tempTotalTimePlayedTextLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
        }
        [tempTotalTimePlayedTextLabel setTextColor:[UIColor whiteColor]];
        [tempTotalTimePlayedTextLabel setText:@"Total Time Played"];
        [tempTotalTimePlayedTextLabel setTextAlignment:UITextAlignmentLeft];
        [tempTotalTimePlayedTextLabel setOpaque:NO];
        [tempTotalTimePlayedTextLabel setBackgroundColor:[UIColor clearColor]];
        [tempTotalTimePlayedTextLabel setHidden:YES];
        [self addSubview:tempTotalTimePlayedTextLabel];
        [self setTotalTimePlayedTextLabel:tempTotalTimePlayedTextLabel];
        [tempTotalTimePlayedTextLabel release];
        // Total Time Played Value Label                                                                            
        UILabel *tempTotalTimePlayedValueLabel;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempTotalTimePlayedValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(kGVMenuView_HighScoresMenu_TotalTimePlayedValueLabelX_iPad, kGVMenuView_HighScoresMenu_TotalTimePlayedValueLabelY_iPad, kGVMenuView_HighScoresMenu_TotalTimePlayedValueLabelWidth_iPad, kGVMenuView_HighScoresMenu_TotalTimePlayedValueLabelHeight_iPad)];
            [tempTotalTimePlayedValueLabel setFont:[UIFont boldSystemFontOfSize:28.0f]];
        }
        else
        {
            tempTotalTimePlayedValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(kGVMenuView_HighScoresMenu_TotalTimePlayedValueLabelX_iPhone, kGVMenuView_HighScoresMenu_TotalTimePlayedValueLabelY_iPhone, kGVMenuView_HighScoresMenu_TotalTimePlayedValueLabelWidth_iPhone, kGVMenuView_HighScoresMenu_TotalTimePlayedValueLabelHeight_iPhone)];
            [tempTotalTimePlayedValueLabel setFont:[UIFont boldSystemFontOfSize:14.0f]];
        }
        [tempTotalTimePlayedValueLabel setTextColor:[UIColor whiteColor]];
        [tempTotalTimePlayedValueLabel setText:@"0:00"];
        [tempTotalTimePlayedValueLabel setTextAlignment:UITextAlignmentRight];
        [tempTotalTimePlayedValueLabel setOpaque:NO];
        [tempTotalTimePlayedValueLabel setBackgroundColor:[UIColor clearColor]];
        [tempTotalTimePlayedValueLabel setHidden:YES];
        [self addSubview:tempTotalTimePlayedValueLabel];
        [self setTotalTimePlayedValueLabel:tempTotalTimePlayedValueLabel];
        [tempTotalTimePlayedValueLabel release]; 
        // High Scores Tab Button
        UIButton *tempHighScoresTabButton = [UIButton buttonWithType:UIButtonTypeCustom];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            [tempHighScoresTabButton setFrame:CGRectMake(kGVMenuView_HighScoresMenu_HighScoresTabButtonX_iPad, kGVMenuView_HighScoresMenu_HighScoresTabButtonY_iPad, kGVMenuView_HighScoresMenu_HighScoresTabButtonWidth_iPad, kGVMenuView_HighScoresMenu_HighScoresTabButtonHeight_iPad)];
            [[tempHighScoresTabButton titleLabel] setFont:[UIFont boldSystemFontOfSize:24.0f]];
        }
        else
        {
            [tempHighScoresTabButton setFrame:CGRectMake(kGVMenuView_HighScoresMenu_HighScoresTabButtonX_iPhone, kGVMenuView_HighScoresMenu_HighScoresTabButtonY_iPhone, kGVMenuView_HighScoresMenu_HighScoresTabButtonWidth_iPhone, kGVMenuView_HighScoresMenu_HighScoresTabButtonHeight_iPhone)];
            [[tempHighScoresTabButton titleLabel] setFont:[UIFont boldSystemFontOfSize:12.0f]];
        }
        [tempHighScoresTabButton setBackgroundImage:[[self delegate] highScoresTabSelectedImage] forState:UIControlStateNormal];
        [tempHighScoresTabButton setTitle:@"High Scores" forState:UIControlStateNormal];
        [tempHighScoresTabButton setOpaque:NO];
        [tempHighScoresTabButton setBackgroundColor:[UIColor clearColor]];
        [tempHighScoresTabButton addTarget:[self delegate] action:@selector(highScoresMenu_HighScoresTabButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:tempHighScoresTabButton];
        [self setHighScoresTabButton:tempHighScoresTabButton];
        // GameStats Tab Button
        UIButton *tempGameStatsTabButton = [UIButton buttonWithType:UIButtonTypeCustom];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            [tempGameStatsTabButton setFrame:CGRectMake(kGVMenuView_HighScoresMenu_GameStatsTabButtonX_iPad, kGVMenuView_HighScoresMenu_GameStatsTabButtonY_iPad, kGVMenuView_HighScoresMenu_GameStatsTabButtonWidth_iPad, kGVMenuView_HighScoresMenu_GameStatsTabButtonHeight_iPad)];
            [[tempGameStatsTabButton titleLabel] setFont:[UIFont boldSystemFontOfSize:24.0f]];
        }
        else
        {
            [tempGameStatsTabButton setFrame:CGRectMake(kGVMenuView_HighScoresMenu_GameStatsTabButtonX_iPhone, kGVMenuView_HighScoresMenu_GameStatsTabButtonY_iPhone, kGVMenuView_HighScoresMenu_GameStatsTabButtonWidth_iPhone, kGVMenuView_HighScoresMenu_GameStatsTabButtonHeight_iPhone)];
            [[tempGameStatsTabButton titleLabel] setFont:[UIFont boldSystemFontOfSize:12.0f]];
        }
        [tempGameStatsTabButton setBackgroundImage:[[self delegate] gameStatsTabUnselectedImage] forState:UIControlStateNormal];
        [tempGameStatsTabButton setTitle:@"Game Stats" forState:UIControlStateNormal];
        [tempGameStatsTabButton setOpaque:NO];
        [tempGameStatsTabButton setBackgroundColor:[UIColor clearColor]];
        [tempGameStatsTabButton addTarget:[self delegate] action:@selector(highScoresMenu_GameStatsTabButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:tempGameStatsTabButton];
        [self setGameStatsTabButton:tempGameStatsTabButton];
        // Main Menu Button
        UIButton *tempMainMenuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            [tempMainMenuButton setFrame:CGRectMake(kGVMenuView_HighScoresMenu_MainMenuButtonX_iPad, kGVMenuView_HighScoresMenu_MainMenuButtonY_iPad, kGVMenuView_HighScoresMenu_MainMenuButtonWidth_iPad, kGVMenuView_HighScoresMenu_MainMenuButtonHeight_iPad)];
            [[tempMainMenuButton titleLabel] setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            [tempMainMenuButton setFrame:CGRectMake(kGVMenuView_HighScoresMenu_MainMenuButtonX_iPhone, kGVMenuView_HighScoresMenu_MainMenuButtonY_iPhone, kGVMenuView_HighScoresMenu_MainMenuButtonWidth_iPhone, kGVMenuView_HighScoresMenu_MainMenuButtonHeight_iPhone)];
            [[tempMainMenuButton titleLabel] setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempMainMenuButton addTarget:[self delegate] action:@selector(highScoresMenu_MainMenuButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [tempMainMenuButton setTitle:@"Main Menu" forState:UIControlStateNormal];
        [tempMainMenuButton setBackgroundImage:[[self delegate] bubbleButtonImageLarge] forState:UIControlStateNormal];
        [self addSubview:tempMainMenuButton];
    }
    return self;
}

- (void)dealloc
{
    [self setBoardTitleLabel:nil];
    [self setHighScoresTableView:nil];
    [self setTotalGamesPlayedTextLabel:nil];
    [self setTotalGamesPlayedValueLabel:nil];
    [self setTotalEquationsCreatedTextLabel:nil];
    [self setTotalEquationsCreatedValueLabel:nil];
    [self setTotalTimePlayedTextLabel:nil];
    [self setTotalTimePlayedValueLabel:nil];
    [self setHighScoresTabButton:nil];
    [self setGameStatsTabButton:nil];
    [super dealloc];
}

@synthesize delegate;
// UI Elements
@synthesize boardTitleLabel;
@synthesize highScoresTableView;
@synthesize totalGamesPlayedTextLabel;
@synthesize totalGamesPlayedValueLabel;
@synthesize totalEquationsCreatedTextLabel;
@synthesize totalEquationsCreatedValueLabel;
@synthesize totalTimePlayedTextLabel;
@synthesize totalTimePlayedValueLabel;
@synthesize highScoresTabButton;
@synthesize gameStatsTabButton;
@end
