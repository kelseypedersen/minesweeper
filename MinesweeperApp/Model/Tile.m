//
//  Tile.m
//  MinesweeperApp
//
//  Created by Kelsey Pedersen on 8/17/15.
//  Copyright (c) 2015 Kelsey Pedersen. All rights reserved.
//

#import "Tile.h"

@implementation Tile

@synthesize selected = _selected;

- (BOOL)selected {
    return _selected;
}

- (void)setSelected:(BOOL)selected {
    _selected = selected;
}


@end
