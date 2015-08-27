//
//  Game.m
//  MinesweeperApp
//
//  Created by Kelsey Pedersen on 8/17/15.
//  Copyright (c) 2015 Kelsey Pedersen. All rights reserved.
//

#import "Game.h"
#import "Board.h"

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
    Tile *tile = [self tileAtIndex:index];
    
    if ([tile isEqual: @"X"]){
        return YES;

//        [self shouldDisableGame];
        
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
    // LEFT: for all spaces on the board except the left column, where the index is divisible by 8
    if (index % 8 != 0){
        if ([self.tiles[index - 1] isEqualToString:@"X"]){
            mineCount += 1;
        }
    } // RIGHT: for all spaces on the board except the right column, where the index plus one is divisible by 8
    if ((index + 1) % 8 != 0){
        if ([self.tiles[index + 1] isEqualToString: @"X"]){
            mineCount += 1;
        }
    } // TOP: for all spaces on the board except the top row, where there are not rows above
    if (index >= 8){
        if ([self.tiles[index - 8] isEqualToString:@"X"]){
            mineCount += 1;
        }
    } // BOTTOM: for all spaces on the board except the bottom row, where there are not rows below
    if (index <= 55){
        if ([self.tiles[index + 8] isEqualToString: @"X"]){
            mineCount += 1;
        }
    } // TOP LEFT: for all spaces on the board except the top row and the left row
    if ((index >= 9) && (index % 8 != 0)){
        if ([self.tiles[index - 9] isEqualToString:@"X"]){
            mineCount += 1;
        }
    } // TOP RIGHT: for all spaces on the board except the top row and the right now
    if ((index >= 8) && ((index + 1) % 8 != 0)){
        if ([self.tiles[index - 7] isEqualToString:@"X"]){
            mineCount += 1;
        }
    } // BOTTOM LEFT:
    if ((index <= 55) && (index % 8 != 0)){
        if ([self.tiles[index + 7] isEqualToString:@"X"]){
            mineCount += 1;
        }
    } // BOTTOM RIGHT -
    if ((index <= 53) && (index + 1) % 8 != 0){
        if ([self.tiles[index + 9] isEqualToString:@"X"]){
            mineCount += 1;
        }
    }
    return mineCount;
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
            NSLog(@"tile from the draw random tile: %@", tile);

            if (tile){
                [self.tiles addObject:tile];
            } else {
                self = nil;
                break;
            }
        }
        NSLog(@"game.m - returning self.tiles: %@", self);
        
    }
    return self;
}



- (instancetype)init
{
    return nil;
}

@end
