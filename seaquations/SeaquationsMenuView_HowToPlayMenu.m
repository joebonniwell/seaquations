//
//  SeaquationsMenuView_HowToPlayMenu.m
//  seaquations
//
//  Created by goVertex on 10/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SeaquationsMenuView_HowToPlayMenu.h"

@implementation SeaquationsMenuView_HowToPlayMenu

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
            tempBoardView = [[UIImageView alloc] initWithFrame:CGRectMake(84.0f, 140.0f, 600.0f, 560.0f)];
            [tempBoardView setImage:[UIImage imageNamed:@"Seaquations-BoardHD.png"]];
        }
        else
        {
            tempBoardView = [[UIImageView alloc] initWithFrame:CGRectMake(10.0f, 60.0f, 300.0f, 280.0f)];
            [tempBoardView setImage:[UIImage imageNamed:@"Seaquations-Board.png"]];
        }
        [self addSubview:tempBoardView];
        // Scroll view
        UIScrollView *tempScrollView;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(144.0f, 200.0f, 480.0f, 400.0f)];
            [tempScrollView setContentSize:CGSizeMake(1920.0f, 400.0f)];
        }
        else
        {
            tempScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(40.0f, 80.0f, 240.0f, 210.0f)];
            [tempScrollView setContentSize:CGSizeMake(960.0f, 180.0f)];
        }
        [tempScrollView setDelegate:argDelegate];
        [tempScrollView setTag:kHowToPlayScrollView];
        [tempScrollView setBackgroundColor:[UIColor clearColor]];
        [tempScrollView setShowsHorizontalScrollIndicator:NO];
        [tempScrollView setPagingEnabled:YES];
        [self addSubview:tempScrollView];
        [self setHowToPlayScrollView:tempScrollView];
        [tempScrollView release];
        // Content View
        // Page 1
        UILabel *tempPage1TitleLabel;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempPage1TitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 10.0f, 480.0f, 50.0f)];
            [tempPage1TitleLabel setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            tempPage1TitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 10.0f, 240.0f, 20.0f)];
            [tempPage1TitleLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempPage1TitleLabel setTextAlignment:UITextAlignmentCenter];
        [tempPage1TitleLabel setBackgroundColor:[UIColor clearColor]];
        [tempPage1TitleLabel setText:@"The Goal"];
        [tempPage1TitleLabel setTextColor:[UIColor whiteColor]];
        [tempScrollView addSubview:tempPage1TitleLabel];
        [tempPage1TitleLabel release];
        UILabel *tempPage1BodyLabel;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempPage1BodyLabel = [[UILabel alloc] initWithFrame:CGRectMake(40.0f, 70.0f, 400.0f, 320.0f)];
            [tempPage1BodyLabel setFont:[UIFont systemFontOfSize:24.0f]];
        }
        else
        {
            tempPage1BodyLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 30.0f, 200.0f, 180.0f)];
            [tempPage1BodyLabel setFont:[UIFont systemFontOfSize:12.0f]];
        }
        [tempPage1BodyLabel setBackgroundColor:[UIColor clearColor]];
        [tempPage1BodyLabel setText:@"Score as many points as possible before the bubbles reach the surface. Points are awarded for constructing equations using the symbols in the bubbles."];
        [tempPage1BodyLabel setNumberOfLines:0];
        [tempPage1BodyLabel setLineBreakMode:UILineBreakModeWordWrap];
        [tempPage1BodyLabel setTextColor:[UIColor whiteColor]];
        [tempScrollView addSubview:tempPage1BodyLabel];
        [tempPage1BodyLabel release];
        // Page 2
        UILabel *tempPage2TitleLabel;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempPage2TitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(480.0f, 10.0f, 480.0f, 50.0f)];
            [tempPage2TitleLabel setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            tempPage2TitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(240.0f, 10.0f, 240.0f, 20.0f)];
            [tempPage2TitleLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempPage2TitleLabel setTextAlignment:UITextAlignmentCenter];
        [tempPage2TitleLabel setBackgroundColor:[UIColor clearColor]];
        [tempPage2TitleLabel setText:@"Instructions"];
        [tempPage2TitleLabel setTextColor:[UIColor whiteColor]];
        [tempScrollView addSubview:tempPage2TitleLabel];
        [tempPage2TitleLabel release];
        UILabel *tempPage2BodyLabel;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempPage2BodyLabel = [[UILabel alloc] initWithFrame:CGRectMake(520.0f, 70.0f, 400.0f, 320.0f)];
            [tempPage2BodyLabel setFont:[UIFont systemFontOfSize:24.0f]];
        }
        else
        {
            tempPage2BodyLabel = [[UILabel alloc] initWithFrame:CGRectMake(260.0f, 30.0f, 200.0f, 180.0f)];
            [tempPage2BodyLabel setFont:[UIFont systemFontOfSize:12.0f]];
        }
        [tempPage2BodyLabel setBackgroundColor:[UIColor clearColor]];
        [tempPage2BodyLabel setText:@"Tap the symbols in bubbles to construct an equation.\n\nTap the equation itself to score points and remove the used symbols.\n\nRepeat as many times as you can before the bubbles reach the surface."];
        [tempPage2BodyLabel setNumberOfLines:0];
        [tempPage2BodyLabel setLineBreakMode:UILineBreakModeWordWrap];
        [tempPage2BodyLabel setTextColor:[UIColor whiteColor]];
        [tempScrollView addSubview:tempPage2BodyLabel];
        [tempPage2BodyLabel release];
        // Page 3
        UILabel *tempPage3TitleLabel;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempPage3TitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(960.0f, 10.0f, 480.0f, 50.0f)];
            [tempPage3TitleLabel setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            tempPage3TitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(480.0f, 10.0f, 240.0f, 20.0f)];
            [tempPage3TitleLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempPage3TitleLabel setTextAlignment:UITextAlignmentCenter];
        [tempPage3TitleLabel setBackgroundColor:[UIColor clearColor]];
        [tempPage3TitleLabel setText:@"Things to Note"];
        [tempPage3TitleLabel setTextColor:[UIColor whiteColor]];
        [tempScrollView addSubview:tempPage3TitleLabel];
        [tempPage3TitleLabel release];
        UILabel *tempPage3BodyLabel;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempPage3BodyLabel = [[UILabel alloc] initWithFrame:CGRectMake(1000.0f, 70.0f, 400.0f, 320.0f)];
            [tempPage3BodyLabel setFont:[UIFont systemFontOfSize:24.0f]];
        }
        else
        {
            tempPage3BodyLabel = [[UILabel alloc] initWithFrame:CGRectMake(500.0f, 30.0f, 200.0f, 180.0f)];
            [tempPage3BodyLabel setFont:[UIFont systemFontOfSize:12.0f]];
        }
        [tempPage3BodyLabel setBackgroundColor:[UIColor clearColor]];
        [tempPage3BodyLabel setText:@"More complex equations are worth more points.\n\nA valid equation contains 1 and only 1 equals (=) sign.\n\nPowerups will disappear if they reach the surface unused."];
        [tempPage3BodyLabel setNumberOfLines:0];
        [tempPage3BodyLabel setLineBreakMode:UILineBreakModeWordWrap];
        [tempPage3BodyLabel setTextColor:[UIColor whiteColor]];
        [tempScrollView addSubview:tempPage3BodyLabel];
        [tempPage3BodyLabel release];
        // Page 4
        UILabel *tempPage4TitleLabel;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempPage4TitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(1440.0f, 10.0f, 480.0f, 50.0f)];
            [tempPage4TitleLabel setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            tempPage4TitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(720.0f, 10.0f, 240.0f, 20.0f)];
            [tempPage4TitleLabel setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempPage4TitleLabel setTextAlignment:UITextAlignmentCenter];
        [tempPage4TitleLabel setBackgroundColor:[UIColor clearColor]];
        [tempPage4TitleLabel setText:@"Order of Operations"];
        [tempPage4TitleLabel setTextColor:[UIColor whiteColor]];
        [tempScrollView addSubview:tempPage4TitleLabel];
        [tempPage4TitleLabel release];
        UILabel *tempPage4BodyLabel;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            tempPage4BodyLabel = [[UILabel alloc] initWithFrame:CGRectMake(1480.0f, 70.0f, 400.0f, 320.0f)];
            [tempPage4BodyLabel setFont:[UIFont systemFontOfSize:24.0f]];
        }
        else
        {
            tempPage4BodyLabel = [[UILabel alloc] initWithFrame:CGRectMake(740.0f, 30.0f, 200.0f, 180.0f)];
            [tempPage4BodyLabel setFont:[UIFont systemFontOfSize:12.0f]];
        }
        [tempPage4BodyLabel setBackgroundColor:[UIColor clearColor]];
        [tempPage4BodyLabel setText:@"Multiplication and division are done before addition and subtraction, from left to right.\n\nExample\n3*3+4-4/2=11\nFirst, 3*3 results in 9+4-4/2=11\nNext, 4/2 results in 9+4-2=11\nLast, 9+4=13 and 13-2=11"];
        [tempPage4BodyLabel setNumberOfLines:0];
        [tempPage4BodyLabel setLineBreakMode:UILineBreakModeWordWrap];
        [tempPage4BodyLabel setTextColor:[UIColor whiteColor]];
        [tempScrollView addSubview:tempPage4BodyLabel];
        [tempPage4BodyLabel release];
        // Page Control
        UIPageControl *tempPageControl;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            tempPageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(184.0f, 610.0f, 400.0f, 50.0f)];
        else
            tempPageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(40.0f, 270.0f, 240.0f, 50.0f)];
        [tempPageControl addTarget:argDelegate action:@selector(pageControlTapped) forControlEvents:UIControlEventValueChanged];
        [tempPageControl setNumberOfPages:4];
        [tempPageControl setDefersCurrentPageDisplay:YES];
        [self addSubview:tempPageControl];
        [self setHowToPlayPageControl:tempPageControl];
        [tempPageControl release];
        // Main Menu Button
        UIButton *tempMainMenuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            [tempMainMenuButton setFrame:CGRectMake(kHowToPlayMenu_MainMenuButtonX_iPad, kHowToPlayMenu_MainMenuButtonY_iPad, kHowToPlayMenu_MainMenuButtonWidth_iPad, kHowToPlayMenu_MainMenuButtonHeight_iPad)];
            [[tempMainMenuButton titleLabel] setFont:[UIFont boldSystemFontOfSize:36.0f]];
        }
        else
        {
            [tempMainMenuButton setFrame:CGRectMake(kHowToPlayMenu_MainMenuButtonX_iPhone, kHowToPlayMenu_MainMenuButtonY_iPhone, kHowToPlayMenu_MainMenuButtonWidth_iPhone, kHowToPlayMenu_MainMenuButtonHeight_iPhone)];
            [[tempMainMenuButton titleLabel] setFont:[UIFont boldSystemFontOfSize:18.0f]];
        }
        [tempMainMenuButton setTitle:@"Main Menu" forState:UIControlStateNormal];
        [tempMainMenuButton addTarget:[self delegate] action:@selector(howToPlayMenu_MainMenuButtonTapped) forControlEvents:UIControlEventTouchUpInside];
        [tempMainMenuButton setBackgroundImage:[[self delegate] bubbleButtonImageLarge]  forState:UIControlStateNormal];
        [self addSubview:tempMainMenuButton];
    }
    return self;
}

- (void)dealloc
{
    [self setHowToPlayPageControl:nil];
    [self setHowToPlayScrollView:nil];
    [super dealloc];
}

@synthesize delegate;
@synthesize howToPlayPageControl;
@synthesize howToPlayScrollView;
@end