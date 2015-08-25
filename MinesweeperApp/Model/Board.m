//
//  Board.m
//  MinesweeperApp
//
//  Created by Kelsey Pedersen on 8/17/15.
//  Copyright (c) 2015 Kelsey Pedersen. All rights reserved.
//

#import "Board.h"
#import "Tile.h"
#import "MinesweeperTile.h"

@interface Board ()

@property (strong, nonatomic) NSMutableArray *tiles;
@property (strong, nonatomic) NSMutableArray *totalMinesCopy;

@end


@implementation Board

// Creating board - instantiating the tiles array which will hold the 64 tiles from the minesweeper game
// Allocating memory and creating a pointer towards the location in memory
// Haven't added anything to this array, yet.


- (NSMutableArray *)tiles {
    if (!_tiles) _tiles = [[NSMutableArray alloc]init];
    return _tiles;
}


// Drawing random tile from the main tiles array with 10 mines and pushing in the tiles array
// Mines are set in the initial cards array, not here


- (Tile *)drawRandomTile{
    
    Tile *randomTile = nil;
    
    if ([self.tiles count]) {
        unsigned index = arc4random() % [self.tiles count];
        randomTile = self.tiles[index];
        [self.tiles removeObjectAtIndex:index];
    }
    
    return randomTile;
    
}


// Use this method in the MineSweeperBoard.m file to add tiles to the tiles mutable array
// Will add to the end of the array because addObject inserts at the end

- (void)addTile:(Tile *)tile
{
    [self.tiles addObject:tile];
}




//- (void)randomSymbol:(Tile *)mineSymbols {
//    NSInteger *randomIndex = arc4random() % 2;
//    [self.board addObject:tile.is_mine[0]];
//    
//}

//- (int)countMines:(Board *)board {
//    
//    int currentMineCount = 0;
//    
//    for (Tile *tile in board){
//        
//        if (tile.is_mine == YES) {
//            currentMineCount += 1;
//        }
//    }
//    return currentMineCount;
//}



@end
