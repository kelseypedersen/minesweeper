//
//  MinesweeperBoard.m
//  MinesweeperApp
//
//  Created by Kelsey Pedersen on 8/24/15.
//  Copyright (c) 2015 Kelsey Pedersen. All rights reserved.
//

#import "MinesweeperBoard.h"
#import "MinesweeperTile.h"

const int COUNT = 64;

@implementation MinesweeperBoard

-(instancetype)init{
    
    // Testing to see if you can initialize the superclass.
    // If nil, cannot initialize.
    // Use self as protection from continuing with nil.
    
    self = [super init];
    if (self){

        for (NSString *mine in [MinesweeperTile totalGamePieces]){
            
            MinesweeperTile *tile = [[MinesweeperTile alloc]init];
            tile.mine = mine;
            // Inheriting method from Board
            [self addTile:tile];
        }
    }
    NSLog(@"minesweeper board: %@", self);
    return self;
}


@end
