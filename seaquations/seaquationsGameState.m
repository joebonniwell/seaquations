//
//  seaquationsGameState.m
//  seaquations
//
//  Created by goVertex on 7/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "seaquationsGameState.h"

@implementation seaquationsGameState

#pragma mark -
#pragma mark seaquationsGameState Creation Methods

- (id)init
{
    return [self initWithEasyDifficulty:NO];
}

- (id)initWithEasyDifficulty:(BOOL)argEasyDifficulty
{
    if ((self = [super init]))
    {
        // Temp Options Enable
        [self setIsOperatorAdditionEnabled:YES];
        [self setIsOperatorSubtractionEnabled:YES];
        [self setIsOperatorMultiplicationEnabled:YES];
        [self setIsOperatorDivisionEnabled:YES];
        if (argEasyDifficulty == YES)
        {
            [self setIsOperatorAdditionEnabled:YES];
            [self setIsOperatorSubtractionEnabled:YES];
            [self setIsOperatorMultiplicationEnabled:NO];
            [self setIsOperatorDivisionEnabled:NO];
        }
        NSMutableArray *tempColumn1Array = [NSMutableArray array];
        NSMutableArray *tempColumn2Array = [NSMutableArray array];
        NSMutableArray *tempColumn3Array = [NSMutableArray array];
        NSMutableArray *tempColumn4Array = [NSMutableArray array];
        NSMutableArray *tempColumn5Array = [NSMutableArray array];
        NSMutableArray *tempColumn6Array = [NSMutableArray array];
        NSArray *tempColumnsArray = [[NSArray alloc] initWithObjects:tempColumn1Array, tempColumn2Array, tempColumn3Array, tempColumn4Array, tempColumn5Array, tempColumn6Array, nil];
        [self setColumnsArray:tempColumnsArray];
        [tempColumnsArray release];
        [self setRegisterArray:[NSMutableArray array]];
        [self setBaseline:0];
        // PowerUp Data
        [self setDoubleScorePowerUpCount:0];
        [self setAvailableSlowDuration:0];
        [self setNextPowerUpScoreThreshold:kInitialPowerUpScoreThreshold];
        // Initialize Score Properties
        [self setCurrentScore:0];
        [self setTotalElapsedTime:0];
        [self setTotalEquationsCreated:0];
    }
    return self;
}

// How do you initWithCoder and assign a delegate?

- (id)initWithCoder:(NSCoder*)argDecoder
{
    if ((self = [super init]))
    {
        // Set all of the variables....
        [self setIsOperatorAdditionEnabled:[argDecoder decodeBoolForKey:@"IsOperatorAdditionEnabled"]];
        [self setIsOperatorSubtractionEnabled:[argDecoder decodeBoolForKey:@"IsOperatorSubtractionEnabled"]];
        [self setIsOperatorMultiplicationEnabled:[argDecoder decodeBoolForKey:@"IsOperatorMultiplicationEnabled"]];
        [self setIsOperatorDivisionEnabled:[argDecoder decodeBoolForKey:@"IsOperatorDivisionEnabled"]];
        [self setIsOperatorDecimalPointEnabled:[argDecoder decodeBoolForKey:@"IsOperatorDecimalPointEnabled"]];
        [self setColumnsArray:[argDecoder decodeObjectForKey:@"ColumnsArray"]];
        [self setBaseline:[argDecoder decodeFloatForKey:@"Baseline"]];
        [self setRegisterArray:[NSMutableArray array]];
        for (NSMutableArray *columnArray in [self columnsArray])
        {
            for (seaquationsTile *tile in columnArray)
            {
                [tile setDelegate:self];
            }
        }
        // PowerUp Data
        [self setDoubleScorePowerUpCount:[argDecoder decodeIntegerForKey:@"DoubleScorePowerUpCount"]];
        [self setAvailableSlowDuration:[argDecoder decodeDoubleForKey:@"AvailableSlowDuration"]];
        [self setNextPowerUpScoreThreshold:[argDecoder decodeIntegerForKey:@"NextPowerUpScoreThreshold"]];
        // Decode Score Properties
        [self setCurrentScore:[argDecoder decodeIntegerForKey:@"CurrentScore"]];
        [self setTotalElapsedTime:[argDecoder decodeDoubleForKey:@"TotalElapsedTime"]];
        [self setTotalEquationsCreated:[argDecoder decodeIntegerForKey:@"TotalEquationsCreated"]];
    }
    return self;
}

