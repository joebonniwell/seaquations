//
//  seaquationsAppDelegate.m
//  seaquations
//
//  Created by goVertex on 7/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "seaquationsAppDelegate.h"

@implementation seaquationsAppDelegate

@synthesize window=_window;

#pragma mark - GameKit Methods

- (BOOL)isGameCenterAvailable
{
    BOOL localPlayerClassAvailable = (NSClassFromString(@"GKLocalPlayer")) != nil;
    
    NSString *requiredSystemOSVersion = @"4.1";
    NSString *currentSystemOSVersion = [[UIDevice currentDevice] systemVersion];
    BOOL osVersionSupported = ([currentSystemOSVersion compare:requiredSystemOSVersion options:NSNumericSearch] != NSOrderedAscending);
    
    return (localPlayerClassAvailable && osVersionSupported);
}

- (void)authenticateLocalPlayer
{
    GKLocalPlayer *localPlayer = [GKLocalPlayer localPlayer];
    [localPlayer authenticateWithCompletionHandler:^(NSError *error)
    {
        if ([localPlayer isAuthenticated])
        {
            // Tasks for authenticated player...
        }
    }];
    
}

- (void)reportScore:(int64_t)score forCategory:(NSString*)category
{
    GKScore *scoreReporter = [[[GKScore alloc] initWithCategory:category] autorelease];
    scoreReporter.value = score;
    
    [scoreReporter reportScoreWithCompletionHandler:^(NSError *error) 
    {
        if (error != nil)
        {
            // handle the reporting error
            
            // -> potentially add the score to a dictionary of scoresToPost for later attempts at posting scores
        }
    }];
}

- (void)showLeaderBoard
{
    GKLeaderboardViewController *leaderBoardController = [[GKLeaderboardViewController alloc] init];
    
    if (leaderBoardController != nil)
    {
        //[leaderBoardController setLeaderboardDelegate:[self menuViewController]];
        //[[self menuViewController] presentModalViewController:leaderBoardController animated:YES];
    }
}

- (void)leaderBoardViewControllerDidFinish:(GKLeaderboardViewController*)leaderBoardViewController
{
    //[[self menuViewController] dismissModalViewControllerAnimated:YES];
}

//--------

#pragma mark -
#pragma mark Object Lifecycle

+ (void)initialize
{
    [super initialize];
    NSArray *defaultsDictionaryKeys = [NSArray arrayWithObjects:@"PreviouslyLaunched", @"InProgressGame", @"EasyDifficulty", @"SoundEnabled", @"CanAskForRating", @"HasRatedPreviously", @"LaunchNumber", @"PreviousLaunchAsk", nil];
    NSArray *defaultsDictionaryObjects = [NSArray arrayWithObjects:[NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO], [NSNumber numberWithBool:YES], [NSNumber numberWithBool:YES], [NSNumber numberWithBool:NO], [NSNumber numberWithInt:0], [NSNumber numberWithInt:0], nil];
    NSDictionary *defaults = [NSDictionary dictionaryWithObjects:defaultsDictionaryObjects forKeys:defaultsDictionaryKeys];
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaults];
}

- (void)dealloc
{
    [_window release];
    // View Controllers
    [self setGameViewController:nil];
    [self setMenuViewController:nil];
    [self setBackgroundViewController:nil];
    [self setTransitionViewController:nil];
    [self setGoVertexViewController:nil];
    // Data
    [self setCurrentGameState:nil];
    [self setGameEndAudioPlayer:nil];
    [self setBubbleTapAudioPlayerPrimary:nil];
    [self setBubbleTapAudioPlayerSecondary:nil];
    [self setAlarmAudioPlayer:nil];
    // Update
    [self setMasterDisplayLink:nil];
    // Stored Data
    if (highScoresArray_gv)
    {
        [highScoresArray_gv release];
        highScoresArray_gv = nil;
    }
    if (gameStatsDictionary_gv)
    {
        [gameStatsDictionary_gv release];
        gameStatsDictionary_gv = nil;
    }
    if (newHighScoreValues)
    {
        [newHighScoreValues release];
        newHighScoreValues = nil;
    }
    if (tileNormal_)
    {
        [tileNormal_ release];
        tileNormal_ = nil;
    }
    if (tileSelected_)
    {
        [tileSelected_ release];
        tileSelected_ = nil;
    }
    if (powerUpTime_)
    {
        [powerUpTime_ release];
        powerUpTime_ = nil;
    }
    if (powerUpScore_)
    {
        [powerUpScore_ release];
        powerUpScore_ = nil;
    }
    if (powerUpTiles_)
    {
        [powerUpTiles_ release];
        powerUpTiles_ = nil;
    }
	[super dealloc];
}

