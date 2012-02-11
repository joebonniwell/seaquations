//
//  seaquationsTile.h
//  seaquations
//
//  Created by goVertex on 7/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol seaquationsTileDelegate <NSObject>

- (void)tileSelected:(id)argTile;

@end

@interface seaquationsTile : NSObject <NSCoding>
{
    id delegate;
    NSInteger tileType;
    UIButton *tileButton;
    BOOL isFalling;
    BOOL isSelected;
}
@property (nonatomic, assign) id delegate;
@property (nonatomic) NSInteger tileType;
@property (nonatomic, retain) UIButton *tileButton;
@property (nonatomic) BOOL isFalling;
@property (nonatomic) BOOL isSelected;

- (id)initWithType:(NSInteger)argTileType;
- (void)setTitleForTileType;
@end
