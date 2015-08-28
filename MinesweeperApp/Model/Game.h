//
//  Game.h
//  MinesweeperApp
//
//  Created by Kelsey Pedersen on 8/17/15.
//  Copyright (c) 2015 Kelsey Pedersen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Board.h"

@interface Game : NSObject

- (instancetype)initWithTileCount:(NSUInteger)count
                       usingBoard:(Board *)board;

- (void)chooseTileAtIndex:(NSUInteger)index;
- (Tile *)tileAtIndex:(NSUInteger)index;

- (int)surroundingMines:(NSInteger)index;
- (int)countSurroundingMines:(NSMutableArray *)tiles;

- (void)shouldDisableGame;
- (void)disableSurroundingMines:(NSInteger)index;

- (void)validateTiles;
- (NSInteger)currentMines;
- (void)cheat;

@end