- (void)configure
{
    for (NSMutableArray *columnArray in [self columnsArray])
    {
        for (seaquationsTile *tile in columnArray)
        {
            float tileX = [[tile tileButton] center].x;
            float tileY = [[tile tileButton] center].y;
            [tile setTileButton:[delegate tileButtonForType:[tile tileType]]];
            [[tile tileButton] setCenter:CGPointMake(tileX, tileY)];
            [tile setTitleForTileType];
            [[tile tileButton] addTarget:tile action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchDown];
            [[tile tileButton] setBackgroundImage:[[self delegate] tileImageForSymbol:[tile tileType]] forState:UIControlStateNormal];
            [[tile tileButton] setBackgroundImage:[[self delegate] tileHighlightImageForSymbol:[tile tileType]] forState:UIControlStateHighlighted];
            [[tile tileButton] setBackgroundImage:[[self delegate] tileHighlightImageForSymbol:[tile tileType]] forState:(UIControlStateHighlighted|UIControlStateSelected)];
            [[tile tileButton] setBackgroundImage:[[self delegate] tileHighlightImageForSymbol:[tile tileType]] forState:UIControlStateDisabled];
            [[tile tileButton] setBackgroundImage:[[self delegate] tileHighlightImageForSymbol:[tile tileType]] forState:UIControlStateSelected];
            [[tile tileButton] setBackgroundImage:[[self delegate] tileHighlightImageForSymbol:[tile tileType]] forState:(UIControlStateDisabled|UIControlStateSelected)];
        }
    }
}

#pragma mark -
#pragma mark GVGameState Encode Methods

- (void)encodeWithCoder:(NSCoder*)argEncoder
{
    [argEncoder encodeBool:[self isOperatorAdditionEnabled] forKey:@"IsOperatorAdditionEnabled"];
    [argEncoder encodeBool:[self isOperatorSubtractionEnabled] forKey:@"IsOperatorSubtractionEnabled"];
    [argEncoder encodeBool:[self isOperatorMultiplicationEnabled] forKey:@"IsOperatorMultiplicationEnabled"];
    [argEncoder encodeBool:[self isOperatorDivisionEnabled] forKey:@"IsOperatorDivisionEnabled"];
    [argEncoder encodeBool:[self isOperatorDecimalPointEnabled] forKey:@"IsOperatorDecimalPointEnabled"];
    [argEncoder encodeObject:[self columnsArray] forKey:@"ColumnsArray"];
    [argEncoder encodeFloat:[self baseline] forKey:@"Baseline"];
    // PowerUp Data
    [argEncoder encodeInteger:[self doubleScorePowerUpCount] forKey:@"DoubleScorePowerUpCount"];
    [argEncoder encodeDouble:[self availableSlowDuration] forKey:@"AvailableSlowDuration"];
    [argEncoder encodeInteger:[self nextPowerUpScoreThreshold] forKey:@"NextPowerUpScoreThreshold"];
    // Encode Score Properties
    [argEncoder encodeInteger:[self currentScore] forKey:@"CurrentScore"];
    [argEncoder encodeDouble:[self totalElapsedTime] forKey:@"TotalElapsedTime"];
    [argEncoder encodeInteger:[self totalEquationsCreated] forKey:@"TotalEquationsCreated"];
}

- (NSNumber*)randomIndexForAvailableIndices:(NSArray*)argIndices
{
    NSInteger randomIndex = arc4random() % [argIndices count];
    return [argIndices objectAtIndex:randomIndex];
}

#pragma mark -
#pragma mark New Row Methods

- (seaquationsTile*)newPowerUpTileInColumn:(NSInteger)argColumn
{
    NSInteger powerUpType = arc4random() % 3 + kPowerUpTime;
    
    seaquationsTile *newPowerUpTile = [[seaquationsTile alloc] initWithType:powerUpType];
    [newPowerUpTile setDelegate:self];
    
    UIButton *tempNewTileButton = [[self delegate] tileButtonForType:[newPowerUpTile tileType]];
    [newPowerUpTile setTileButton:tempNewTileButton];
    [tempNewTileButton addTarget:newPowerUpTile action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchDown];
    
    // Set position
    [newPowerUpTile setIsFalling:YES]; // is this where this should go?
    
    [[[self columnsArray] objectAtIndex:argColumn] insertObject:newPowerUpTile atIndex:0];
    return newPowerUpTile;
}

