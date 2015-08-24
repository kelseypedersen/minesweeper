//
//  Game.m
//  MinesweeperApp
//
//  Created by Kelsey Pedersen on 8/17/15.
//  Copyright (c) 2015 Kelsey Pedersen. All rights reserved.
//

#import "Game.h"

@interface Game ()
@property (strong, nonatomic)NSMutableArray *tiles;
@end

@implementation Game

// Create instance of the tiles array
// Instantiated for every new game

- (NSMutableArray *)tiles
{
    if (!_tiles) _tiles = [[NSMutableArray alloc]init];
    return _tiles;
}

- (void)chooseTileAtIndex:(NSUInteger)index
{
    // Tile selected in the view is now the tile we are referencing in this method
    
    Tile *tile = [self tileAtIndex:index];
    
    if (!tile.isDisabled){
        if (tile.isChosen){
            NSLog(@"chosen!");
        }
    }
}

@end
