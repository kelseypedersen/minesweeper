//
//  MinesweeperTileViewController.m
//  MinesweeperApp
//
//  Created by Kelsey Pedersen on 8/24/15.
//  Copyright (c) 2015 Kelsey Pedersen. All rights reserved.
//

#import "MinesweeperTileViewController.h"
#import "MinesweeperBoard.h"

@interface MinesweeperTileViewController ()

@end

@implementation MinesweeperTileViewController

- (Board *)createBoard {
    NSLog(@"minesweepertilevc - in the createBoard method");
    return [[MinesweeperBoard alloc]init];
}

@end
