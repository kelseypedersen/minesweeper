//
//  Tile.m
//  MinesweeperApp
//
//  Created by Kelsey Pedersen on 8/17/15.
//  Copyright (c) 2015 Kelsey Pedersen. All rights reserved.
//

#import "Tile.h"

@implementation Tile


+ (NSArray *)mineSymbols {
    NSLog(@"returning mineSymbols");
    return @[@0, @1];
}



- (void)setMines:(NSString *)mine {
    NSLog(@"Setting mines");
    if ([[Tile mineSymbols]containsObject:mine]){
        _mine = mine;
    }
}




// Method to count surrounding mines



@end
