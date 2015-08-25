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
@property (strong, nonatomic)NSMutableArray *tiles;
@end

@implementation Game

- (int)surroundingMines:(NSInteger)index {
    int mineCount = 0;
    
    // LEFT: for all spaces on the board except the left column, where the index is divisible by 8
    if (index % 8 != 0){
        if ([self.tiles[index - 1] isEqualToString:@"X"]){
            mineCount += 1;
        }
    }
    // RIGHT: for all spaces on the board except the right column, where the index plus one is divisible by 8
    if ((index + 1) % 8 != 0){
        if ([self.tiles[index + 1] isEqualToString: @"X"]){
            mineCount += 1;
        }
    }
    // TOP: for all spaces on the board except the top row, where there are not rows above
    if (index >= 8){
        if ([self.tiles[index - 8] isEqualToString:@"X"]){
            mineCount += 1;
        }
    }
    // BOTTOM: for all spaces on the board except the bottom row, where there are not rows below
    if (index <= 55){
        if ([self.tiles[index + 8] isEqualToString: @"X"]){
            mineCount += 1;
        }
    }
    // TOP LEFT: for all spaces on the board except the top row and the left row
    
    if ((index >= 9) && (index % 8 != 0)){
        NSLog(@"in the top left if statement");
        if ([self.tiles[index - 9] isEqualToString:@"X"]){
            mineCount += 1;
        }
    }
    // TOP RIGHT: for all spaces on the board except the top row and the right now
    if ((index >= 8) && ((index + 1) % 8 != 0)){
        NSLog(@"in the top right if statement");
        if ([self.tiles[index - 7] isEqualToString:@"X"]){
            mineCount += 1;
        }
    }
    // BOTTOM LEFT:
    if ((index <= 55) && (index % 8 != 0)){
        NSLog(@"in the bottom left if statement");
        if ([self.tiles[index + 7] isEqualToString:@"X"]){
            mineCount += 1;
        }
    }
    // BOTTOM RIGHT -
    if ((index <= 53) && (index + 1) % 8 != 0){
        NSLog(@"in the bottom right if statement");
        if ([self.tiles[index + 9] isEqualToString:@"X"]){
            mineCount += 1;
        }
    }
    
    NSLog(@"********MINE COUNT: %d", mineCount);
    
    return mineCount;
    
}


//- (int)countSurroundingMines:(NSMutableArray *)tiles{
//    
//    // Look for up down left right and diagonals
//    // case switch statement
//    // add one to mine count
//    // return mine count
//    
//}

- (void)inactivateAllSurroundingMines{
    
}












// Create instance of the tiles array
// Instantiated for every new game

- (NSMutableArray *)tiles
{
    if (!_tiles) _tiles = [[NSMutableArray alloc]init];
    return _tiles;
}


//- (void)chooseTileAtIndex:(NSUInteger)index
////{
////    Tile *tile = [self tileAtIndex:index];
////    NSLog(@"returning tile: %@", tile);
////    
////    if (!tile.isInactive){
////        NSLog(@"chosen again!");
////        tile.chosen = YES;
////        // if tile is equal to X
////            // deactivate game
////        // if tile is equal to O
////            // run count surrounding mines method -- give index in method
////                // if return value equals 0
////
////    }
//}

// If the index is less than the size of the tiles array, then return the tile index
// If not, then return nil


- (Tile *)tileAtIndex:(NSUInteger)index
{
    return (index < [self.tiles count]) ? self.tiles[index] : nil;
}


// Drawing from the drawRandomTile method in the board
// Adding to new array of tiles
// returning array of tile

- (instancetype)initWithTileCount:(NSUInteger)count
                       usingBoard:(Board *)board {
    
    self = [super init];
    
    if (self){
        for (int i = 0; i < count; i++){
            Tile *tile = [board drawRandomTile];
            
            if (tile){
                [self.tiles addObject:tile];
            } else {
                self = nil;
                break;
            }
        }
        NSLog(@"game.m - returning self.tiles: %@", self.tiles);
        
    }
    return self;
}

- (void)shouldDisableGame
{
    // Need to add a ton of logic here
}

- (instancetype)init
{
    return nil;
}

@end
