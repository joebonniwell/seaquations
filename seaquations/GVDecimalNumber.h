//
//  GVDecimalNumber.h
//  seaquations
//
//  Created by goVertex on 7/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GVDecimalNumber : NSObject <NSCoding>
{
    BOOL hasDecimalPoint;
    BOOL isNegative;
@private
    unsigned long long mantissa_gv;
    short exponent_gv;
    NSInteger numberOfDigits_gv;
}
@property (nonatomic) BOOL hasDecimalPoint;
@property (nonatomic) BOOL isNegative;
@property (nonatomic, readonly) NSInteger numberOfDigits;

- (void)addDigit:(NSInteger)argDigit;
- (NSDecimalNumber*)decimalNumber;
- (void)decrementExponent;
- (BOOL)isZero;
- (BOOL)isOne;
@end