- (void)generateNewRowOfTiles
{
    NSMutableArray *rowConstructorArray = [[NSMutableArray alloc] init];
    NSMutableArray *availableIndicesArray = [[NSMutableArray alloc] init];
    for (NSInteger index = 0; index < 6; index++)
    { 
        [availableIndicesArray addObject:[NSNumber numberWithInteger:index]];
    }
    // Fill with digits
    [self addDigitsToArray:rowConstructorArray];
    // Generate comparators
    [self addComparatorsToArray:rowConstructorArray forAvailableIndices:availableIndicesArray];
    // Generate operators
    [self addOperatorsToArray:rowConstructorArray forAvailableIndices:availableIndicesArray];
    // Configrue the tiles
    for (int columnIndex = 0; columnIndex < 6; columnIndex++)
    {
        seaquationsTile *newTile = [rowConstructorArray objectAtIndex:0];
        [newTile setDelegate:self];
        // Button Configuration
        UIButton *tempNewTileButton = [[self delegate] tileButtonForType:[newTile tileType]];
        [newTile setTileButton:tempNewTileButton];
        [tempNewTileButton addTarget:newTile action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchDown];
        [newTile setTitleForTileType];
        // Add tile to column array
        [[[self columnsArray] objectAtIndex:columnIndex] addObject:newTile];
        [rowConstructorArray removeObjectAtIndex:0];
    }
    [rowConstructorArray release];
    [availableIndicesArray release];
}

- (void)addDigitsToArray:(NSMutableArray*)argRowConstructorArray
{
    for (int columnIndex = 0; columnIndex < 6; columnIndex++)
    {
        seaquationsTile *newTile;
        NSInteger randomDigit = arc4random() % 100;
        if (randomDigit < kDistributionFactorDigit0)
            newTile = [[seaquationsTile alloc] initWithType:kDigit0];
        else if (randomDigit < kDistributionFactorDigit1)
            newTile = [[seaquationsTile alloc] initWithType:kDigit1];
        else if (randomDigit < kDistributionFactorDigit2)
            newTile = [[seaquationsTile alloc] initWithType:kDigit2];
        else if (randomDigit < kDistributionFactorDigit3)
            newTile = [[seaquationsTile alloc] initWithType:kDigit3];
        else if (randomDigit < kDistributionFactorDigit4)
            newTile = [[seaquationsTile alloc] initWithType:kDigit4];
        else if (randomDigit < kDistributionFactorDigit5)
            newTile = [[seaquationsTile alloc] initWithType:kDigit5];
        else if (randomDigit < kDistributionFactorDigit6)
            newTile = [[seaquationsTile alloc] initWithType:kDigit6];
        else if (randomDigit < kDistributionFactorDigit7)
            newTile = [[seaquationsTile alloc] initWithType:kDigit7];
        else if (randomDigit < kDistributionFactorDigit8)
            newTile = [[seaquationsTile alloc] initWithType:kDigit8];
        else if (randomDigit < kDistributionFactorDigit9)
            newTile = [[seaquationsTile alloc] initWithType:kDigit9];
        [argRowConstructorArray addObject:newTile];
        [newTile release];
    }
}

- (void)addComparatorsToArray:(NSMutableArray*)argRowConstructorArray forAvailableIndices:(NSMutableArray*)argAvailableIndicesArray
{
    NSInteger randomIndex = arc4random() % [argAvailableIndicesArray count];
    seaquationsTile *newTile = [[[seaquationsTile alloc] initWithType:kComparatorEquals] autorelease];
    [argRowConstructorArray replaceObjectAtIndex:[[argAvailableIndicesArray objectAtIndex:randomIndex] integerValue] withObject:newTile];
    [argAvailableIndicesArray removeObjectAtIndex:randomIndex];
}

- (void)addOperatorsToArray:(NSMutableArray*)argRowConstructorArray forAvailableIndices:(NSMutableArray*)argAvailableIndicesArray
{
    NSInteger generationValue = arc4random() % 100;
    NSInteger numberOfOperatorsToGenerate = 1;
    if (generationValue > kTwoOperatorGenerationValue)
        numberOfOperatorsToGenerate = 2;
    for (NSInteger operator = 0; operator < numberOfOperatorsToGenerate; operator++)
    {
        seaquationsTile *newTile = [[seaquationsTile alloc] initWithType:[self randomEnabledOperator]];
        NSInteger randomIndex = arc4random() % [argAvailableIndicesArray count];
        [argRowConstructorArray replaceObjectAtIndex:[[argAvailableIndicesArray objectAtIndex:randomIndex] integerValue] withObject:newTile];
        [argAvailableIndicesArray removeObjectAtIndex:randomIndex];
        [newTile release];
    }
}

