//
//  ViewController.m
//  MinesweeperApp
//
//  Created by Kelsey Pedersen on 8/17/15.
//  Copyright (c) 2015 Kelsey Pedersen. All rights reserved.
//

#import "ViewController.h"
#import "Game.h"
#import "Board.h"
#import "Tile.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *gameView;
@property (strong, nonatomic) Game *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *tileButtons;

- (IBAction)tilePressed:(UIButton *)sender;

@end



@implementation ViewController

- (Board *)createBoard
{
    return nil;
}

- (Game *)game
{
    if (!_game)_game = [[Game alloc]initWithTileCount:[self.tileButtons count]
                                           usingBoard:[self createBoard]];
    return _game;
}



- (void)newGame
{
    self.game = [[Game alloc]init];
    [self updateUI];
}

- (IBAction)tilePressed:(UIButton *)sender
{
    NSLog(@"%lu", (unsigned long)[self.tileButtons indexOfObject:sender]);
//    NSUInteger tileIndex = [self.tileButton indexOfObject:sender];

//    [self.game chooseTileAtIndex:tileIndex];
    
}
    
//  Need to create update UI method
//  [self updateUI];


- (void)updateUI
{
    for (UIButton *oneTileButton in self.tileButtons){
        NSInteger tileIndex = [self.tileButtons indexOfObject:oneTileButton];
        Tile *tile = [self.game tileAtIndex:tileIndex];
        [oneTileButton setBackgroundColor:[self backgroundColorForTile:tile]];
        oneTileButton.enabled = !tile.isDisabled;
    }
}

- (UIColor *)backgroundColorForTile:(Tile *)tile
{
    // Add additional logic for UIImage later -- see cardGame
    return [UIColor redColor];
}



- (void)viewDidLoad {
    [super viewDidLoad];
//    [Board createBoard];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
