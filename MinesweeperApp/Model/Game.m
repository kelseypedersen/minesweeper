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
    NSLog(@"game.m - in the creation of the instance of the tiles array");
    return _tiles;
}

// NEED TO ADD A TON OF LOGIC HERE FOR CHOSING TILES

- (void)chooseTileAtIndex:(NSUInteger)index
{
    // Tile selected in the view is now the tile we are referencing in this method
    NSLog(@"game.m - in the choose tile at index method!");
    
    Tile *tile = [self tileAtIndex:index];
    
//    if (!tile.isDisabled){
//        NSLog(@"chosen again!");
//        tile.chosen = YES;
//    }
}

// If the index is less than the size of the tiles array, then return the tile index
// If not, then return nil

- (Tile *)tileAtIndex:(NSUInteger)index
{
    NSLog(@"game - in the tile at index method");
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
        NSLog(@"game.m - returning self: %@", self);
        
    }
    return self;
}

- (void)shouldDisableGame
{
    // Need to add a ton of logic here
}

- (instancetype)init
{
    NSLog(@"game.m - in the game init method");
    return nil;
}

@end