- (NSInteger)randomEnabledOperator
{
    NSInteger randomOperator;
    if ([self isOperatorMultiplicationEnabled] == YES)
        randomOperator = arc4random() % 100;
    else
        randomOperator = arc4random() % kDistributionFactorOperatorSubtraction;
    if (randomOperator < kDistributionFactorOperatorAddition)
        return kOperatorAddition;
    else if (randomOperator < kDistributionFactorOperatorSubtraction)
        return kOperatorSubtraction;
    else if (randomOperator < kDistributionFactorOperatorMultiplication)
        return kOperatorMultiplication;
    else if (randomOperator < kDistributionFactorOperatorDivision)
        return kOperatorDivision;
    return 0;
}

#pragma mark -
#pragma mark State Change Methods

- (BOOL)validateCurrentEquationAndScoreIt:(BOOL)argShouldScoreEquation
{
    // Validate current equation and compute score at the same time...
    if ([self currentEquationPassesInitialChecks] == NO)
        return NO;
    // Chunk the current symbols into a proper equation
    [self setFirstHalfValuesAndOperands:[NSMutableArray array]];
    [self setSecondHalfValuesAndOperands:[NSMutableArray array]];
    [self setComparator:nil];
    if ([self resolveSymbolsIntoEquation] == NO)
        return NO;
    // Compute the score of the equation
    NSInteger scoreForCurrentEquation = [self computeScoreForCurrentEquation];
    // Simplify the equation
    if ([self simplifyEquation] == NO)
        return NO;  // Divid by zero
    // Test the simplified equation
    if ([self validSimplifiedEquation] == NO)
        return NO;
    if (argShouldScoreEquation == YES)
    {
        if ([self doubleScorePowerUpCount] > 0)
        {
            [self setCurrentScore:([self currentScore] + (2 * scoreForCurrentEquation))];
            [self setDoubleScorePowerUpCount:([self doubleScorePowerUpCount] - 1)];
        }
        else
            [self setCurrentScore:([self currentScore] + scoreForCurrentEquation)];
    }
    return YES;
}

- (BOOL)validSimplifiedEquation
{
    NSComparisonResult comparisonResult = [[self firstHalfResult] compare:[self secondHalfResult]];
    if (comparisonResult == NSOrderedSame && [[self comparator] integerValue] == kComparatorEquals)
        return YES;
    return NO;
}

