//
//  SeaquationsMenuView_HighScoresMenu.h
//  seaquations
//
//  Created by goVertex on 10/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SeaquationsMenuView_HighScoresMenuDelegate <NSObject>
// Action Methods
- (void)highScoresMenu_HighScoresTabButtonTapped;
- (void)highScoresMenu_GameStatsTabButtonTapped;
- (void)highScoresMenu_MainMenuButtonTapped;
// Image Methods
- (UIImage*)bubbleButtonImageLarge;
- (UIImage*)highScoresTabSelectedImage;
- (UIImage*)gameStatsTabUnselectedImage;

@end

@interface SeaquationsMenuView_HighScoresMenu : UIView 
{
    id delegate;
    // UI Elements
    UILabel *boardTitleLabel;
    UITableView *highScoresTableView;
    UILabel *totalGamesPlayedTextLabel;
    UILabel *totalGamesPlayedValueLabel;
    UILabel *totalEquationsCreatedTextLabel;
    UILabel *totalEquationsCreatedValueLabel;
    UILabel *totalTimePlayedTextLabel;
    UILabel *totalTimePlayedValueLabel;
    UIButton *highScoresTabButton;
    UIButton *gameStatsTabButton;
}
@property (nonatomic, assign) id delegate;
// UI Elements
@property (nonatomic, retain) UILabel *boardTitleLabel;
@property (nonatomic, retain) UITableView *highScoresTableView;
@property (nonatomic, retain) UILabel *totalGamesPlayedTextLabel;
@property (nonatomic, retain) UILabel *totalGamesPlayedValueLabel;
@property (nonatomic, retain) UILabel *totalEquationsCreatedTextLabel;
@property (nonatomic, retain) UILabel *totalEquationsCreatedValueLabel;
@property (nonatomic, retain) UILabel *totalTimePlayedTextLabel;
@property (nonatomic, retain) UILabel *totalTimePlayedValueLabel;
@property (nonatomic, retain) UIButton *highScoresTabButton;
@property (nonatomic, retain) UIButton *gameStatsTabButton;

#pragma mark -
#pragma mark Methods

- (id)initWithFrame:(CGRect)argFrame delegate:(id)argDelegate;

@end