#pragma mark -
#pragma mark Application Lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self.window makeKeyAndVisible];
    // Defaults
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"PreviouslyLaunched"] == NO)
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"PreviouslyLaunched"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    // Create the backgroundViewController;
    SeaquationsBackgroundViewController *tempBackgroundViewController = [[SeaquationsBackgroundViewController alloc] init];
    [[self window] addSubview:[tempBackgroundViewController view]];
    [self setBackgroundViewController:tempBackgroundViewController];
    [tempBackgroundViewController release];
    // Call the load methods
    [self performSelectorOnMainThread:@selector(finishLoading) withObject:nil waitUntilDone:NO];
    [[LocalyticsSession sharedLocalyticsSession] startSession:LocalyticsIdentifier];
    return YES;
}

- (void)finishLoading
{
    // goVertexViewController
    SeaquationsGoVertexViewController *tempGoVertexViewController = [[SeaquationsGoVertexViewController alloc] init];
    [tempGoVertexViewController setDelegate:self];
    [self setGoVertexViewController:tempGoVertexViewController];
    [tempGoVertexViewController release];
    // Create the gameViewController
    SeaquationsGameViewController *tempGameViewController = [[SeaquationsGameViewController alloc] init];
    [tempGameViewController setDelegate:self];
    [self setGameViewController:tempGameViewController];
    [[self window] insertSubview:[[self gameViewController] view] atIndex:0];
    [tempGameViewController release];
    // Create the menuViewController
    SeaquationsMenuViewController *tempMenuViewController = [[SeaquationsMenuViewController alloc] init];
    [tempMenuViewController setDelegate:self];
    [[tempMenuViewController view] setAlpha:0.0f];
    [[self window] addSubview:[tempMenuViewController view]];
    [self setMenuViewController:tempMenuViewController];
    [tempMenuViewController release];
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"EasyDifficulty"] == YES)
        [[self menuViewController] displayDifficultyEasy];
    else
        [[self menuViewController] displayDifficultyNormal];
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"SoundEnabled"] == YES)
        [[self menuViewController] displaySoundOn];
    else
        [[self menuViewController] displaySoundOff];
    // Create the transitionViewController
    SeaquationsTransitionViewController *tempTransitionViewController = [[SeaquationsTransitionViewController alloc] init];
    [tempTransitionViewController setDelegate:self];
    [self setTransitionViewController:tempTransitionViewController];
    [[self window] addSubview:[tempTransitionViewController view]];
    [tempTransitionViewController release];
    // Audio Session
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryAmbient error:NULL];
    [[AVAudioSession sharedInstance] setActive:YES error:NULL];
    // gameEndAudioPlayer
    NSString *gameEndSoundPath = [[NSBundle mainBundle] pathForResource:@"Seaquations-GameEndSound" ofType:@"m4a"];
    NSURL *gameEndSoundURL = [NSURL URLWithString:gameEndSoundPath];
    AVAudioPlayer *tempGameEndAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:gameEndSoundURL error:NULL];
    [tempGameEndAudioPlayer setDelegate:self];
    [tempGameEndAudioPlayer setVolume:0.5f];
    [self setGameEndAudioPlayer:tempGameEndAudioPlayer];
    [tempGameEndAudioPlayer release];
    // alarmAudioPlayer
    NSString *alarmSoundPath = [[NSBundle mainBundle] pathForResource:@"Seaquations-AlarmSound" ofType:@"m4a"];
    NSURL *alarmSoundURL = [NSURL URLWithString:alarmSoundPath];
    AVAudioPlayer *tempAlarmAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:alarmSoundURL error:NULL];
    [tempAlarmAudioPlayer setDelegate:self];
    [tempAlarmAudioPlayer setVolume:0.5f];
    [self setAlarmAudioPlayer:tempAlarmAudioPlayer];
    [tempAlarmAudioPlayer release];
    // bubbleTapAudioPlayers
    NSString *bubbleTapSoundPath = [[NSBundle mainBundle] pathForResource:@"Seaquations-BubbleTapSound" ofType:@"m4a"];
    NSURL *bubbleTapSoundURL = [NSURL URLWithString:bubbleTapSoundPath];
    // bubbleTapAudioPlayerSecondary
    AVAudioPlayer *tempBubbleTapAudioPlayerSecondary = [[AVAudioPlayer alloc] initWithContentsOfURL:bubbleTapSoundURL error:NULL];
    [tempBubbleTapAudioPlayerSecondary setDelegate:self];
    [tempBubbleTapAudioPlayerSecondary setVolume:0.5f];
    [self setBubbleTapAudioPlayerSecondary:tempBubbleTapAudioPlayerSecondary];
    [tempBubbleTapAudioPlayerSecondary release];
    [tempBubbleTapAudioPlayerSecondary prepareToPlay];
    // bubbleTapAudioPlayerPrimary
    AVAudioPlayer *tempBubbleTapAudioPlayerPrimary = [[AVAudioPlayer alloc] initWithContentsOfURL:bubbleTapSoundURL error:NULL];
    [tempBubbleTapAudioPlayerPrimary setDelegate:self];
    [tempBubbleTapAudioPlayerPrimary setVolume:0.5f];
    [self setBubbleTapAudioPlayerPrimary:tempBubbleTapAudioPlayerPrimary];
    [tempBubbleTapAudioPlayerPrimary release];
    [tempBubbleTapAudioPlayerPrimary prepareToPlay];
    // Master Display Link
    CADisplayLink *tempMasterDisplayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(actionForDisplayLink:)];
    [self setMasterDisplayLink:tempMasterDisplayLink];
    [[self masterDisplayLink] addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    // Check for a previous game state
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"InProgressGame"] == YES)
        [self setActiveTransition:kMainMenuInProgressGameFromLoadTransition];
    else
        [self setActiveTransition:kMainMenuFromLoadTransition];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [[[self backgroundViewController] backgroundCloudImageView] setAlpha:1.0f];
    [[[self backgroundViewController] backgroundFishTravelingLeftImageView] setAlpha:1.0f];
    [[[self backgroundViewController] backgroundFishTravelingRightImageView] setAlpha:1.0f];
    
    [[LocalyticsSession sharedLocalyticsSession] resume];
    [[LocalyticsSession sharedLocalyticsSession] upload];
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    if ([self gameIsActive])
    {
        [self setGameIsActive:NO];
        [self setActiveTransition:kMainMenuInProgressGameFromGameTransition];
    }
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [self saveGameStatsToFile];
    [self saveGameStateToFile];
    [[LocalyticsSession sharedLocalyticsSession] close];
    [[LocalyticsSession sharedLocalyticsSession] upload];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [self saveGameStatsToFile];
    [self saveGameStateToFile];
    [[LocalyticsSession sharedLocalyticsSession] close];
    [[LocalyticsSession sharedLocalyticsSession] upload];
}

