//
//  SeaquationsMenuView_MainMenu.h
//  seaquations
//
//  Created by goVertex on 10/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SeaquationsMenuView_MainMenuDelegate <NSObject>
// Actions
- (void)mainMenu_NewGameButtonTapped;
- (void)mainMenu_DifficultyEasyButtonTapped;
- (void)mainMenu_DifficultyNormalButtonTapped;
- (void)mainMenu_HighScoresButtonTapped;
- (void)mainMenu_HowToPlayButtonTapped;
- (void)mainMenu_goVertexButtonTapped;
- (void)mainMenu_SoundButtonTapped;
// Images
- (UIImage*)bubbleButtonImageLarge;
- (UIImage*)goVertexButtonImage;
@end

@interface SeaquationsMenuView_MainMenu : UIView 
{
    id delegate;
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
// Creation Methods
- (id)initWithFrame:(CGRect)argFrame delegate:(id)argDelegate;

@end