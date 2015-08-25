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


+ (NSArray *)totalGamePieces {
    return @[@"X", @"X", @"X", @"X", @"X", @"X", @"X", @"X", @"X", @"X", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O"];
}

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