#pragma mark -
#pragma mark Animation Control

- (void)actionForDisplayLink:(CADisplayLink*)argDisplayLink
{
    if (![argDisplayLink duration])
        return;
    if (gameIsActive)
        [[self gameViewController] updateForDuration:[argDisplayLink duration]];
    if (gameLossAnimationIsActive)
        [[self gameViewController] updateGameLossAnimationForDuration:[argDisplayLink duration]];
    [[self backgroundViewController] updateBackgroundFishImageViewPositionForDuration:[argDisplayLink duration]];
    [[self backgroundViewController] updateBackgroundCloudImageViewPositionForDuration:[argDisplayLink duration]];
    if ([self activeTransition] > kNoTransition)
    {
        if ([self elapsedTransitionTime] == 0)
        {
            if ([self activeTransition] == kMainMenuFromGameTransition || [self activeTransition] == kMainMenuInProgressGameFromGameTransition || [self activeTransition] == kPostGameNewHighScoreMenuFromGameTransition || [self activeTransition] == kPostGameMenuFromGameTransition)
            {
                [[[self gameViewController] mainMenuButton] setHidden:YES];
                [[[self gameViewController] scoreLabel] setHidden:YES];
            }
            [[self transitionViewController] transitionStarted];
        }
        [self setElapsedTransitionTime:([self elapsedTransitionTime] + [argDisplayLink duration])];
        if ([self activeTransition] == kMainMenuFromGameTransition || [self activeTransition] == kMainMenuInProgressGameFromGameTransition || [self activeTransition] == kPostGameMenuFromGameTransition || [self activeTransition] == kPostGameNewHighScoreMenuFromGameTransition)
        {
            [[self backgroundViewController] updateForegroundCloudImageViewPositionsOffscreenForDuration:[argDisplayLink duration]];
            [[self transitionViewController] updateTransitionFromRightToLeftWithDuration:[argDisplayLink duration]];
        }
        else if ([self activeTransition] == kMainMenuFromMenuTransition || [self activeTransition] == kMainMenuInProgressGameFromMenuTransition)
        {
            [[self transitionViewController] updateTransitionFromRightToLeftWithDuration:[argDisplayLink duration]];
        }
        else if ([self activeTransition] == kHighScoreMenuFromMenuTransition || [self activeTransition] == kHowToPlayMenuFromMenuTransition)
        {
            [[self transitionViewController] updateTransitionFromLeftToRightWithDuration:[argDisplayLink duration]];
        }
        else if ([self activeTransition] == kGameFromMainMenuTransition)
        {
            [[self backgroundViewController] updateForegroundCloudImageViewPositionsOnscreenForDuration:[argDisplayLink duration]];
            [[self transitionViewController] updateTransitionFromLeftToRightWithDuration:[argDisplayLink duration]];
        }
        // Check for Halfway Complete
        if ([self firstHalfTransitionElapsed] == NO && ([self elapsedTransitionTime] > (0.5 * kTransitionAnimationDuration)))
        {
            if ([self activeTransition] == kGameFromMainMenuTransition)
                [self displayGame];
            else
                [self displayMenu];
            [self setFirstHalfTransitionElapsed:YES];
        }
        // Check for Complete
        if ([self elapsedTransitionTime] >= kTransitionAnimationDuration)
        {
            // Animation completion
            if ([self activeTransition] == kGameFromMainMenuTransition)
            {
                [[[self gameViewController] mainMenuButton] setHidden:NO];
                [[[self gameViewController] scoreLabel] setHidden:NO];
            }
            // Transition Housekeeping
            [[self transitionViewController] transitionEnded];
            [self setActiveTransition:kNoTransition];
            [self setElapsedTransitionTime:0];
            [self setFirstHalfTransitionElapsed:NO];
        }
    }
}

