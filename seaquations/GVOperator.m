//
//  GVOperator.m
//  seaquations
//
//  Created by goVertex on 7/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GVOperator.h"

@implementation GVOperator

+ (id)addition
{
    return [[[GVOperator alloc] initWithOperator:kOperatorAddition] autorelease];
}

+ (id)subtraction
{
    return [[[GVOperator alloc] initWithOperator:kOperatorSubtraction] autorelease];
}

+ (id)multiplication
{
    return [[[GVOperator alloc] initWithOperator:kOperatorMultiplication] autorelease];
}

+ (id)division
{
    return [[[GVOperator alloc] initWithOperator:kOperatorDivision] autorelease];
}

+(id)operatorWithType:(NSInteger)argOperator
{
    return [[[GVOperator alloc] initWithOperator:argOperator] autorelease];
}

- (id)init
{
    return [self initWithOperator:0];
}

- (id)initWithOperator:(NSInteger)argOperator
{
    if ((self = [super init]))
    {
        operatorType_gv = argOperator;
    }
    return self;
}

- (id)initWithCoder:(NSCoder*)argDecoder
{
    if ((self = [super init]))
    {
        operatorType_gv = [argDecoder decodeIntegerForKey:@"OperatorType"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder*)argEncoder
{
    [argEncoder encodeInteger:operatorType_gv forKey:@"OperatorType"];
}

- (NSInteger)operatorType
{
    return operatorType_gv;
}

@end
