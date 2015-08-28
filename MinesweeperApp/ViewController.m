//
//  ViewController.m
//  MinesweeperApp
//
//  Created by Kelsey Pedersen on 8/17/15.
//  Copyright (c) 2015 Kelsey Pedersen. All rights reserved.
//

#import "ViewController.h"
#import "MinesweeperTileViewController.h"
#import "Game.h"
#import "Board.h"
#import "Tile.h"
#import "MinesweeperTile.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *gameView;
@property (strong, nonatomic) Game *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *tileButtons;
@property (strong, nonatomic)MinesweeperTileViewController *minesweepertilevc;
@property (weak, nonatomic) IBOutlet UIButton *validateLabel;

- (IBAction)validateButton;
- (IBAction)cheatButton;
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

- (IBAction)tilePressed:(UIButton *)sender
{
    NSUInteger tileIndex = [self.tileButtons indexOfObject:sender];
    [self.game chooseTileAtIndex:tileIndex];
    
    [self setTileFormatting:sender];
    
    [self updateUI];
}

- (void)setTileFormatting:(UIButton *)sender{
     NSUInteger tileIndex = [self.tileButtons indexOfObject:sender];
    int surroundingMines = [self.game surroundingMines:tileIndex];
    [sender setTitle:[NSString stringWithFormat:@"%d", surroundingMines] forState:UIControlStateNormal];
    if (surroundingMines == 1) {
        [sender setTintColor:[UIColor blueColor]];
    } else if (surroundingMines == 2){
        [sender setTintColor:[UIColor greenColor]];
    } else if (surroundingMines == 3){
        [sender setTintColor:[UIColor redColor]];
    } else {
        [sender setTintColor:[UIColor blackColor]];
    }
}

# pragma mark New Game

- (IBAction)restartGameAlert {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Are you sure?"
                                                    message:@"This will reset your game"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Okay", nil];
    
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [self newBoard];
    }
}

- (void)newBoard{
    self.game = [[Game alloc]initWithTileCount:[self.tileButtons count]
                                    usingBoard:[self createBoard]];
    for (UIButton *tileButton in self.tileButtons){
        [tileButton setTitle:@"" forState:UIControlStateNormal];
        [tileButton setBackgroundColor:[UIColor lightGrayColor]];
    }

    [self updateUI];
}



- (IBAction)validateButton {
    [self.game validateTiles];
}


- (IBAction)cheatButton {
    [self.game cheat];
    [self updateUI];
}

// Runs every move to update the board
- (void)updateUI
{
    for (UIButton *tileButton in self.tileButtons){
        NSInteger tileIndex = [self.tileButtons indexOfObject:tileButton];
        MinesweeperTile *tile = [self.game tileAtIndex:tileIndex];
        if ((tile.disabled) && [tile.mine isEqual: @"X"]){
            [tileButton setBackgroundColor:[UIColor redColor]];
        }
        else if (tile.disabled){
            [tileButton setBackgroundColor:[UIColor grayColor]];
        }
        tileButton.enabled = !tile.disabled;
    
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
