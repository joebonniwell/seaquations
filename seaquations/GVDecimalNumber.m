//
//  GVDecimalNumber.m
//  seaquations
//
//  Created by goVertex on 7/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GVDecimalNumber.h"

@implementation GVDecimalNumber

- (id)init
{
    if ((self = [super init]))
    {
        // Initialize to zero
        mantissa_gv = 0;
        exponent_gv = 0;
        numberOfDigits_gv = 0;
        [self setIsNegative:NO];
        [self setHasDecimalPoint:NO];
    }
    return self;
}

- (id)initWithCoder:(NSCoder*)argDecoder
{
    if ((self = [super init]))
    {
        [self setHasDecimalPoint:[argDecoder decodeBoolForKey:@"HasDecimalPoint"]];
        [self setIsNegative:[argDecoder decodeBoolForKey:@"IsNegative"]];
        mantissa_gv = [[argDecoder decodeObjectForKey:@"Mantissa"] unsignedLongLongValue];
        exponent_gv = [[argDecoder decodeObjectForKey:@"Exponent"] shortValue];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder*)argEncoder
{
    [argEncoder encodeBool:[self hasDecimalPoint] forKey:@"HasDecimalPoint"];
    [argEncoder encodeBool:[self isNegative] forKey:@"IsNegative"];
    [argEncoder encodeObject:[NSNumber numberWithUnsignedLongLong:mantissa_gv] forKey:@"Mantissa"];
    [argEncoder encodeObject:[NSNumber numberWithShort:exponent_gv] forKey:@"Exponent"];
}

- (void)addDigit:(NSInteger)argDigit
{
    mantissa_gv = mantissa_gv * 10 + argDigit;
    numberOfDigits_gv++;
    if ([self isNegative])
        exponent_gv--;
}

- (NSDecimalNumber*)decimalNumber
{
    return [NSDecimalNumber decimalNumberWithMantissa:mantissa_gv exponent:exponent_gv isNegative:[self isNegative]];
}

- (void)decrementExponent
{
    exponent_gv--;
    if (exponent_gv < 0)
        [self setHasDecimalPoint:YES];
}

- (NSInteger)numberOfDigits
{
    return numberOfDigits_gv;
}

- (BOOL)isZero
{
    if (mantissa_gv == 0)
        return YES;
    return NO;
}

- (BOOL)isOne
{
    if (mantissa_gv == 1 && exponent_gv == 0)
        return YES;
    // What if the user specifies 1.000000000
    // this would be an exponent of negative value and a mantissa that is divisable by 10 with no remainder... and the righ size relationship between mantissa and something....
    return NO;
}

@synthesize hasDecimalPoint;
@synthesize isNegative;
@end
