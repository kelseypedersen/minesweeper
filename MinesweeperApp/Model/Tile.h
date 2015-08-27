//
//  Tile.h
//  MinesweeperApp
//
//  Created by Kelsey Pedersen on 8/17/15.
//  Copyright (c) 2015 Kelsey Pedersen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tile : NSObject

// Mine or no mine
@property (strong, nonatomic) NSArray *mineSymbols;

//@property (nonatomic, getter=isChosen) BOOL chosen;
//@property (nonatomic, getter=isMatched) BOOL matched;

@property (nonatomic) BOOL selected;

- (int)countSurroundingMines:(NSMutableArray *)tiles;

@end