- (BOOL)simplifyEquation
{
    for (int arrayCounter = 0; arrayCounter < 2; arrayCounter++)
    {
        NSMutableArray *array;
        if (arrayCounter == 0)
            array = [self firstHalfValuesAndOperands];
        else
            array = [self secondHalfValuesAndOperands];
        while ([array count] > 1) 
        {
            // Look for multiplication and division
            int multiplicationOrDivisionOperatorIndex = 0;
            int indexMD = 0;
            while (indexMD < [array count] && multiplicationOrDivisionOperatorIndex == 0) 
            {
                if ([[array objectAtIndex:indexMD] isKindOfClass:[GVOperator class]] && ([[array objectAtIndex:indexMD] operatorType] == kOperatorMultiplication || [[array objectAtIndex:indexMD] operatorType] == kOperatorDivision))
                    multiplicationOrDivisionOperatorIndex = indexMD;
                indexMD++;
            }
            if (multiplicationOrDivisionOperatorIndex > 0)
            {
                // Evaluate multiplication or division
                NSDecimalNumber *firstValue;
                if ([[array objectAtIndex:(multiplicationOrDivisionOperatorIndex - 1)] isKindOfClass:[GVDecimalNumber class]])
                    firstValue = [[array objectAtIndex:(multiplicationOrDivisionOperatorIndex - 1)] decimalNumber];
                else
                    firstValue = [array objectAtIndex:(multiplicationOrDivisionOperatorIndex - 1)];
                NSDecimalNumber *secondValue;
                if ([[array objectAtIndex:(multiplicationOrDivisionOperatorIndex + 1)] isKindOfClass:[GVDecimalNumber class]])
                    secondValue = [[array objectAtIndex:(multiplicationOrDivisionOperatorIndex + 1)] decimalNumber];
                else
                    secondValue = [array objectAtIndex:(multiplicationOrDivisionOperatorIndex + 1)];
                NSDecimalNumber *result;
                if ([[array objectAtIndex:multiplicationOrDivisionOperatorIndex] operatorType] == kOperatorMultiplication)
                    result = [firstValue decimalNumberByMultiplyingBy:secondValue];
                else
                {
                    // Check here to see if second value is zero, and if it is... abort
                    if ([secondValue compare:[NSDecimalNumber zero]] == NSOrderedSame)
                        return NO;
                    result = [firstValue decimalNumberByDividingBy:secondValue];
                }    
                // Remove all 3 values and replace with result
                [array removeObjectAtIndex:(multiplicationOrDivisionOperatorIndex + 1)];
                [array removeObjectAtIndex:multiplicationOrDivisionOperatorIndex];
                [array removeObjectAtIndex:(multiplicationOrDivisionOperatorIndex - 1)];
                [array insertObject:result atIndex:(multiplicationOrDivisionOperatorIndex - 1)];
            }
            else
            {
                // Look for addition and subtraction...
                int additionOrSubtractionOperatorIndex = 0;
                int indexAS = 0;
                while (indexAS < [array count] && additionOrSubtractionOperatorIndex == 0)
                {
                    if ([[array objectAtIndex:indexAS] isKindOfClass:[GVOperator class]] && ([[array objectAtIndex:indexAS] operatorType] == kOperatorAddition || [[array objectAtIndex:indexAS] operatorType] == kOperatorSubtraction))
                        additionOrSubtractionOperatorIndex = indexAS;
                    indexAS++;
                }
                if (additionOrSubtractionOperatorIndex > 0)
                {
                    // Evaluate addition or subtraction
                    NSDecimalNumber *firstValue;
                    if ([[array objectAtIndex:(additionOrSubtractionOperatorIndex - 1)] isKindOfClass:[GVDecimalNumber class]])
                        firstValue = [[array objectAtIndex:(additionOrSubtractionOperatorIndex - 1)] decimalNumber];
                    else
                        firstValue = [array objectAtIndex:(additionOrSubtractionOperatorIndex - 1)];
                    NSDecimalNumber *secondValue;
                    if ([[array objectAtIndex:(additionOrSubtractionOperatorIndex + 1)] isKindOfClass:[GVDecimalNumber class]])
                        secondValue = [[array objectAtIndex:(additionOrSubtractionOperatorIndex + 1)] decimalNumber];
                    else
                        secondValue = [array objectAtIndex:(additionOrSubtractionOperatorIndex + 1)];
                    NSDecimalNumber *result;
                    if ([[array objectAtIndex:additionOrSubtractionOperatorIndex] operatorType] == kOperatorAddition)
                        result = [firstValue decimalNumberByAdding:secondValue];
                    else
                        result = [firstValue decimalNumberBySubtracting:secondValue];
                    // Remove all 3 values and replace with result
                    [array removeObjectAtIndex:(additionOrSubtractionOperatorIndex + 1)];
                    [array removeObjectAtIndex:additionOrSubtractionOperatorIndex];
                    [array removeObjectAtIndex:(additionOrSubtractionOperatorIndex - 1)];
                    [array insertObject:result atIndex:(additionOrSubtractionOperatorIndex - 1)];
                }
            }
        }
    }
    // First Half Result
    if ([[[self firstHalfValuesAndOperands] lastObject] isKindOfClass:[GVDecimalNumber class]])
        [self setFirstHalfResult:[[[self firstHalfValuesAndOperands] lastObject] decimalNumber]];
    else
        [self setFirstHalfResult:[[self firstHalfValuesAndOperands] lastObject]];
    // Second Half Result
    if ([[[self secondHalfValuesAndOperands] lastObject] isKindOfClass:[GVDecimalNumber class]])
        [self setSecondHalfResult:[[[self secondHalfValuesAndOperands] lastObject] decimalNumber]];
    else
        [self setSecondHalfResult:[[self secondHalfValuesAndOperands] lastObject]];
    return YES;
}