#pragma mark -
#pragma mark MenuViewController Delegate Methods

- (void)newGame
{
    [self loadGameStateUsingExistingGameState:NO];
    [[self gameViewController] updateDisplay];
    
    // Show the game
    [[self gameViewController] gameWillAppear]; // Is this necessary?
    
    [self setActiveTransition:kGameFromMainMenuTransition];
    [self setGameIsActive:YES];
    
    NSDictionary *dictionary;
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"EasyDifficulty"] == YES)
        dictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"Easy", @"Difficulty", nil];
    else
        dictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"Normal", @"Difficulty", nil];
    [[LocalyticsSession sharedLocalyticsSession] tagEvent:@"New Game" attributes:dictionary];
}

- (void)resumeGame
{
    if (![self currentGameState])
    {
        [self loadGameStateUsingExistingGameState:YES];
        [[self gameViewController] updateDisplay];
    }
    [self setActiveTransition:kGameFromMainMenuTransition];
    [self setGameIsActive:YES];
}

- (void)showMainMenuFromMenu
{
    if ([self currentGameState])
        [self setActiveTransition:kMainMenuInProgressGameFromMenuTransition];
    else
        [self setActiveTransition:kMainMenuFromMenuTransition];
}

- (void)showMainMenuFromGame
{
    if ([self currentGameState])
        [self setActiveTransition:kMainMenuInProgressGameFromGameTransition];
    else
        [self setActiveTransition:kMainMenuFromGameTransition];
}

- (void)showHighScoresMenu
{
    NSInteger totalGamesPlayed = [[[self gameStatsDictionary] valueForKey:@"TotalGamesPlayed"] integerValue];
    NSInteger totalEquations = [[[self gameStatsDictionary] valueForKey:@"TotalEquationsMade"] integerValue];
    NSTimeInterval totalPlayTime = [[[self gameStatsDictionary] valueForKey:@"TotalTimePlayed"] doubleValue];
    // Send these numbers to be used in the post game summary
    [[self menuViewController] displayHighScoresMenuTotalGamesPlayedValue:totalGamesPlayed];
    [[self menuViewController] displayHighScoresMenuTotalEquationsValue:totalEquations];
    [[self menuViewController] displayHighScoresMenuTotalTimePlayedValue:totalPlayTime];
    [[[[self menuViewController] highScoresMenu] highScoresTableView] reloadData];
    // Transition the view
    [self setActiveTransition:kHighScoreMenuFromMenuTransition];
}

- (void)showHowToPlayMenu
{
    [self setActiveTransition:kHowToPlayMenuFromMenuTransition];
}

- (void)showPostGameMenu
{
    [self setActiveTransition:kPostGameMenuFromGameTransition];
}

- (void)showPostGameMenuWithNewHighScore
{
    [self setActiveTransition:kPostGameNewHighScoreMenuFromGameTransition];
}

- (void)resetScoresAndStats
{
    // Clear High Scores Array
    for (int highScore = 0; highScore < [[self highScoresArray] count]; highScore++)
    {
        [[self highScoresArray] replaceObjectAtIndex:highScore withObject:[NSDictionary dictionaryWithObjectsAndKeys:@"No Score", @"PlayerName", [NSNumber numberWithInteger:0], @"Score", nil]];
    }
    // Clear Stats Dictionary
    [[self gameStatsDictionary] setValue:[NSNumber numberWithInteger:0] forKey:@"TotalGamesPlayed"];
    [[self gameStatsDictionary] setValue:[NSNumber numberWithDouble:0] forKey:@"TotalTimePlayed"];
    [[self gameStatsDictionary] setValue:[NSNumber numberWithDouble:0] forKey:@"LongestGamePlayed"];
    [[self gameStatsDictionary] setValue:[NSNumber numberWithInteger:0] forKey:@"TotalEquationsMade"];
    // Save
    [self saveHighScoresToFile];
    [self saveGameStatsToFile];
}

- (void)recordCurrentHighScoreWithName:(NSString *)argPlayerName
{
    NSInteger index = [[newHighScoreValues objectForKey:@"Index"] integerValue];
    NSMutableDictionary *newHighScore = [NSMutableDictionary dictionaryWithObjectsAndKeys:argPlayerName, @"PlayerName", [newHighScoreValues objectForKey:@"Score"], @"Score", nil];
    [[self highScoresArray] insertObject:newHighScore atIndex:index];
    if ([[self highScoresArray] count] > 10)
        [[self highScoresArray] removeLastObject];
    [self saveHighScoresToFile];
}

