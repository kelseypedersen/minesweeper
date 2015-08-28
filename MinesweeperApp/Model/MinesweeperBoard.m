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

// This is creating a board with all possible outcomes, in our case its one X and one O

-(instancetype)init{
    
    // Testing to see if you can initialize the superclass.
    // If nil, cannot initialize.
    // Use self as protection from continuing with nil.
    
    self = [super init];
    if (self){
      for (NSString *mine in [MinesweeperTile totalGamePieces]){
            MinesweeperTile *tile = [[MinesweeperTile alloc]init];
                tile.mine = mine;
            [self addTile:tile];
        }
    }

    // Returning MinesweeperTile objects woohoo! <MinesweeperTile 0x7a34u53>
    return self;
}


@end