- (BOOL)resolveSymbolsIntoEquation
{
    BOOL useFirstArray = YES;
    BOOL previousTileWasDecimalPoint = NO;
    BOOL currentValueHasDecimalPoint = NO;
    BOOL previousTileWasOperator = NO;
    NSMutableArray *currentArray = nil;
    GVDecimalNumber *currentValue = nil;
    for (seaquationsTile *tile in [self registerArray])
    {
        if (useFirstArray == YES)
            currentArray = [self firstHalfValuesAndOperands];
        else
            currentArray = [self secondHalfValuesAndOperands];
        if ([tile tileType] == kOperatorDecimalPoint)
        {
            if ([currentArray count] == 0)
            {
                currentValue = [[GVDecimalNumber alloc] init];
                [currentValue setHasDecimalPoint:YES];
                [currentArray addObject:currentValue];
                [currentValue release];
                previousTileWasDecimalPoint = YES;
                previousTileWasOperator = NO;
                currentValueHasDecimalPoint = YES;
            }
            else
            {
                if (currentValueHasDecimalPoint == YES)
                {
                    // Abort
                    //NSLog(@"Failing because it sees 2 decimal points in current value");
                    return NO;
                }
                else if (previousTileWasOperator)
                {
                    // Creating a new value starting with a decimal point
                    currentValue = [[GVDecimalNumber alloc] init];
                    [currentValue setHasDecimalPoint:YES];
                    [currentArray addObject:currentValue];
                    [currentValue release];
                    currentValueHasDecimalPoint = YES;
                    previousTileWasDecimalPoint = YES;
                    previousTileWasOperator = NO;
                }
                else
                {
                    // Adding a decimal point to the current value
                    currentValueHasDecimalPoint = YES;
                    previousTileWasDecimalPoint = YES;
                    previousTileWasOperator = NO;
                }
            }
        }
        else if ([tile tileType] >= kOperatorAddition)
        {
            if ([currentArray count] == 0 || previousTileWasDecimalPoint == YES || previousTileWasOperator == YES)
            {
                // Abort
                //NSLog(@"Failing because an operator has occured without a valid leading number");
                return NO;
            }
            else
            {
                [currentArray addObject:[GVOperator operatorWithType:[tile tileType]]];
                previousTileWasOperator = YES;
                previousTileWasDecimalPoint = NO;
                currentValueHasDecimalPoint = NO;
            }
        }
        else if ([tile tileType] >= kComparatorEquals)    // Comparator
        {
            if (previousTileWasOperator == YES || previousTileWasDecimalPoint == YES || useFirstArray == NO || [self comparator])
            {
                // Abort
                //NSLog(@"Failing because a second comparator was found, or because it occured after a non-valid value");
                return NO;
            }
            else
            {
                [self setComparator:[NSNumber numberWithInt:[tile tileType]]];
                useFirstArray = NO;
                previousTileWasOperator = NO;
                previousTileWasDecimalPoint = NO;
                currentValueHasDecimalPoint = NO;
            }
        }
        else // Digit
        {
            if ([currentArray count] == 0 || previousTileWasOperator)
            {
                currentValue = [[GVDecimalNumber alloc] init];
                [currentValue addDigit:[tile tileType]];
                [currentArray addObject:currentValue];
                [currentValue release];
                currentValueHasDecimalPoint = NO;
                previousTileWasDecimalPoint = NO;
                previousTileWasOperator = NO;
            }
            else
            {
                [currentValue addDigit:[tile tileType]];
                if (currentValueHasDecimalPoint)
                    [currentValue decrementExponent];               
                previousTileWasOperator = NO;
                previousTileWasDecimalPoint = NO;
            }
        }
    }
    return YES;
}

- (void)removeLastSymbolFromCurrentEquation
{
    seaquationsTile *tileToUnselect = [[self registerArray] lastObject];
    [tileToUnselect setIsSelected:NO];
    [[tileToUnselect tileButton] setSelected:NO];
    [[self registerArray] removeLastObject];
    if ([[self registerArray] count] > 0)
        [[[[self registerArray] lastObject] tileButton] setEnabled:YES];
}

- (void)resetCurrentEquation
{
    for (seaquationsTile *tile in [self registerArray])
    {
        [tile setIsSelected:NO];
        [[tile tileButton] setSelected:NO];
        [[tile tileButton] setEnabled:YES];
    }
    [[self registerArray] removeAllObjects];
}

#pragma mark -
#pragma mark State Analysis Methods

