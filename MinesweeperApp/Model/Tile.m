//
//  Tile.m
//  MinesweeperApp
//
//  Created by Kelsey Pedersen on 8/17/15.
//  Copyright (c) 2015 Kelsey Pedersen. All rights reserved.
//

#import "Tile.h"

@implementation Tile

@synthesize disabled = _disabled;

- (BOOL)disabled {
    return _disabled;
}

- (void)setDisabled:(BOOL)disabled {
    _disabled = disabled;
}

@end
