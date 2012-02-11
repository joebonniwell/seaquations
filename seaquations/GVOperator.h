//
//  GVOperator.h
//  seaquations
//
//  Created by goVertex on 7/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface GVOperator : NSObject <NSCoding>
{
@private
    NSInteger operatorType_gv;
}
+(id)addition;
+(id)subtraction;
+(id)multiplication;
+(id)division;
+(id)operatorWithType:(NSInteger)argOperator;
- (id)initWithOperator:(NSInteger)argOperator;
- (NSInteger)operatorType;
@end
