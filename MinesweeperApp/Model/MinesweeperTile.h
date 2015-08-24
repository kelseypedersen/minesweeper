//
//  MinesweeperTile.h
//  MinesweeperApp
//
//  Created by Kelsey Pedersen on 8/24/15.
//  Copyright (c) 2015 Kelsey Pedersen. All rights reserved.
//


#import "Tile.h"

// Subclass of Tile class
@interface MinesweeperTile : Tile

// Add additional properties not in tile, specific to a minesweeper game

// Contains a single character representing mine - if nil, it hasn't been set yet
@property (strong, nonatomic) NSString *mine;

+ (NSArray *)totalGamePieces;


@end
