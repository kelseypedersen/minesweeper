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
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;
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
    [sender setTitle:[NSString stringWithFormat:@"%d", [self.game surroundingMines:tileIndex]] forState:UIControlStateNormal];
    [self updateUI];
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
        [tileButton setBackgroundColor:[UIColor grayColor]];
    }
    [self.validateLabel setBackgroundImage:[self newBoardValidateImageForGame] forState:UIControlStateNormal];
    [self updateUI];
}


# pragma mark Validate

- (IBAction)validateButton {
    [self.game validateTiles];
}

- (IBAction)cheatButton {
    [self.game cheat];
    [self updateUI];
}


# pragma mark Cheat

- (UIImage *)disableBoardValidateImageForGame {
    return [UIImage imageNamed:@"smiley-face-dead"];
}

- (UIImage *)newBoardValidateImageForGame {
    return [UIImage imageNamed:@"smiley-face-with-mustache"];
}


# pragma mark Update
// Runs every move to update the board
- (void)updateUI
{
    for (UIButton *tileButton in self.tileButtons){
        NSInteger tileIndex = [self.tileButtons indexOfObject:tileButton];
        MinesweeperTile *tile = [self.game tileAtIndex:tileIndex];
        if (tile.disabled){
            [tileButton setBackgroundColor:[UIColor blueColor]];
        }
        tileButton.enabled = !tile.disabled;
    }
}

- (UIColor *)backgroundColorForTile:(Tile *)tile
{
    // Add additional logic for UIImage later -- see cardGame
    return [UIColor greenColor];
}


- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