- (NSInteger)computeScoreForCurrentEquation
{
    float tempScore = 1;    
    // Compute Points
    for (int currentHalf = 0; currentHalf < 2; currentHalf++)
    {
        NSMutableArray *currentValuesAndOperandsArray = nil;
        if (currentHalf == 0)
            currentValuesAndOperandsArray = [self firstHalfValuesAndOperands];
        else
            currentValuesAndOperandsArray = [self secondHalfValuesAndOperands];
        int partsMax = [currentValuesAndOperandsArray count];        
        for (int currentPart = 0; currentPart < partsMax; currentPart++)
        {
            if ([[currentValuesAndOperandsArray objectAtIndex:currentPart] isKindOfClass:[GVDecimalNumber class]])
            {
                if ([currentValuesAndOperandsArray count] > 1)
                {
                    GVDecimalNumber *currentNumber = [currentValuesAndOperandsArray objectAtIndex:currentPart];
                    tempScore += 0.5f * ([currentNumber numberOfDigits] - 1); 
                }
            }
            else // Operator
            {
                GVOperator *currentOperator = [currentValuesAndOperandsArray objectAtIndex:currentPart];
                if ([currentOperator operatorType] == kOperatorAddition)
                {
                    tempScore += 1.0f;
                }
                if ([currentOperator operatorType] == kOperatorSubtraction)
                {
                    tempScore += 1.0f;
                }
                if ([currentOperator operatorType] == kOperatorMultiplication)
                {
                    tempScore += 1.5f;
                    if ([[currentValuesAndOperandsArray objectAtIndex:(currentPart - 1)] isZero])
                    {
                        tempScore -= 1.0f;
                        tempScore -= 0.5f * [[currentValuesAndOperandsArray objectAtIndex:(currentPart + 1)] numberOfDigits];
                    }
                    else if ([[currentValuesAndOperandsArray objectAtIndex:(currentPart + 1)] isZero])
                    {
                        tempScore -= 1.0f;
                        tempScore -= 0.5f * [[currentValuesAndOperandsArray objectAtIndex:(currentPart - 1)] numberOfDigits];
                    }
                    else if ([[currentValuesAndOperandsArray objectAtIndex:(currentPart - 1)] isOne])
                        tempScore -= 0.5f;
                    else if ([[currentValuesAndOperandsArray objectAtIndex:(currentPart + 1)] isOne])
                        tempScore -= 0.5f;
                }
                if ([currentOperator operatorType] == kOperatorDivision)
                {
                    tempScore += 1.5f;
                    if ([[currentValuesAndOperandsArray objectAtIndex:(currentPart - 1)] isZero])
                    {
                        tempScore -= 1.0f;
                        tempScore -= 0.5f * [[currentValuesAndOperandsArray objectAtIndex:(currentPart + 1)] numberOfDigits];
                    }
                    else if ([[currentValuesAndOperandsArray objectAtIndex:(currentPart - 1)] isOne])
                        tempScore -= 0.5f;
                    else if ([[currentValuesAndOperandsArray objectAtIndex:(currentPart + 1)] isOne])
                        tempScore -= 0.5f;
                }
            }
        }
    }
    // Floor tempScore
    NSInteger roundedTempScore = roundf(tempScore);
    // Return the value or 1
    if (roundedTempScore < 1)
        return 1;
    return roundedTempScore;
}

- (NSString*)scoreString
{
    return [NSString stringWithFormat:@"%d", [self currentScore]];
}

- (NSString*)stringForCurrentEquation
{
    NSInteger tileType;
    NSMutableString *equationString = [NSMutableString stringWithCapacity:10];
    for (seaquationsTile *tile in [self registerArray])
    {
        tileType = [tile tileType];
        switch (tileType)
        {
            case kDigit0:
                [equationString appendString:@"0"];
                break;
            case kDigit1:
                [equationString appendString:@"1"];
                break;
            case kDigit2:
                [equationString appendString:@"2"];
                break;
            case kDigit3:
                [equationString appendString:@"3"];
                break;
            case kDigit4:
                [equationString appendString:@"4"];
                break;
            case kDigit5:
                [equationString appendString:@"5"];
                break;
            case kDigit6:
                [equationString appendString:@"6"];
                break;
            case kDigit7:
                [equationString appendString:@"7"];
                break;
            case kDigit8:
                [equationString appendString:@"8"];
                break;
            case kDigit9:
                [equationString appendString:@"9"];
                break;
            case kComparatorEquals:
                [equationString appendString:@"="];
                break;
            case kOperatorAddition:
                [equationString appendString:@"+"];
                break;
            case kOperatorSubtraction:
                [equationString appendString:@"\u2212"];
                break;
            case kOperatorMultiplication:
                [equationString appendString:@"\u00D7"];
                break;
            case kOperatorDivision:
                [equationString appendString:@"\u00F7"];
                break;
            case kOperatorDecimalPoint:
                [equationString appendString:@"."];
                break;
            default:
                break;
        }
    }
    return equationString;
}