- (void)showGoVertexView
{
    [[self menuViewController] setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
    [[self menuViewController] setModalPresentationStyle:UIModalPresentationFullScreen];
    [[self menuViewController] presentModalViewController:[self goVertexViewController] animated:YES];
    [[LocalyticsSession sharedLocalyticsSession] tagEvent:@"Opened goVertex VC"];
}

- (void)stopAllSounds
{
    [[self alarmAudioPlayer] stop];
    [[self alarmAudioPlayer] setCurrentTime:0];
    [[self bubbleTapAudioPlayerPrimary] stop];
    [[self bubbleTapAudioPlayerPrimary] setCurrentTime:0];
    [[self bubbleTapAudioPlayerSecondary] stop];
    [[self bubbleTapAudioPlayerSecondary] setCurrentTime:0];
    [[self gameEndAudioPlayer] stop];
    [[self gameEndAudioPlayer] setCurrentTime:0];
}

#pragma mark -
#pragma mark GoVertexViewController Delegate Methods

- (void)dismissGoVertexViewController
{
    [[self menuViewController] dismissModalViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark GameViewController Delegate Methods

- (void)gameEnded
{
    // Game Totals
    NSInteger gameScore = [[self currentGameState] currentScore];
    NSTimeInterval gameTime = [[self currentGameState] totalElapsedTime];
    NSInteger gameEquations = [[self currentGameState] totalEquationsCreated];
    // Analytics
    NSString *gameScoreString;
    if (gameScore <= 20)
        gameScoreString = @"<=20";
    else if (gameScore <= 40)
        gameScoreString = @"21-40";
    else if (gameScore <= 60)
        gameScoreString = @"41-60";
    else if (gameScore <= 80)
        gameScoreString = @"61-80";
    else if (gameScore <= 100)
        gameScoreString = @"81-100";
    else if (gameScore <= 200)
        gameScoreString = @"100-200";
    else
        gameScoreString = @">200";
    NSString *gameDurationString;
    if (gameTime < 60)
        gameDurationString = @"< 1";
    else if (gameScore <= 60 * 3)
        gameDurationString = @"1-3";
    else if (gameScore <= 60 * 5)
        gameDurationString = @"3-5";
    else if (gameScore <= 60 * 7)
        gameDurationString = @"5-7";
    else if (gameScore <= 60 * 9)
        gameDurationString = @"7-9";
    else if (gameScore <= 60 * 11)
        gameDurationString = @"9-11";
    else
        gameDurationString = @">11";
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:gameScoreString, @"Game Score", gameDurationString, @"Game Duration", nil];
    [[LocalyticsSession sharedLocalyticsSession] tagEvent:@"Game Ended" attributes:dictionary];
    // Add to Global Totals
    NSInteger newTotalGamesPlayed = [[[self gameStatsDictionary] valueForKey:@"TotalGamesPlayed"] integerValue] + 1;
    [[self gameStatsDictionary] setValue:[NSNumber numberWithInteger:newTotalGamesPlayed] forKey:@"TotalGamesPlayed"];
    NSTimeInterval newTotalElapsedGameTime = [[[self gameStatsDictionary] valueForKey:@"TotalTimePlayed"] doubleValue] + gameTime;
    [[self gameStatsDictionary] setValue:[NSNumber numberWithDouble:newTotalElapsedGameTime] forKey:@"TotalTimePlayed"];
    NSInteger newAllTimeEquationsCreated = [[[self gameStatsDictionary] valueForKey:@"TotalEquationsMade"] integerValue] + gameEquations;
    [[self gameStatsDictionary] setValue:[NSNumber numberWithInteger:newAllTimeEquationsCreated] forKey:@"TotalEquationsMade"];
    [self saveGameStatsToFile];
    // Transition to post game menu
    BOOL newHighScore = NO;
    int newHighScoreIndex = 9;
    if (gameScore > [[[[self highScoresArray] lastObject] valueForKey:@"Score"] integerValue])
    {
        newHighScore = YES;
        for (int highScoreIndex = [[self highScoresArray] count] - 2; highScoreIndex >= 0; highScoreIndex--)
        {
            if (gameScore > [[[[self highScoresArray] objectAtIndex:highScoreIndex] valueForKey:@"Score"] integerValue])
                newHighScoreIndex = highScoreIndex;
        }
        if (newHighScoreValues)
            [newHighScoreValues release];
        newHighScoreValues = [[NSMutableDictionary alloc] initWithObjectsAndKeys:[NSNumber numberWithInteger:newHighScoreIndex], @"Index", [NSNumber numberWithInteger:gameScore], @"Score", [NSString stringWithFormat:@""], @"PlayerName", nil];
    }
    if (newHighScore == YES)
    {
        [self setActiveTransition:kPostGameNewHighScoreMenuFromGameTransition];
        [[self menuViewController] displayPostGameNewHighScorePlace:(newHighScoreIndex + 1)];
        [[self menuViewController] displayPostGameNewHighScoreValue:gameScore];
        [[self menuViewController] displayPostGameNewHighScoreEquationsValue:gameEquations];
        [[self menuViewController] displayPostGameNewHighScoreTimeValue:gameTime];
    }
    else
    {
        [self setActiveTransition:kPostGameMenuFromGameTransition];
        [[self menuViewController] displayPostGameScoreValue:gameScore];
        [[self menuViewController] displayPostGameEquationsValue:gameEquations];
        [[self menuViewController] displayPostGameTimeValue:gameTime];
    }
    [self setCurrentGameState:nil];
    [self saveGameStateToFile];
}

- (void)startPlayingWarningSound
{
    [[self alarmAudioPlayer] play];
}

- (void)stopPlayingWarningSound
{
    if ([[self alarmAudioPlayer] isPlaying] == YES)
    {
        [[self alarmAudioPlayer] stop];
        [[self alarmAudioPlayer] setCurrentTime:0];
        [[self alarmAudioPlayer] prepareToPlay];
    }
}

- (NSInteger)numberOfHighScores
{
    return [[self highScoresArray] count];
}

#pragma mark -
#pragma mark Display Methods

- (void)displayMenu
{
    switch ([self activeTransition]) 
    {
        case kMainMenuFromLoadTransition:
            [[self menuViewController] transitionToMenuState:kMainMenuState];
            break;
        case kMainMenuInProgressGameFromLoadTransition:
            [[self menuViewController] transitionToMenuState:kMainMenuInProgressGameState];
            break;
        case kMainMenuFromGameTransition:
            [[self menuViewController] transitionToMenuState:kMainMenuState];
            break;
        case kMainMenuInProgressGameFromGameTransition:
            [[self menuViewController] transitionToMenuState:kMainMenuInProgressGameState];
            break;
        case kMainMenuFromMenuTransition:
            [[self menuViewController] transitionToMenuState:kMainMenuState];
            break;
        case kMainMenuInProgressGameFromMenuTransition:
            [[self menuViewController] transitionToMenuState:kMainMenuInProgressGameState];
            break;
        case kPostGameMenuFromGameTransition:
            [[self menuViewController] transitionToMenuState:kPostGameMenuState];
            break;
        case kPostGameNewHighScoreMenuFromGameTransition:
            [[self menuViewController] transitionToMenuState:kPostGameMenuNewHighScoreState];
            break;
        case kHighScoreMenuFromMenuTransition:
            [[self menuViewController] transitionToMenuState:kHighScoresMenuState];
            break;
        case kHowToPlayMenuFromMenuTransition:
            [[self menuViewController] transitionToMenuState:kHowToPlayMenuState];
            break;
        default:
            break;
    }
    NSInteger menuViewIndex = [[[self window] subviews] indexOfObject:[[self menuViewController] view]];
    if (menuViewIndex == 0)
    {
        [[self window] exchangeSubviewAtIndex:0 withSubviewAtIndex:2];
    }
    else if (menuViewIndex == 2)
        [[[self menuViewController] view] setAlpha:1.0f];
    if ([[self menuViewController] currentMenuState] == kPostGameMenuNewHighScoreState)
        [[[[self menuViewController] postGameMenuNewHighScore] highScoreNameTextField] becomeFirstResponder];
}

- (void)displayGame
{
    NSInteger gameViewIndex = [[[self window] subviews] indexOfObject:[[self gameViewController] view]];
    if (gameViewIndex == 0)
        [[self window] exchangeSubviewAtIndex:0 withSubviewAtIndex:2];
}

#pragma mark -
#pragma mark Sound Methods

- (void)playBubbleTapSound
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"SoundEnabled"] == YES)
    {
        if ([[self bubbleTapAudioPlayerPrimary] isPlaying])
            [[self bubbleTapAudioPlayerSecondary] play];
        else
            [[self bubbleTapAudioPlayerPrimary] play];
    }
}

