//
//  MinesweeperTile.m
//  MinesweeperApp
//
//  Created by Kelsey Pedersen on 8/24/15.
//  Copyright (c) 2015 Kelsey Pedersen. All rights reserved.
//

#import "MinesweeperTile.h"
#import "Game.h"

@interface MinesweeperTile ()

@property (nonatomic, strong) NSMutableArray *allMineSymbols;
@property (nonatomic) NSInteger *mineCount;

@end

@implementation MinesweeperTile

@synthesize mine = _mine;

// If we want to change the board size, we would create this dynamically, by counting the number of mines being adding to the tiles array, and adding in the final objects based off of the mine/non-mine count. For the sake of this challenge, I think this works well since no changes to the board size or mine count are being made.

+ (NSArray *)totalGamePieces {
    return @[@"X", @"X", @"X", @"X", @"X", @"X", @"X", @"X", @"X", @"X", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O"];
}




@end