- (NSMutableArray*)generateActiveOperatorsArray;
{
    NSMutableArray *tempActiveOperatorsArray = [NSMutableArray array];
    if ([self isOperatorAdditionEnabled])
        [tempActiveOperatorsArray addObject:[NSNumber numberWithInt:kOperatorAddition]];
    if ([self isOperatorSubtractionEnabled])
        [tempActiveOperatorsArray addObject:[NSNumber numberWithInt:kOperatorSubtraction]];
    if ([self isOperatorMultiplicationEnabled])
        [tempActiveOperatorsArray addObject:[NSNumber numberWithInt:kOperatorMultiplication]];
    if ([self isOperatorDivisionEnabled])
        [tempActiveOperatorsArray addObject:[NSNumber numberWithInt:kOperatorDivision]];
    if ([self isOperatorDecimalPointEnabled])
        [tempActiveOperatorsArray addObject:[NSNumber numberWithInt:kOperatorDecimalPoint]];
    return tempActiveOperatorsArray;
}

- (NSInteger)numberOfComparatorsOnField
{
    NSInteger comparatorCount = 0;
    for (NSMutableArray *columnArray in [self columnsArray])
    {
        for (seaquationsTile *tile in columnArray)
        {
            if ([tile tileType] == kComparatorEquals)
                comparatorCount++;
        }
    }
    return comparatorCount;
}

- (NSInteger)numberOfOperatorsOnField
{
    NSInteger operatorCount = 0;
    for (NSMutableArray *columnArray in [self columnsArray])
    {
        for (seaquationsTile *tile in columnArray)
        {
            if ([tile tileType] == kOperatorAddition)
                operatorCount++;
            else if ([tile tileType] == kOperatorSubtraction)
                operatorCount++;
            else if ([tile tileType] == kOperatorMultiplication)
                operatorCount++;
            else if ([tile tileType] == kOperatorDivision)
                operatorCount++;
            else if ([tile tileType] == kOperatorDecimalPoint)
                operatorCount++;
        }
    }
    return operatorCount;
}

- (BOOL)currentEquationPassesInitialChecks
{
    if ([[self registerArray] count]  < 3)
        return NO;
    if ([[[self registerArray] objectAtIndex:0] tileType] >= kComparatorEquals && [[[self registerArray] objectAtIndex:0] tileType] <= kOperatorDivision)
        return NO;  
    if ([[[self registerArray] lastObject] tileType] > kDigit9)
        return NO;
    BOOL comparatorFound = NO;
    BOOL multipleComparatorsFound = NO;
    for (seaquationsTile *tile in [self registerArray])
    {
        if ([tile tileType] == kComparatorEquals)
        {
            if (comparatorFound == NO)
                comparatorFound = YES;
            else
                multipleComparatorsFound = YES;
        }
    }
    if (!comparatorFound || multipleComparatorsFound)
        return NO;
    return YES;
}

#pragma mark -
#pragma mark GVTile Delegate Methods

- (void)tileSelected:(id)argTile
{
    seaquationsTile *selectedTile = (seaquationsTile*)argTile;
    [[self delegate] tileWasSelected:selectedTile];
}

- (UIImage*)tileImageForSymbol:(NSInteger)argSymbol
{
    return [[self delegate] tileImageForSymbol:argSymbol];
}

- (UIImage*)tileHighlightImageForSymbol:(NSInteger)argSymbol
{
    return [[self delegate] tileHighlightImageForSymbol:argSymbol];
}

- (UIImage*)tileSelectedImageForSymbol:(NSInteger)argSymbol
{
    return [[self delegate] tileSelectedImageForSymbol:argSymbol];
}

#pragma mark -
#pragma mark Properties

@synthesize delegate;
// GameState Data
@synthesize baseline;
@synthesize columnsArray;
@synthesize registerArray;
@synthesize firstHalfValuesAndOperands;
@synthesize secondHalfValuesAndOperands;
@synthesize comparator;
@synthesize firstHalfResult;
@synthesize secondHalfResult;
// GameState Status
@synthesize isGameComplete;
@synthesize isOperatorAdditionEnabled;
@synthesize isOperatorSubtractionEnabled;
@synthesize isOperatorMultiplicationEnabled;
@synthesize isOperatorDivisionEnabled;
@synthesize isOperatorDecimalPointEnabled;
// Power Up Data
@synthesize doubleScorePowerUpCount;
@synthesize availableSlowDuration;
@synthesize nextPowerUpScoreThreshold;
// Score Data
@synthesize currentScore;
@synthesize totalElapsedTime;
@synthesize totalEquationsCreated;

@end
