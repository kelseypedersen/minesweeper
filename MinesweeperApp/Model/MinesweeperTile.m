//
//  MinesweeperTile.m
//  MinesweeperApp
//
//  Created by Kelsey Pedersen on 8/24/15.
//  Copyright (c) 2015 Kelsey Pedersen. All rights reserved.
//

#import "MinesweeperTile.h"

static const int MINE_COUNT = 10;
static const int TOTAL_TILE_COUNT = 64;

@interface MinesweeperTile ()

@property (nonatomic, strong) NSMutableArray *allMineSymbols;

@end

@implementation MinesweeperTile

@synthesize mine = _mine;

// X == mine, O == no mine

// Class method

// Creating the mine symbols array which contains all the pieces for the minesweeper game
// We are going to pull random indexes from this array by copying the array, and then deleting the items in the array as we create our unique boads for each game.

+ (NSArray *)totalGamePieces {
    
    NSMutableArray *allMineSymbols = nil;
    
    for (int i = 0; i < TOTAL_TILE_COUNT; i++){
        NSMutableArray *allMineSymbols = [[NSMutableArray alloc]init];
        if ([allMineSymbols count] < MINE_COUNT){
            [allMineSymbols addObject:@"X"];
        }else{
            [allMineSymbols addObject:@"O"];
        }
    }
    return allMineSymbols;
}


    
//    return @[@"X", @"X", @"X", @"X", @"X", @"X", @"X", @"X", @"X", @"X", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O"];

//- (void)setMine:(NSString *)mine
//{
//    // Sending containObject to the array created below
//    if ([[MinesweeperTile mineSymbols]containsObject:mine]){
//        _mine = mine;
//    }
//}
//
//- (NSString *) mine
//{
//    return _mine ? _mine : @"?";
//}
//
//- (NSString *)contents
//{
//    NSArray *mineStrings = [MinesweeperTile allMineSymbols];
//    // Not sure why this isn't working...
//    // Come back to this
//    // Trying to return the contents of one tile
//    return self.mine;
//}


@end