- (void)playAlarmSound
{   
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"SoundEnabled"] == YES)
    {
        [[self alarmAudioPlayer] play];
    }
}

- (void)playGameEndSound
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"SoundEnabled"] == YES)
    {
        [[self gameEndAudioPlayer] play];
    }
}

#pragma mark -
#pragma mark Loading Methods

- (void)loadGameStateUsingExistingGameState:(BOOL)argUseExisting
{
    seaquationsGameState *newGameState = nil;
    if (argUseExisting == YES)
        newGameState = [NSKeyedUnarchiver unarchiveObjectWithFile:[self gameStateFilePath]];
    if (!newGameState)
    {
        newGameState = [[[seaquationsGameState alloc] initWithEasyDifficulty:[[NSUserDefaults standardUserDefaults] boolForKey:@"EasyDifficulty"]] autorelease];  // Here is a good place to log an error if we have problems loading a supposedly existing gamestate
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
            [newGameState setBaseline:kNewRowCenter_iPad];
        else
            [newGameState setBaseline:kNewRowCenter_iPhone];
    }
    [self setCurrentGameState:newGameState];
    [[self currentGameState] setDelegate:self];
    [[self currentGameState] configure];    // Where to implement the difficulty?
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"InProgressGame"];
    [NSKeyedArchiver archiveRootObject:[self currentGameState] toFile:[self gameStateFilePath]];
}

