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
@property (strong, nonatomic) NSMutableArray *totalTiles;

@end


@implementation Board

// Creating board - instantiating the tiles array which will hold the 64 tiles from the minesweeper game
// Allocating memory and creating a pointer towards the location in memory
// Haven't added anything to this array, yet.

// Creating the memory and space capacity to create a tiles array, aka board
- (NSMutableArray *)tiles {
    if (!_tiles) _tiles = [[NSMutableArray alloc]init];
    return _tiles;
}

//- (NSMutableArray *)totalTiles {
//    if (!_totalTiles) _totalTiles = [[NSMutableArray alloc]initWithArray:[MinesweeperTile totalGamePieces]];
//    return _totalTiles;
//}



// Drawing random tile from the main tiles array with 10 mines and pushing in the tiles array
// Mines are set in the initial cards array, not here


- (Tile *)drawRandomTile{
    
    Tile *randomTile = nil;
    
    if ([self.tiles count]) {
        unsigned index = arc4random() % [self.tiles count];
        // Total tiles needs to be an array of objects with contents of X and O's, not just X & O's
        // So when randomly drawing, we are drawing objects in the array
        randomTile = self.tiles[index];
        [self.tiles removeObjectAtIndex:index];
    }
    NSLog(@"tiles array %@", self.tiles);
    return randomTile;
}


// Use this method in the MineSweeperBoard.m file to add tiles to the tiles mutable array
// Will add to the end of the array because addObject inserts at the end

- (void)addTile:(Tile *)tile
{
    [self.tiles addObject:tile];
}





@end
