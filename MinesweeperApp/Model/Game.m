//
//  Game.m
//  MinesweeperApp
//
//  Created by Kelsey Pedersen on 8/17/15.
//  Copyright (c) 2015 Kelsey Pedersen. All rights reserved.
//

#import "Game.h"
#import "Board.h"
#import "MinesweeperTile.h"

@interface Game ()
@property (strong, nonatomic) NSMutableArray *tiles;
@end

@implementation Game

#pragma mark Tiles for Game

// Lazy instantiation of the tiles array for each game

- (NSMutableArray *)tiles
{
    if (!_tiles) _tiles = [[NSMutableArray alloc]init];
    return _tiles;
}


#pragma mark Counting Mines

// Counts the surrounding mines to the pressed tile button
// Returns the mine count

- (BOOL)chooseTileAtIndex:(NSUInteger)index
{
    MinesweeperTile *tile = [self tileAtIndex:index];
    
    if ([tile.mine isEqual: @"X"]){
        return YES;

//       [self shouldDisableGame];
        
        // deactivate game
        // show all @"X"s
        // for loop through the board
    } else {
        if ([self surroundingMines:index] == 0){
//            [self inactivateAllSurroundingMines:index];
        }
        return NO;
    }
}

- (int)surroundingMines:(NSInteger)index {
    int mineCount = 0;
    if (index % 8 != 0){
        MinesweeperTile *leftTile = [self tileAtIndex:(index - 1)];
        if ([leftTile.mine isEqualToString: @"X"]){
            mineCount += 1;
            NSLog(@"left");
        }
    }
    if ((index + 1) % 8 != 0){
        MinesweeperTile *rightTile = [self tileAtIndex:(index + 1)];
        if ([rightTile.mine isEqualToString:@"X"]){
            mineCount += 1;
            NSLog(@"right");
        }
    }
    if (index >= 8){
        MinesweeperTile *topTile = [self tileAtIndex:(index - 8)];
        if ([topTile.mine isEqualToString:@"X"]){
            mineCount += 1;
            NSLog(@"top");
        }
    }
    if (index <= 55){
        MinesweeperTile *bottomTile = [self tileAtIndex:(index + 8)];
        if ([bottomTile.mine isEqualToString:@"X"]){
            mineCount += 1;
            NSLog(@"bottom");
        }
    }
    if ((index >= 9) && (index % 8 != 0)){
        MinesweeperTile *topLeft = [self tileAtIndex:(index - 9)];
        if ([topLeft.mine isEqualToString:@"X"]){
            mineCount += 1;
            NSLog(@"top left");
        }
    }
    if ((index >= 8) && ((index + 1) % 8 != 0)){
        MinesweeperTile *topRight = [self tileAtIndex:(index - 7)];
        if ([topRight.mine isEqualToString:@"X"]){
            mineCount += 1;
            NSLog(@"top right");
        }
    }
    if ((index <= 55) && (index % 8 != 0)){
        MinesweeperTile *bottomLeft = [self tileAtIndex:(index + 7)];
        if ([bottomLeft.mine isEqualToString:@"X"]){
            mineCount += 1;
            NSLog(@"bottom left");
        }
    }
    if ((index <= 53) && (index + 1) % 8 != 0){
        MinesweeperTile *bottomRight = [self tileAtIndex:(index + 9)];
        if ([bottomRight.mine isEqualToString:@"X"]){
            mineCount += 1;
            NSLog(@"bottom right");
        }
    }
    return mineCount;
}


- (void)disableSurroundingMines:(NSInteger)tileIndex{
    
    if (tileIndex % 8 != 0){
        MinesweeperTile *leftTile = self.tiles[tileIndex - 1];
        leftTile.disabled = YES;
    }
    if ((tileIndex + 1) % 8 != 0){
        MinesweeperTile *rightTile = self.tiles[tileIndex + 1];
        rightTile.disabled = YES;
    }
    if (tileIndex >= 8){
        MinesweeperTile *topTile = self.tiles[tileIndex - 8];
        topTile.disabled = YES;
    }
    if (tileIndex <= 55){
        MinesweeperTile *bottomTile = self.tiles[tileIndex + 8];
        bottomTile.disabled = YES;
    }
    if ((tileIndex >= 9) && (tileIndex % 8 != 0)){
        MinesweeperTile *topLeftTile = self.tiles[tileIndex - 9];
        topLeftTile.disabled = YES;
    }
    if ((tileIndex >= 8) && (tileIndex + 1) % 8 != 0){
        MinesweeperTile *topRightTile = self.tiles[tileIndex - 7];
        topRightTile.disabled = YES;
    }
    if ((tileIndex <= 55) && (tileIndex % 8 != 0)){
        MinesweeperTile *bottomLeftTile = self.tiles[tileIndex + 7];
        bottomLeftTile.disabled = YES;
    }
    if ((tileIndex <= 53) && (tileIndex + 1) % 8 != 0){
        MinesweeperTile *bottomRightTile = self.tiles[tileIndex + 9];
        bottomRightTile.disabled = YES;
    }
}



- (void)disableBoard:(Tile *)tile{
    for (Tile *tile in self.tiles){
        if (tile.disabled == NO){
            tile.disabled = YES;
            NSLog(@"disabled board!!!");
        }
    }
}


- (Tile *)tileAtIndex:(NSUInteger)index
{
    return (index < [self.tiles count]) ? self.tiles[index] : nil;
}

// Drawing from the drawRandomTile method in the board; Adding to new array of tiles; returning array of tile

- (instancetype)initWithTileCount:(NSUInteger)count
                       usingBoard:(Board *)board {
    
    self = [super init];
    
    if (self){
        for (int i = 0; i < count; i++){
            Tile *tile = [board drawRandomTile];
            // Draw random tile should be returning an object, not a string
            NSLog(@"TILE %@", tile);
            if (tile){
                [self.tiles addObject:tile];
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}



- (instancetype)init
{
    return nil;
}

@end
