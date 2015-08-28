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

+ (NSArray *)totalGamePieces {
    return @[@"X", @"X", @"X", @"X", @"X", @"X", @"X", @"X", @"X", @"X", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O", @"O"];
}


//+ (NSArray *)gameSymbols
//{
//    return @[@"X", @"O"];
//}
//
//// This should return either a X or O
//- (NSString *)contents
//{
//    return [NSString stringWithFormat:@"%@", self.mine];
//}


@end
