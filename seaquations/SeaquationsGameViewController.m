//
//  SeaquationsGameViewController.m
//  seaquations
//
//  Created by goVertex on 10/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SeaquationsGameViewController.h"

@implementation SeaquationsGameViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
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
    [self setView:tempView];
    [tempView release];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Board View    
    UIView *tempBoardView;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        tempBoardView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 768.0f, 1024.0f)];
    else
        tempBoardView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 480.0f)];
    [tempBoardView setOpaque:NO];
    [tempBoardView setBackgroundColor:[UIColor clearColor]];
    [[self view] addSubview:tempBoardView];
    [self setBoardView:tempBoardView];
    [tempBoardView release];
    // Warning Image View
    UIImageView *tempWarningImageView;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        tempWarningImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 768.0f, 1024.0f)];
        [tempWarningImageView setImage:[UIImage imageNamed:@"Seaquations-AlertBorderHD.png"]];
    }
    else
    {
        tempWarningImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 480.0f)];
        [tempWarningImageView setImage:[UIImage imageNamed:@"Seaquations-AlertBorder.png"]];
    }
    [tempWarningImageView setOpaque:NO];
    [tempWarningImageView setBackgroundColor:[UIColor clearColor]];
    [tempWarningImageView setAlpha:0.0f];
    [[self view] addSubview:tempWarningImageView];
    [self setWarningImageView:tempWarningImageView];
    [tempWarningImageView release];
    // Main Menu Button
    UIButton *tempMainMenuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        [tempMainMenuButton setFrame:CGRectMake(8.0f, 0.0f, 100.0f, 72.0f)];
        [[tempMainMenuButton titleLabel] setFont:[UIFont boldSystemFontOfSize:36.0f]];
    }
    else
    {
        [tempMainMenuButton setFrame:CGRectMake(8.0f, 0.0f, 50.0f, 36.0f)];
        [[tempMainMenuButton titleLabel] setFont:[UIFont boldSystemFontOfSize:18.0f]];
    }
    [tempMainMenuButton setTitle:@"Menu" forState:UIControlStateNormal];
    [tempMainMenuButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [tempMainMenuButton addTarget:self action:@selector(menuButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [tempMainMenuButton setHidden:YES];
    [[self view] addSubview:tempMainMenuButton];
    [self setMainMenuButton:tempMainMenuButton];
    // Score Label
    UILabel *tempScoreLabel;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        tempScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(520.0f, 0.0f, 240.0f, 68.0f)];
        [tempScoreLabel setFont:[UIFont boldSystemFontOfSize:48.0f]];
    }
    else
    {
        tempScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(180.0f, 0.0f, 132.0f, 32.0f)];
        [tempScoreLabel setFont:[UIFont boldSystemFontOfSize:24.0f]];
    }
    [tempScoreLabel setOpaque:NO];
    [tempScoreLabel setBackgroundColor:[UIColor clearColor]];
    [tempScoreLabel setTextColor:[UIColor blackColor]];
    [tempScoreLabel setTextAlignment:UITextAlignmentRight];
    [tempScoreLabel setHidden:YES];
    [[self view] addSubview:tempScoreLabel];
    [self setScoreLabel:tempScoreLabel];
    [tempScoreLabel release];
    // Treasure Chest
    UIImageView *tempTreasureChestImageView;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        tempTreasureChestImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 885.0f, 768.0f, 139.0f)];
        [tempTreasureChestImageView setImage:[UIImage imageNamed:@"Seaquations-TreasureChestHD.png"]];
    }
    else
    {
        tempTreasureChestImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 394.0f, 320.0f, 86.0f)];
        [tempTreasureChestImageView setImage:[UIImage imageNamed:@"Seaquations-TreasureChest.png"]];
    }
    [tempTreasureChestImageView setOpaque:NO];
    [tempTreasureChestImageView setUserInteractionEnabled:YES];
    [tempTreasureChestImageView setBackgroundColor:[UIColor clearColor]];
    [[self view] addSubview:tempTreasureChestImageView];
    [tempTreasureChestImageView release];
    // Clear All Button
    UIButton *tempClearAllButton = [UIButton buttonWithType:UIButtonTypeCustom];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        [tempClearAllButton setFrame:CGRectMake(20.0f, 921.0f, 80.0f, 103.0f)];
    else
        [tempClearAllButton setFrame:CGRectMake(10.0f, 410.0f, 55.0f, 80.0f)];
    [tempClearAllButton addTarget:self action:@selector(clearAllButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:tempClearAllButton];
    [self setClearAllButton:tempClearAllButton];
    // Register Label
    UILabel *tempRegisterLabel;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        tempRegisterLabel = [[UILabel alloc] initWithFrame:CGRectMake(112.0f, 921.0f, 544.0f, 103.0f)];
        [tempRegisterLabel setFont:[UIFont boldSystemFontOfSize:56.0f]];
        [tempRegisterLabel setMinimumFontSize:16.0f];
    }
    else
    {
        tempRegisterLabel = [[UILabel alloc] initWithFrame:CGRectMake(70.0f, 420.0f, 180.0f, 50.0f)];
        [tempRegisterLabel setFont:[UIFont boldSystemFontOfSize:20.0f]];
        [tempRegisterLabel setMinimumFontSize:8.0f];
    }
    [tempRegisterLabel setBackgroundColor:[UIColor clearColor]];
    [tempRegisterLabel setOpaque:NO];
    [tempRegisterLabel setTextColor:[UIColor whiteColor]];
    [tempRegisterLabel setTextAlignment:UITextAlignmentRight];
    [tempRegisterLabel setUserInteractionEnabled:YES];
    [tempRegisterLabel setAdjustsFontSizeToFitWidth:YES];
    [[self view] addSubview:tempRegisterLabel];
    [self setRegisterLabel:tempRegisterLabel];
    [tempRegisterLabel release];
    // Register Label Gesture Recognizer
    UITapGestureRecognizer *registerLabelTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(computeButtonTapped)];
    [registerLabelTapGestureRecognizer setNumberOfTapsRequired:1];
    [registerLabelTapGestureRecognizer setNumberOfTouchesRequired:1];
    [tempRegisterLabel addGestureRecognizer:registerLabelTapGestureRecognizer];
    [registerLabelTapGestureRecognizer release];
    // Backspace Button
    UIButton *tempBackspaceButton = [UIButton buttonWithType:UIButtonTypeCustom];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        [tempBackspaceButton setFrame:CGRectMake(668.0f, 921.0f, 80.0f, 103.0f)];
    else
        [tempBackspaceButton setFrame:CGRectMake(255.0f, 410.0f, 55.0f, 80.0f)];
    [tempBackspaceButton setBackgroundColor:[UIColor clearColor]];
    [tempBackspaceButton addTarget:self action:@selector(backspaceButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [[self view] addSubview:tempBackspaceButton];
    [self setBackspaceButton:tempBackspaceButton];
}

- (void)gameWillAppear
{
    [[self gameState] generateNewRowOfTiles];
    [self displayNewTilesWithOvershoot:0.0f];
    [[self scoreLabel] setText:[[self gameState] scoreString]];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [self setWarningImageView:nil];
    [self setBoardView:nil];
    [self setRegisterLabel:nil];
    [self setBackspaceButton:nil];
    [self setClearAllButton:nil];
    [self setScoreLabel:nil];
    [self setMainMenuButton:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];  
}

- (void)viewWillDisappear:(BOOL)animated
{
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark -
#pragma mark User Interaction Methods

- (void)menuButtonTapped
{
    [[self delegate] playBubbleTapSound];
    [[self delegate] setGameIsActive:NO];
    [[self delegate] showMainMenuFromGame];
}

- (void)clearAllButtonTapped
{
    [[self delegate] playBubbleTapSound];
    [[self gameState] resetCurrentEquation];
    [[self registerLabel] setText:[[self gameState] stringForCurrentEquation]];
    [[self clearAllButton] setEnabled:NO];
}

- (void)backspaceButtonTapped
{
    [[self delegate] playBubbleTapSound];
    [[self gameState] removeLastSymbolFromCurrentEquation];
    [[self registerLabel] setText:[[self gameState] stringForCurrentEquation]];
    if ([[[self gameState] registerArray] count] == 0)
    {
        [[self backspaceButton] setEnabled:NO];
        [[self clearAllButton] setEnabled:NO];
    }
}

- (void)computeButtonTapped
{
    if ([[self gameState] validateCurrentEquationAndScoreIt:YES])
    {
        [[self delegate] playBubbleTapSound];
        for (int columnIndex = 0; columnIndex < 6; columnIndex++)
        {
            NSMutableArray *columnArray = [[[self gameState] columnsArray] objectAtIndex:columnIndex];
            int tileCount = [columnArray count];
            int tileIndex = 0;
            for (int tile = 0; tile < tileCount; tile++)
            {
                if ([[columnArray objectAtIndex:tileIndex] isSelected])
                {
                    [[[columnArray objectAtIndex:tileIndex] tileButton] removeFromSuperview];
                    [columnArray removeObjectAtIndex:tileIndex];
                    if (tileIndex > 0)
                    {
                        for (int priorTile = 0; priorTile < tileIndex; priorTile++)
                        {
                            [[columnArray objectAtIndex:priorTile] setIsFalling:YES];
                        }
                    }                
                }
                else
                    tileIndex++;
            }
        }
        // Score the points
        [[self scoreLabel] setText:[[self gameState] scoreString]];
        [[[self gameState] registerArray] removeAllObjects];
        [[self registerLabel] setText:[[self gameState] stringForCurrentEquation]];
        [[self gameState] setTotalEquationsCreated:([[self gameState] totalEquationsCreated] + 1)];
        // Potentially generate a power up tile
        // with some kind of filter....
        // base the filter on score.....
        
        if ([[self gameState] currentScore] > [[self gameState] nextPowerUpScoreThreshold])
        {
            NSInteger newPowerUpColumn = arc4random() % 6;
            seaquationsTile *newPowerUpTile = [[self gameState] newPowerUpTileInColumn:newPowerUpColumn];
            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
                [[newPowerUpTile tileButton] setCenter:CGPointMake(kTileHorizontalOffset_iPad + newPowerUpColumn * kTileHorizontalSeperationDistance_iPad, 0.0f)];
            else
                [[newPowerUpTile tileButton] setCenter:CGPointMake(kTileHorizontalOffset_iPhone + newPowerUpColumn * kTileHorizontalSeperationDistance_iPhone, 0.0f)];
            [[self boardView] addSubview:[newPowerUpTile tileButton]];
            [[self gameState] setNextPowerUpScoreThreshold:([[self gameState] currentScore] + kPowerUpScoreThresholdIncrease)];
        }
    }
    else
    {
        // Equation was not evaluated correctly, indicate this to the player
    }
}



#pragma mark -
#pragma mark GameState Delegate Methods

- (void)tileWasSelected:(seaquationsTile*)argTile
{
    [[self delegate] playBubbleTapSound];
    if ([argTile tileType] >= kPowerUpTime)
    {
        if ([argTile tileType] == kPowerUpTime)
        {
            [[self gameState] setAvailableSlowDuration:[[self gameState] availableSlowDuration] + kSlowDurationPerTile];
            [self removeTile:argTile];
        }
        else if ([argTile tileType] == kPowerUpScore)
        {
            NSInteger newPowerUpsCount = [[self gameState] doubleScorePowerUpCount] + kNumberOfScorePowerUpsPerTile;
            [[self gameState] setDoubleScorePowerUpCount:newPowerUpsCount];
            [self removeTile:argTile];
        }
        else    // kPowerUpTiles
        {
            BOOL powerUpTileLocated = NO;
            NSInteger columnOfPowerUpTile = 0;
            NSUInteger indexOfPowerUpTile = 0;
            for (int column = 0; column < 6; column++)
            {
                NSUInteger tileIndex = [[[[self gameState] columnsArray] objectAtIndex:column] indexOfObject:argTile];
                if (tileIndex != NSNotFound)
                {
                    powerUpTileLocated = YES;
                    columnOfPowerUpTile = column;
                    indexOfPowerUpTile = tileIndex;
                }
            }
            if (powerUpTileLocated == NO)
            {
                //NSLog(@"Error - Could not locate power up tile");
                return;
            }
            NSMutableArray *powerUpColumn = [[[self gameState] columnsArray] objectAtIndex:columnOfPowerUpTile];
            NSInteger numberOfTilesBelowPowerTile = [powerUpColumn count] - 1 - indexOfPowerUpTile;
            for (int neighborColumnCounter = 0; neighborColumnCounter < 2; neighborColumnCounter++)
            {
                if ((columnOfPowerUpTile > 0 && neighborColumnCounter == 0) || (columnOfPowerUpTile < 5 && neighborColumnCounter == 1))
                {
                    BOOL startedFalling = NO;
                    NSMutableArray *neighborColumn;
                    if (neighborColumnCounter == 0)
                        neighborColumn = [[[self gameState] columnsArray] objectAtIndex:(columnOfPowerUpTile - 1)];
                    else
                        neighborColumn = [[[self gameState] columnsArray] objectAtIndex:(columnOfPowerUpTile + 1)];
                    if ([neighborColumn count] > 0)
                    {
                        NSInteger affectedTileIndex = [neighborColumn count] - numberOfTilesBelowPowerTile;
                        for (int affectedTile = 0; affectedTile < 3; affectedTile++)
                        {
                            if (affectedTileIndex >= 0 && affectedTileIndex < [neighborColumn count])
                            {
                                if ([[neighborColumn objectAtIndex:affectedTileIndex] tileType] <= kOperatorDivision && [[[neighborColumn objectAtIndex:affectedTileIndex] tileButton] isSelected] == NO)
                                {
                                    [[[neighborColumn objectAtIndex:affectedTileIndex] tileButton] removeFromSuperview];
                                    [neighborColumn removeObjectAtIndex:affectedTileIndex];
                                    startedFalling = YES;
                                }
                                else if (startedFalling == YES)
                                    [[neighborColumn objectAtIndex:affectedTileIndex] setIsFalling:YES];
                            }
                            affectedTileIndex--;
                        }
                        if (affectedTileIndex >= 0 && affectedTileIndex < [neighborColumn count] && startedFalling == YES)
                        {
                            for (int remainingTileIndex = affectedTileIndex; remainingTileIndex >= 0; remainingTileIndex--)
                            {
                                [[neighborColumn objectAtIndex:remainingTileIndex] setIsFalling:YES];
                            }
                        }
                    }
                }
            }
            if (indexOfPowerUpTile < [powerUpColumn count] - 1)
            {
                if ([[powerUpColumn objectAtIndex:(indexOfPowerUpTile + 1)] tileType] <= kOperatorDivision && [[[powerUpColumn objectAtIndex:(indexOfPowerUpTile + 1)] tileButton] isSelected] == NO)
                {
                    [[[powerUpColumn objectAtIndex:(indexOfPowerUpTile + 1)] tileButton] removeFromSuperview];
                    [powerUpColumn removeObjectAtIndex:(indexOfPowerUpTile + 1)];
                }
            }
            [[[powerUpColumn objectAtIndex:indexOfPowerUpTile] tileButton] removeFromSuperview];
            [powerUpColumn removeObjectAtIndex:indexOfPowerUpTile];
            if (indexOfPowerUpTile > 0)
            {
                for (int aboveTile = indexOfPowerUpTile - 1; aboveTile >= 0; aboveTile--)
                {
                    [[powerUpColumn objectAtIndex:aboveTile] setIsFalling:YES];
                }
            }
        }
        return;
    }
    if ([argTile isSelected])
    {
        [argTile setIsSelected:NO];
        [[argTile tileButton] setSelected:NO];
        [[[self gameState] registerArray] removeLastObject];
        if ([[[self gameState] registerArray] count] > 0)
            [[[[[self gameState] registerArray] lastObject] tileButton] setEnabled:YES];
        else
        {
            [[self backspaceButton] setEnabled:NO];
            [[self clearAllButton] setEnabled:NO];
        }
        [[self registerLabel] setText:[[self gameState] stringForCurrentEquation]];
    }
    else    // Add to register
    {
        [argTile setIsSelected:YES];
        [[argTile tileButton] setSelected:YES];
        if ([[[self gameState] registerArray] count] > 0)
            [[[[[self gameState] registerArray] lastObject] tileButton] setEnabled:NO];
        [[[self gameState] registerArray] addObject:argTile];
        NSString *newEquationString = [[self gameState] stringForCurrentEquation];
        [[self registerLabel] setText:newEquationString];
        [[self backspaceButton] setEnabled:YES];
        [[self clearAllButton] setEnabled:YES];
    }
}

#pragma mark -
#pragma mark Update Methods

- (void)updateGameLossAnimationForDuration:(NSTimeInterval)argDuration
{
    if ([self popBubbleThisFrame] == NO)
    {
        [self setPopBubbleThisFrame:YES];
        return;
    }
    else
        [self setPopBubbleThisFrame:NO];
    int randomColumn = arc4random() % 6;
    if ([[[[self gameState] columnsArray] objectAtIndex:randomColumn] count] > 0)
    {
        int randomBubble = arc4random() % [[[[self gameState] columnsArray] objectAtIndex:randomColumn] count];
        [[[[[[self gameState] columnsArray] objectAtIndex:randomColumn] objectAtIndex:randomBubble] tileButton] removeFromSuperview];
        [[[[self gameState] columnsArray] objectAtIndex:randomColumn] removeObjectAtIndex:randomBubble];
    }
    else
    {
        randomColumn++;
        if (randomColumn > 5)
            randomColumn -= 6;
        if ([[[[self gameState] columnsArray] objectAtIndex:randomColumn] count] > 0)
        {
            int randomBubble = arc4random() % [[[[self gameState] columnsArray] objectAtIndex:randomColumn] count];
            [[[[[[self gameState] columnsArray] objectAtIndex:randomColumn] objectAtIndex:randomBubble] tileButton] removeFromSuperview];
            [[[[self gameState] columnsArray] objectAtIndex:randomColumn] removeObjectAtIndex:randomBubble];
        }
        else
        {
            randomColumn++;
            if (randomColumn > 5)
                randomColumn -= 6;
            if ([[[[self gameState] columnsArray] objectAtIndex:randomColumn] count] > 0)
            {
                int randomBubble = arc4random() % [[[[self gameState] columnsArray] objectAtIndex:randomColumn] count];
                [[[[[[self gameState] columnsArray] objectAtIndex:randomColumn] objectAtIndex:randomBubble] tileButton] removeFromSuperview];
                [[[[self gameState] columnsArray] objectAtIndex:randomColumn] removeObjectAtIndex:randomBubble];
            }
            else
            {
                randomColumn ++;
                if (randomColumn > 5)
                    randomColumn -= 6;
                if ([[[[self gameState] columnsArray] objectAtIndex:randomColumn] count] > 0)
                {
                    int randomBubble = arc4random() % [[[[self gameState] columnsArray] objectAtIndex:randomColumn] count];
                    [[[[[[self gameState] columnsArray] objectAtIndex:randomColumn] objectAtIndex:randomBubble] tileButton] removeFromSuperview];
                    [[[[self gameState] columnsArray] objectAtIndex:randomColumn] removeObjectAtIndex:randomBubble];
                }
                else
                {
                    randomColumn++;
                    if (randomColumn > 5)
                        randomColumn -= 6;
                    if ([[[[self gameState] columnsArray] objectAtIndex:randomColumn] count] > 0)
                    {
                        int randomBubble = arc4random() % [[[[self gameState] columnsArray] objectAtIndex:randomColumn] count];
                        [[[[[[self gameState] columnsArray] objectAtIndex:randomColumn] objectAtIndex:randomBubble] tileButton] removeFromSuperview];
                        [[[[self gameState] columnsArray] objectAtIndex:randomColumn] removeObjectAtIndex:randomBubble];
                    }
                    else
                    {
                        randomColumn++;
                        if (randomColumn > 5)
                            randomColumn -= 6;
                        if ([[[[self gameState] columnsArray] objectAtIndex:randomColumn] count] > 0)
                        {
                            int randomBubble = arc4random() % [[[[self gameState] columnsArray] objectAtIndex:randomColumn] count];
                            [[[[[[self gameState] columnsArray] objectAtIndex:randomColumn] objectAtIndex:randomBubble] tileButton] removeFromSuperview];
                            [[[[self gameState] columnsArray] objectAtIndex:randomColumn] removeObjectAtIndex:randomBubble];
                        }
                        else
                        {
                            [[self delegate] setGameLossAnimationIsActive:NO];
                            [self setGameLossAnimationAccumulatedDuration:0];
                            individualBubblePopAccumulator = 0;
                            [[self registerLabel] setText:@""];
                            [[self delegate] gameEnded];
                            return;
                        }
                    }
                }
            }
        }
    }
}

- (void)updateForDuration:(NSTimeInterval)argDuration
{
    [[self gameState] setTotalElapsedTime:([[self gameState] totalElapsedTime] + argDuration)];
    [self setWarningIsActive:NO];
    BOOL gameLoss = NO;
    float fallDistance;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        fallDistance = kFallRate_iPad * argDuration;
    else
        fallDistance = kFallRate_iPhone * argDuration;
    float climbDistance = 0;
    float limiter = 1.0f;
    // Determine Limiter
    if ([[self gameState] availableSlowDuration] > 3)
    {
        limiter = 0.10f;
        [[self gameState] setAvailableSlowDuration:([[self gameState] availableSlowDuration] - argDuration)];
    }
    else if ([[self gameState] availableSlowDuration] > 0)
    {
        limiter = 1.0f - ([[self gameState] availableSlowDuration] / 3.33);
        [[self gameState] setAvailableSlowDuration:([[self gameState] availableSlowDuration] - argDuration)];
    }
    else
        [[self gameState] setAvailableSlowDuration:0];
    // Compute Distances
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        climbDistance = (kMinimumSpeed_iPad + [[self gameState] totalElapsedTime] * kAccelerationRate_iPad) * limiter * argDuration;
    else
        climbDistance = (kMinimumSpeed_iPhone + [[self gameState] totalElapsedTime] * kAccelerationRate_iPhone) * limiter * argDuration;
    [[self gameState] setBaseline:([[self gameState] baseline] - climbDistance)];
    for (NSMutableArray *columnArray in [[self gameState] columnsArray])
    {
        for (int tileIndex = [columnArray count] - 1; tileIndex >= 0; tileIndex--)
        {
            seaquationsTile *tile = [columnArray objectAtIndex:tileIndex];
            if ([tile isFalling])
            {
                float targetSeperationDistance;
                if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
                    targetSeperationDistance = ((([columnArray count] - 1) - tileIndex) * kTileHorizontalSeperationDistance_iPad);
                else
                    targetSeperationDistance = ((([columnArray count] - 1) - tileIndex) * kTileHorizontalSeperationDistance_iPhone);
                float remainingFallDistance = [[self gameState] baseline] - targetSeperationDistance - [[tile tileButton] center].y;
                if (remainingFallDistance < fallDistance)
                {
                    [[tile tileButton] setCenter:CGPointMake([[tile tileButton] center].x, [[tile tileButton] center].y + remainingFallDistance)];
                    [tile setIsFalling:NO];
                }
                else
                    [[tile tileButton] setCenter:CGPointMake([[tile tileButton] center].x, [[tile tileButton] center].y + fallDistance)];
            }
            else
                [[tile tileButton] setCenter:CGPointMake([[tile tileButton] center].x, [[tile tileButton] center].y - climbDistance)];
            if ([tile tileType] <= kOperatorDivision)
            {
                if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
                {
                    if ([[tile tileButton] center].y <= kLossLineCenter_iPad)
                        gameLoss = YES;
                    else if ([[tile tileButton] center].y <= (kLossLineCenter_iPad + kWarningBandHeight_iPad))
                        [self setWarningIsActive:YES];
                }
                else
                {
                    if ([[tile tileButton] center].y <= kLossLineCenter_iPhone)
                        gameLoss = YES;
                    else if ([[tile tileButton] center].y <= (kLossLineCenter_iPhone + kWarningBandHeight_iPhone))
                        [self setWarningIsActive:YES];
                }
            }
        }
    }
    if (gameLoss == YES)
    {
        [[self delegate] playGameEndSound];
        [[self delegate] setGameIsActive:NO];
        [[self delegate] setGameLossAnimationIsActive:YES];
        [self setWarningIsActive:NO];
        [[self delegate] stopPlayingWarningSound];
        warningImageDecreasingOpacity = NO;
        warningHasBeenPlayed = NO;
        [[self warningImageView] setAlpha:0.0f];
        [[self clearAllButton] setEnabled:NO];
        [[self backspaceButton] setEnabled:NO];
        return;
    }
    [self updateTilesVisible];
    if ([self warningIsActive])
    {
        if (warningHasBeenPlayed == NO)
        {
            [[self delegate] performSelectorOnMainThread:@selector(startPlayingWarningSound) withObject:nil waitUntilDone:NO];
            warningHasBeenPlayed = YES;
        }
        float deltaAlpha = 0.8 * argDuration / (kWarningPulseTime / 2.0f);
        if (warningImageDecreasingOpacity)
        {
            float newAlpha = [[self warningImageView] alpha] - deltaAlpha;
            if (newAlpha <= 0)
            {
                newAlpha = 0;
                warningImageDecreasingOpacity = NO;
            }
            [[self warningImageView] setAlpha:newAlpha];
        }
        else
        {
            float newAlpha = [[self warningImageView] alpha] + deltaAlpha;
            if (newAlpha >= 0.8)
            {
                newAlpha = 0.8;
                warningImageDecreasingOpacity = YES;
            }
            [[self warningImageView] setAlpha:newAlpha];
        }
    }
    else
    {
        [[self warningImageView] setAlpha:0.0f];
        [[self delegate] stopPlayingWarningSound];
        warningHasBeenPlayed = NO;
    }
}

- (void)updateTilesVisible
{    
    float newRowThreshold;
    float newRowCenter;
    float lossLineCenter;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        newRowThreshold = kNewRowThreshold_iPad;
        newRowCenter = kNewRowCenter_iPad;
        lossLineCenter = kLossLineCenter_iPad;
    }
    else
    {
        newRowThreshold = kNewRowThreshold_iPhone;
        newRowCenter = kNewRowCenter_iPhone;
        lossLineCenter = kLossLineCenter_iPhone;
    }
    if ([[self gameState] baseline] <= newRowThreshold)
    {
        float overshoot = [[self gameState] baseline] - newRowThreshold;
        [[self gameState] generateNewRowOfTiles];
        [self displayNewTilesWithOvershoot:overshoot];
        [[self gameState] setBaseline:(newRowCenter - overshoot)];
    }
    for (NSMutableArray *columnArray in [[self gameState] columnsArray])
    {
        if ([columnArray count] > 0)
            if ([[columnArray objectAtIndex:0] tileType] >= kPowerUpTime)
                if ([[[columnArray objectAtIndex:0] tileButton] center].y <= lossLineCenter && [[columnArray objectAtIndex:0] isFalling] == NO)
                    [self removeTile:[columnArray objectAtIndex:0]];
    }
}

- (void)displayNewTilesWithOvershoot:(float)argOvershoot
{
    for (int columnIndex = 0; columnIndex < 6; columnIndex++)
    {
        seaquationsTile *newTile = [[[[self gameState] columnsArray] objectAtIndex:columnIndex] lastObject];
        [[self boardView] addSubview:[newTile tileButton]];
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            [[newTile tileButton] setCenter:CGPointMake((kTileHorizontalOffset_iPad + kTileHorizontalSeperationDistance_iPad * columnIndex), kNewRowCenter_iPad - argOvershoot)];
        else
            [[newTile tileButton] setCenter:CGPointMake((kTileHorizontalOffset_iPhone + kTileHorizontalSeperationDistance_iPhone * columnIndex), kNewRowCenter_iPhone - argOvershoot)];
    }
}

#pragma mark -
#pragma mark Other Methods

- (void)removeTile:(seaquationsTile*)argTile
{
    for (int column = 0; column < 6; column++)
    {
        NSUInteger tileIndex = [[[[self gameState] columnsArray] objectAtIndex:column] indexOfObject:argTile];
        if (tileIndex != NSNotFound)
        {
            [[argTile tileButton] removeFromSuperview];
            [[[[self gameState] columnsArray] objectAtIndex:column] removeObjectAtIndex:tileIndex];
            if (tileIndex > 0)
            {
                for (int tile = tileIndex; tile >= 0; tile--)
                {
                    [[[[[self gameState] columnsArray] objectAtIndex:column] objectAtIndex:tile] setIsFalling:YES];
                }
            }
        }
    }
}

- (void)updateDisplay
{
    // Clear all tiles from the view
    [[[self boardView] subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    // Add all tiles to the view
    if ([self gameState])
    {
        for (NSMutableArray *columnArray in [[self gameState] columnsArray])
        {
            for (seaquationsTile *tile in columnArray)
            {
                [[self boardView] addSubview:[tile tileButton]];
            }
        }
    }
    [[self scoreLabel] setText:[[self gameState] scoreString]];
    // Update the UI
    if ([[[self gameState] registerArray] count] == 0)
    {
        [[self registerLabel] setText:[[self gameState] stringForCurrentEquation]];
        [[self backspaceButton] setEnabled:NO];
        [[self clearAllButton] setEnabled:NO];
    }
}

- (seaquationsGameState*)gameState
{
    return [[self delegate] currentGameState];
}

#pragma mark -
#pragma mark Properties

// Model
@synthesize popBubbleThisFrame;
@synthesize warningIsActive;
@synthesize gameLossAnimationAccumulatedDuration;
// View
@synthesize boardView;
@synthesize warningImageView;
@synthesize registerLabel;
@synthesize backspaceButton;
@synthesize clearAllButton;
@synthesize scoreLabel;
@synthesize mainMenuButton;
// Controller
@synthesize delegate;
@synthesize previousUpdateDate;
@synthesize timer;


@end
