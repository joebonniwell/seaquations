//
//  SeaquationsMenuView_PostGameMenu.h
//  seaquations
//
//  Created by goVertex on 10/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SeaquationsMenuView_PostGameMenuDelegate <NSObject>
// Action Methods
- (void)postGameMenu_PlayAgainButtonTapped;
- (void)postGameMenu_MainMenuButtonTapped;
// Image Methods
- (UIImage*)bubbleButtonImageLarge;

@end

@interface SeaquationsMenuView_PostGameMenu : UIView 
{
    id delegate;
    // Data Fields
    UILabel *gameScoreValueLabel;
    UILabel *gameTimeValueLabel;
    UILabel *gameEquationsValueLabel;
}

@property (nonatomic, assign) id delegate;
// Data Fields
@property (nonatomic, retain) UILabel *gameScoreValueLabel;
@property (nonatomic, retain) UILabel *gameTimeValueLabel;
@property (nonatomic, retain) UILabel *gameEquationsValueLabel;

- (id)initWithFrame:(CGRect)argFrame delegate:(id)argDelegate;

@end