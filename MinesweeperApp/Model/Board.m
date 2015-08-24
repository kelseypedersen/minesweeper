//
//  Board.m
//  MinesweeperApp
//
//  Created by Kelsey Pedersen on 8/17/15.
//  Copyright (c) 2015 Kelsey Pedersen. All rights reserved.
//

#import "Board.h"
#import "Tile.h"

@interface Board ()

@property (strong, nonatomic) NSMutableArray *tiles;
//@property (nonatomic) NSInteger currentMineCount;

@end

static const int TOTAL_MINES = 64;

@implementation Board

// Creating board

- (NSMutableArray *)tiles {
    if (!_tiles) _tiles = [[NSMutableArray alloc]init];
    return _tiles;
}

//- (void)createBoard:(Tile *)tile{
//    for (NSInteger i = 0; i < TOTAL_MINES; i++){
//        
//        [self.board addObject:tile];
//        NSLog(@"%@", self.board);
//        
//        // If count mines, returns a YES value
//        // Randomly add either mine or no mine - [self randomSymbol]
//        
//        // If count mines, returns too many mines
//        // Add a non-mine [self.board addObject:tile.with_mine[NO]]
//        
//        // If count mines, returns too many spaces
//        // Add add mine [self.board addObject:tile.with_mine[YES]]
//        
//        
//   }
//}

//- (void)randomSymbol:(Tile *)mineSymbols {
//    NSInteger *randomIndex = arc4random() % 2;
//    [self.board addObject:tile.is_mine[0]];
//    
//}

//- (int)countMines:(Board *)board {
//    
//    int currentMineCount = 0;
//    
//    for (Tile *tile in board){
//        
//        if (tile.is_mine == YES) {
//            currentMineCount += 1;
//        }
//    }
//    return currentMineCount;
//}



@end