#pragma mark -
#pragma mark File Methods

- (void)saveGameStateToFile
{
    if ([self currentGameState])
    {
        if ([[self currentGameState] isGameComplete] == NO)
        {
            [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"InProgressGame"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            [NSKeyedArchiver archiveRootObject:[self currentGameState] toFile:[self gameStateFilePath]];
        }
        else
        {
            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"InProgressGame"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }
    else
    {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"InProgressGame"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)saveGameStatsToFile
{
    [NSKeyedArchiver archiveRootObject:[self gameStatsDictionary] toFile:[self gameStatsFilePath]];
}

- (void)saveHighScoresToFile
{
    [NSKeyedArchiver archiveRootObject:[self highScoresArray] toFile:[self highScoresFilePath]];
}

#pragma mark -
#pragma mark File Helper Methods

- (NSString*)gameStateFilePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    return [documentDirectory stringByAppendingPathComponent:@"/LastGameState.data"];
}

- (NSString*)gameStatsFilePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    return [documentDirectory stringByAppendingFormat:@"/GameStats.data"];
}

- (NSString*)highScoresFilePath
{
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    return [documentDirectory stringByAppendingFormat:@"/HighScores.data"];
}

#pragma mark -
#pragma mark Data Methods

- (NSMutableDictionary*)gameStatsDictionary
{
    if (gameStatsDictionary_gv)
        return gameStatsDictionary_gv;
    NSDictionary *tempGameStatsDictionary = [NSKeyedUnarchiver unarchiveObjectWithFile:[self gameStatsFilePath]];
    if (tempGameStatsDictionary)
        gameStatsDictionary_gv = [tempGameStatsDictionary mutableCopy];
    else
    {
        NSArray *gameStatsKeys = [NSArray arrayWithObjects:@"TotalGamesPlayed", @"TotalTimePlayed", @"LongestGamePlayed", @"TotalEquationsMade", nil];
        NSArray *gameStatsObjects = [NSArray arrayWithObjects:[NSNumber numberWithInteger:0], [NSNumber numberWithDouble:0], [NSNumber numberWithDouble:0], [NSNumber numberWithInteger:0], nil];
        gameStatsDictionary_gv = [[NSMutableDictionary alloc] initWithObjects:gameStatsObjects forKeys:gameStatsKeys];
        [NSKeyedArchiver archiveRootObject:gameStatsDictionary_gv toFile:[self gameStatsFilePath]];
    }
    return gameStatsDictionary_gv;
}

- (NSMutableArray*)highScoresArray
{
    if (highScoresArray_gv)
        return highScoresArray_gv;
    NSArray *tempHighScoresArray = [NSKeyedUnarchiver unarchiveObjectWithFile:[self highScoresFilePath]];
    if (tempHighScoresArray)
        highScoresArray_gv = [tempHighScoresArray mutableCopy];
    else
    {
        highScoresArray_gv = [[NSMutableArray alloc] init];
        for (int index = 0; index < 10; index++)
        {
            NSMutableDictionary *newHighScore = [NSMutableDictionary dictionaryWithObjectsAndKeys:[NSString string], @"PlayerName", [NSNumber numberWithInteger:0], @"Score", nil];
            [highScoresArray_gv addObject:newHighScore];
        }
        [NSKeyedArchiver archiveRootObject:highScoresArray_gv toFile:[self highScoresFilePath]];
    }
    return highScoresArray_gv;
}

#pragma mark -
#pragma mark GVGameStateDelegate Methods

- (UIButton*)tileButtonForType:(NSInteger)argTileType
{
    UIButton *tempButton = [UIButton buttonWithType:UIButtonTypeCustom];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        [tempButton setFrame:CGRectMake(0.0f, 0.0f, 100.0f, 100.0f)];
        [[tempButton titleLabel] setFont:[UIFont boldSystemFontOfSize:48.0f]];
    }
    else
    {
        [tempButton setFrame:CGRectMake(0.0f, 0.0f, 44.0f, 44.0f)];
        [[tempButton titleLabel] setFont:[UIFont boldSystemFontOfSize:24.0f]];
    }
    [tempButton setBackgroundImage:[self tileImageForSymbol:argTileType] forState:UIControlStateNormal];
    [tempButton setBackgroundImage:[self tileHighlightImageForSymbol:argTileType] forState:UIControlStateHighlighted];
    [tempButton setBackgroundImage:[self tileHighlightImageForSymbol:argTileType] forState:(UIControlStateHighlighted|UIControlStateSelected)];
    [tempButton setBackgroundImage:[self tileHighlightImageForSymbol:argTileType] forState:UIControlStateDisabled];
    [tempButton setBackgroundImage:[self tileHighlightImageForSymbol:argTileType] forState:UIControlStateSelected];
    [tempButton setBackgroundImage:[self tileHighlightImageForSymbol:argTileType] forState:(UIControlStateDisabled|UIControlStateSelected)];
    [tempButton setSelected:NO];
    [tempButton setEnabled:YES];
    return tempButton;
}

