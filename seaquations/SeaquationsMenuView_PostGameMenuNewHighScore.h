//
//  SeaquationsMenuView_PostGameMenuNewHighScore.h
//  seaquations
//
//  Created by goVertex on 10/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SeaquationsMenuView_PostGameMenuNewHighScoreDelegate <NSObject>
// Action Methods
- (void)postGameNewHighScoreMenu_PlayAgainButtonTapped;
- (void)postGameNewHighScoreMenu_MainMenuButtonTapped;
// Image Methods
- (UIImage*)bubbleButtonImageLarge;

@end

@interface SeaquationsMenuView_PostGameMenuNewHighScore : UIView 
{
    id delegate;
    // Data Fields
    UILabel *highScorePlaceLabel;
    UITextField *highScoreNameTextField;
    UILabel *highScoreValueLabel;
    UILabel *gameTimeValueLabel;
    UILabel *gameEquationsValueLabel;
}

@property (nonatomic, assign) id delegate;
// Data Fields
@property (nonatomic, retain) UILabel *highScorePlaceLabel;
@property (nonatomic, retain) UITextField *highScoreNameTextField;
@property (nonatomic, retain) UILabel *highScoreValueLabel;
@property (nonatomic, retain) UILabel *gameTimeValueLabel;
@property (nonatomic, retain) UILabel *gameEquationsValueLabel;

- (id)initWithFrame:(CGRect)argFrame delegate:(id)argDelegate;

@end