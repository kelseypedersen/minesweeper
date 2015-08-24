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

// Create instance of the tiles array
// Instantiated for every new game

- (NSMutableArray *)tiles
{
    if (!_tiles) _tiles = [[NSMutableArray alloc]init];
    return _tiles;
}

// NEED TO ADD A TON OF LOGIC HERE FOR CHOSING TILES

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

// If the index is less than the size of the tiles array, then return the tile index
// If not, then return nil

- (Tile *)tileAtIndex:(NSUInteger)index
{
    return (index < [self.tiles count]) ? self.tiles[index] : nil;
}


- (instancetype)initWithTileCount:(NSUInteger)count
                       usingBoard:(Board *)board {
    
    self = [super init];
    
    if (self){
        for (int i = 0; i < count; i++){
            // Need to add this method
            
            Tile *tile = [board drawRandomTile];
            
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

- (void)shouldDisableGame
{
    // Need to add a ton of logic here
}

- (instancetype)init
{
    return nil;
}

@end
