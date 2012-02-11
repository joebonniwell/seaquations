//
//  SeaquationsMenuView_HowToPlayMenu.h
//  seaquations
//
//  Created by goVertex on 10/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SeaquationsMenuView_HowToPlayMenuDelegate <NSObject>
// Action Methods
- (void)howToPlayMenu_MainMenuButtonTapped;
// Image Methods
- (UIImage*)bubbleButtonImageLarge;

@end

@interface SeaquationsMenuView_HowToPlayMenu : UIView 
{
    id delegate;
    UIPageControl *howToPlayPageControl;
    UIScrollView *howToPlayScrollView;
}

@property (nonatomic, assign) id delegate;
@property (nonatomic, retain) UIPageControl *howToPlayPageControl;
@property (nonatomic, retain) UIScrollView *howToPlayScrollView;

- (id)initWithFrame:(CGRect)argFrame delegate:(id)argDelegate;

@end