- (void)tileWasSelected:(seaquationsTile*)argTile
{
    [[self gameViewController] tileWasSelected:argTile];
}

- (UIImage*)tileImageForSymbol:(NSInteger)argSymbol
{
    if (argSymbol == kPowerUpTime)
        return [self powerUpTime];
    if (argSymbol == kPowerUpScore)
        return [self powerUpScore];
    if (argSymbol == kPowerUpTiles)
        return [self powerUpTiles];
    return [self tileNormal];
}

- (UIImage*)tileHighlightImageForSymbol:(NSInteger)argSymbol
{
    if (argSymbol == kPowerUpTime)
        return [self powerUpTime];
    if (argSymbol == kPowerUpScore)
        return [self powerUpScore];
    if (argSymbol == kPowerUpTiles)
        return [self powerUpTiles];
    return [self tileSelected];
}

- (UIImage*)tileSelectedImageForSymbol:(NSInteger)argSymbol
{
    if (argSymbol == kPowerUpTime)
        return [self powerUpTime];
    if (argSymbol == kPowerUpScore)
        return [self powerUpScore];
    if (argSymbol == kPowerUpTiles)
        return [self powerUpTiles];
    return [self tileSelected];
}

#pragma mark -
#pragma mark Images

- (UIImage*)tileNormal
{
    if (tileNormal_)
        return tileNormal_;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        tileNormal_ = [[UIImage imageNamed:@"Seaquations-SymbolBubbleHD.png"] retain];
    else
        tileNormal_ = [[UIImage imageNamed:@"Seaquations-SymbolBubble.png"] retain];
    return tileNormal_;
}

- (UIImage*)tileSelected
{
    if (tileSelected_)
        return tileSelected_;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        tileSelected_ = [[UIImage imageNamed:@"Seaquations-SymbolBubbleSelectedHD.png"] retain];
    else
        tileSelected_ = [[UIImage imageNamed:@"Seaquations-SymbolBubbleSelected.png"] retain];
    return tileSelected_;
}

- (UIImage*)powerUpTime
{
    if (powerUpTime_)
        return powerUpTime_;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        powerUpTime_ = [[UIImage imageNamed:@"Seaquations-PowerUpTimeHD.png"] retain];
    else
        powerUpTime_ = [[UIImage imageNamed:@"Seaquations-PowerUpTime.png"] retain];
    return powerUpTime_;
}

- (UIImage*)powerUpScore
{
    if (powerUpScore_)
        return powerUpScore_;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        powerUpScore_ = [[UIImage imageNamed:@"Seaquations-PowerUpScoreHD.png"] retain];
    else
        powerUpScore_ = [[UIImage imageNamed:@"Seaquations-PowerUpScore.png"] retain];
    return powerUpScore_;
}

- (UIImage*)powerUpTiles
{
    if (powerUpTiles_)
        return powerUpTiles_;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        powerUpTiles_ = [[UIImage imageNamed:@"Seaquations-PowerUpTilesHD.png"] retain];
    else
        powerUpTiles_ = [[UIImage imageNamed:@"Seaquations-PowerUpTiles.png"] retain];
    return powerUpTiles_;
}

#pragma mark -
#pragma mark AVAudioPlayerDelegate Methods

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer*)argPlayer successfully:(BOOL)flag
{
    [argPlayer prepareToPlay];
}

#pragma mark -
#pragma mark Properties

@synthesize gameIsActive;
@synthesize gameLossAnimationIsActive;
@synthesize viewsAreTransitioning;
// View Controllers
@synthesize gameViewController;
@synthesize menuViewController;
@synthesize backgroundViewController;
@synthesize transitionViewController;
@synthesize goVertexViewController;
// Data
@synthesize currentGameState;
@synthesize gameEndAudioPlayer;
@synthesize bubbleTapAudioPlayerPrimary;
@synthesize bubbleTapAudioPlayerSecondary;
@synthesize alarmAudioPlayer;
// Update
@synthesize masterDisplayLink;
// Transition
@synthesize activeTransition;
@synthesize elapsedTransitionTime;
@synthesize firstHalfTransitionElapsed;

@end
