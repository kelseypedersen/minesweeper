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

+ (NSArray *)validSymbols {
    return @[@"X", @"O"];
}


- (void)setMine:(NSString *)mine{
    // Sending containObject: to the array of created below
    if ([[MinesweeperTile validSymbols]containsObject:mine]){
        mine = _mine;
    }
}

- (NSString *)mine {
    return _mine ? _mine : @"no mine set";
}






+ (NSArray *)totalGamePieces {
    return @[@"X", @"X", @"X", @"X", @"X", @"X", @"X", @"X", @"X", @"X", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O"];
}








@end
