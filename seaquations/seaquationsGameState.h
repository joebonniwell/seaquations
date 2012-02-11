//
//  seaquationsGameState.h
//  seaquations
//
//  Created by goVertex on 7/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "seaquationsTile.h"
#import "GVDecimalNumber.h"
#import "GVOperator.h"

@protocol seaquationsGameStateDelegate <NSObject>

- (UIButton*)tileButtonForType:(NSInteger)argTileType;
- (void)tileWasSelected:(seaquationsTile*)argTile;
- (UIImage*)tileImageForSymbol:(NSInteger)argSymbol;
- (UIImage*)tileHighlightImageForSymbol:(NSInteger)argSymbol;
- (UIImage*)tileSelectedImageForSymbol:(NSInteger)argSymbol;

@end

@interface seaquationsGameState : NSObject <seaquationsTileDelegate, NSCoding>
{
    id delegate;
    // GameState Data
    float baseline;
    NSArray *columnsArray;
    NSMutableArray *registerArray;
    NSMutableArray *firstHalfValuesAndOperands;
    NSMutableArray *secondHalfValuesAndOperands;
    NSNumber *comparator;
    NSDecimalNumber *firstHalfResult;
    NSDecimalNumber *secondHalfResult;
    // GameState Status
    BOOL isGameComplete;
    BOOL isOperatorAdditionEnabled;
    BOOL isOperatorSubtractionEnabled;
    BOOL isOperatorMultiplicationEnabled;
    BOOL isOperatorDivisionEnabled;
    BOOL isOperatorDecimalPointEnabled;
    // Power Up Data
    NSInteger doubleScorePowerUpCount;
    NSTimeInterval availableSlowDuration;
    NSInteger nextPowerUpScoreThreshold;
    // Score Data
    NSInteger currentScore;
    NSTimeInterval totalElapsedTime;
    NSInteger totalEquationsCreated;
}
@property (nonatomic, assign) id delegate;
// GameState Data
@property (nonatomic) float baseline;
@property (nonatomic, retain) NSArray *columnsArray;
@property (nonatomic, retain) NSMutableArray *registerArray;
@property (nonatomic, retain) NSMutableArray *firstHalfValuesAndOperands;
@property (nonatomic, retain) NSMutableArray *secondHalfValuesAndOperands;
@property (nonatomic, retain) NSNumber *comparator;
@property (nonatomic, retain) NSDecimalNumber *firstHalfResult;
@property (nonatomic, retain) NSDecimalNumber *secondHalfResult;
// GameState Status
@property (nonatomic) BOOL isGameComplete;
@property (nonatomic) BOOL isOperatorAdditionEnabled;
@property (nonatomic) BOOL isOperatorSubtractionEnabled;
@property (nonatomic) BOOL isOperatorMultiplicationEnabled;
@property (nonatomic) BOOL isOperatorDivisionEnabled;
@property (nonatomic) BOOL isOperatorDecimalPointEnabled;
// Power Up Data
@property (nonatomic) NSInteger doubleScorePowerUpCount;
@property (nonatomic) NSTimeInterval availableSlowDuration;
@property (nonatomic) NSInteger nextPowerUpScoreThreshold;
// Score Data
@property (nonatomic) NSInteger currentScore;
@property (nonatomic) NSTimeInterval totalElapsedTime;
@property (nonatomic) NSInteger totalEquationsCreated;

#pragma mark -
#pragma mark  Methods
- (id)initWithEasyDifficulty:(BOOL)argEasyDifficulty;
// State Creation Methods
- (void)configure;

// State Change Methods
- (seaquationsTile*)newPowerUpTileInColumn:(NSInteger)argColumn;
- (void)generateNewRowOfTiles;
- (BOOL)validateCurrentEquationAndScoreIt:(BOOL)argShouldScoreEquation;
- (void)removeLastSymbolFromCurrentEquation;
- (void)resetCurrentEquation;

- (void)addDigitsToArray:(NSMutableArray*)argRowConstructorArray;
- (void)addComparatorsToArray:(NSMutableArray*)argRowConstructorArray forAvailableIndices:(NSMutableArray*)argAvailableIndicesArray;
- (void)addOperatorsToArray:(NSMutableArray*)argRowConstructorArray forAvailableIndices:(NSMutableArray*)argAvailableIndicesArray;
// State Anaylsis Methods
- (NSString*)scoreString;
- (NSInteger)numberOfComparatorsOnField;
- (NSInteger)numberOfOperatorsOnField;
- (NSMutableArray*)generateActiveOperatorsArray;
- (NSString*)stringForCurrentEquation;
- (BOOL)currentEquationPassesInitialChecks;
- (BOOL)validSimplifiedEquation;
- (BOOL)simplifyEquation;
- (BOOL)resolveSymbolsIntoEquation;
- (NSInteger)computeScoreForCurrentEquation;

- (NSInteger)randomEnabledOperator;
@end
