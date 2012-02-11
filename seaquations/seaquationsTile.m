//
//  seaquationsTile.m
//  seaquations
//
//  Created by goVertex on 7/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "seaquationsTile.h"

@implementation seaquationsTile

- (id)initWithType:(NSInteger)argTileType
{
    if ((self = [super init]))
    {
        [self setTileType:argTileType];
        [self setIsFalling:NO];
        [self setIsSelected:NO];
        // Configure Tile Button
        UIButton *tempButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [tempButton setFrame:CGRectMake(0.0f, 0.0f, 0.0, 0.0)];
        [tempButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchDown];
        [tempButton setSelected:NO];
        [tempButton setEnabled:YES];
        [self setTileButton:tempButton];
        [self setTitleForTileType];
    }
    return self;
}

- (id)initWithCoder:(NSCoder*)argDecoder
{
    if ((self = [super init]))
    {
        // How to set a delegate here.....
        [self setTileType:[argDecoder decodeIntegerForKey:@"TileType"]];
        [self setIsFalling:[argDecoder decodeBoolForKey:@"IsFalling"]];
        [self setIsSelected:NO];
        // Configure Tile Button
        UIButton *tempButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [tempButton setFrame:CGRectMake(0.0f, 0.0f, 0.0, 0.0)];
        [tempButton setCenter:CGPointMake([argDecoder decodeFloatForKey:@"TileButtonCenterX"], [argDecoder decodeFloatForKey:@"TileButtonCenterY"])];
        [tempButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchDown];
        [tempButton setSelected:NO];
        [tempButton setEnabled:YES];
        [self setTileButton:tempButton];
        [self setTitleForTileType];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder*)argEncoder
{
    [argEncoder encodeInteger:[self tileType] forKey:@"TileType"];
    [argEncoder encodeBool:[self isFalling] forKey:@"IsFalling"];
    [argEncoder encodeFloat:[[self tileButton] center].x forKey:@"TileButtonCenterX"];
    [argEncoder encodeFloat:[[self tileButton] center].y forKey:@"TileButtonCenterY"];
}

- (void)buttonTapped:(id)argSender
{
    [[self delegate] tileSelected:self];
}

- (void)setTitleForTileType
{
    switch ([self tileType]) 
    {
        case kDigit0:
            [[self tileButton] setTitle:@"0" forState:UIControlStateNormal];
            break;
        case kDigit1:
            [[self tileButton] setTitle:@"1" forState:UIControlStateNormal];
            break;
        case kDigit2:
            [[self tileButton] setTitle:@"2" forState:UIControlStateNormal];
            break;
        case kDigit3:
            [[self tileButton] setTitle:@"3" forState:UIControlStateNormal];
            break;
        case kDigit4:
            [[self tileButton] setTitle:@"4" forState:UIControlStateNormal];
            break;
        case kDigit5:
            [[self tileButton] setTitle:@"5" forState:UIControlStateNormal];
            break;
        case kDigit6:
            [[self tileButton] setTitle:@"6" forState:UIControlStateNormal];
            break;
        case kDigit7:
            [[self tileButton] setTitle:@"7" forState:UIControlStateNormal];
            break;
        case kDigit8:
            [[self tileButton] setTitle:@"8" forState:UIControlStateNormal];
            break;
        case kDigit9:
            [[self tileButton] setTitle:@"9" forState:UIControlStateNormal];
            break;
        case kOperatorAddition:
            [[self tileButton] setTitle:@"+" forState:UIControlStateNormal];
            break;
        case kOperatorSubtraction:
            [[self tileButton] setTitle:@"-" forState:UIControlStateNormal];
            break;
        case kOperatorMultiplication:
            [[self tileButton] setTitle:@"*" forState:UIControlStateNormal];
            break;
        case kOperatorDivision:
            [[self tileButton] setTitle:@"/" forState:UIControlStateNormal];
            break;
        case kComparatorEquals:
            [[self tileButton] setTitle:@"=" forState:UIControlStateNormal];
            break;
        default:
            break;
    }
}

@synthesize delegate;
@synthesize tileType;
@synthesize tileButton;
@synthesize isFalling;
@synthesize isSelected;
@end
