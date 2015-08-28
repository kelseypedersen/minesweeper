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


//
//- (IBAction)validateButton;

- (IBAction)tilePressed:(UIButton *)sender;

@end


@implementation ViewController

- (Board *)createBoard
{
    NSLog(@"view controller - create board method");
    return nil;
}

- (Game *)game
{
    if (!_game)_game = [[Game alloc]initWithTileCount:[self.tileButtons count]
                                           usingBoard:[self createBoard]];
    return _game;
}


# pragma mark Reset Game Button

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
        [tileButton setTitle:@"" forState:UIControlStateSelected];
        [tileButton setBackgroundColor:[UIColor grayColor]];
    }
      [self.validateLabel setBackgroundImage:[self newBoardValidateImageForGame] forState:UIControlStateNormal];
    [self.minesweepertilevc createBoard];
    
    //    [self updateUI];
}


# pragma mark Tile Pressed

- (IBAction)validateButton {
    // For all buttons on the board
    for (UIButton *tileButton in self.tileButtons){
        NSUInteger tileButtonIndex = [self.tileButtons indexOfObject:tileButton];
        // And for all buttons still enabled
        if (tileButton.enabled){
            if (![[self.game tileAtIndex:tileButtonIndex] isEqual: @"X"]){
                [self disableBoard:tileButton];
            }
        }
    }
}


# pragma mark Cheat Button




- (IBAction)tilePressed:(UIButton *)sender
{
    NSLog(@"tile pressed %@", sender);
    
    NSUInteger tileIndex = [self.tileButtons indexOfObject:sender];
    
    // Clicked on a mine --> End game
    if ([self.game chooseTileAtIndex:tileIndex] == YES){
        [self disableBoard:sender];
    }
    
    // Clicked on a tile with no mines surrounding --> Disable surrounding mines
    else if ([self.game surroundingMines:tileIndex] == 0){
        [self.game disableTheMines:tileIndex];
        [sender setBackgroundColor:[UIColor grayColor]];
        
    // Clicked on a tile with mines surrounding it --> Show # of mines surrounding
    }else {
        [sender setTitle:[NSString stringWithFormat:@"%d", [self.game surroundingMines:tileIndex]] forState:UIControlStateNormal];
        [sender setBackgroundColor:[UIColor grayColor]];
    }
    
//    [NSTimer scheduledTimerWithTimeInterval:12.0f target:self selector:@selector(timerLabel:) userInfo:nil repeats:NO];
//    
//    NSTimer *time = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerLabel:) userInfo:nil repeats:NO];
//    NSInteger countdown = [time fireDate];
    
    
//    [self updateUI];

}

//- (void)timerLabel:(NSTimer *)timer {
//    NSLog(@"%%%%%%%%%%%%%%%%time label is being fired");
//    NSLog(@"TIMER OBJECT %@", timer);
//    self.timerLabel.text = [NSString stringWithFormat:@"%@", countdown];
//}


// ** Originally had in the game model, but needed to access the sender button to be able to disable the surrounding buttons.
// Should change to be in the game model, and change the tile property to matched
// Then will update within the update UI method

- (void)disableMines:(UIButton *)tile{
    
    NSUInteger tileIndex = [self.tileButtons indexOfObject:tile];
    
    if (tileIndex % 8 != 0){ 
        UIButton *leftTile = self.tileButtons[tileIndex - 1];
        leftTile.enabled = NO;
        [leftTile setTitle:@"" forState:UIControlStateNormal];
        [leftTile setBackgroundColor:[UIColor grayColor]];
    }
    if ((tileIndex + 1) % 8 != 0){
        UIButton *rightTile = self.tileButtons[tileIndex + 1];
        rightTile.enabled = NO;
        [rightTile setTitle:@"" forState:UIControlStateNormal];
        [rightTile setBackgroundColor:[UIColor grayColor]];
    }
    if (tileIndex >= 8){
        UIButton *topTile = self.tileButtons[tileIndex - 8];
        topTile.enabled = NO;
        [topTile setTitle:@"" forState:UIControlStateNormal];
        [topTile setBackgroundColor:[UIColor grayColor]];
    }
    if (tileIndex <= 55){
        UIButton *bottomTile = self.tileButtons[tileIndex + 8];
        bottomTile.enabled = NO;
        [bottomTile setTitle:@"" forState:UIControlStateNormal];
        [bottomTile setBackgroundColor:[UIColor grayColor]];
    }
    if ((tileIndex >= 9) && (tileIndex % 8 != 0)){
        UIButton *topLeftTile = self.tileButtons[tileIndex - 9];
        topLeftTile.enabled = NO;
        [topLeftTile setTitle:@"" forState:UIControlStateNormal];
        [topLeftTile setBackgroundColor:[UIColor grayColor]];

    }
    if ((tileIndex >= 8) && (tileIndex + 1) % 8 != 0){
        UIButton *topRightTile = self.tileButtons[tileIndex - 7];
        topRightTile.enabled = NO;
        [topRightTile setTitle:@"" forState:UIControlStateNormal];
        [topRightTile setBackgroundColor:[UIColor grayColor]];
    }
    
    if ((tileIndex <= 55) && (tileIndex % 8 != 0)){
        UIButton *bottomLeftTile = self.tileButtons[tileIndex + 7];
        bottomLeftTile.enabled = NO;
        [bottomLeftTile setTitle:@"" forState:UIControlStateNormal];
        [bottomLeftTile setBackgroundColor:[UIColor grayColor]];
    }
    if ((tileIndex <= 53) && (tileIndex + 1) % 8 != 0){
        UIButton *bottomRightTile = self.tileButtons[tileIndex + 9];
        bottomRightTile.enabled = NO;
        [bottomRightTile setTitle:@"" forState:UIControlStateNormal];
        [bottomRightTile setBackgroundColor:[UIColor grayColor]];
    }
}


// Ends the game

- (void)disableBoard:(UIButton *)tile{
    [tile setTitle:[NSString stringWithFormat:@"X"] forState:UIControlStateNormal];
    for (UIButton *tileButton in self.tileButtons){
        
        if (tileButton.enabled == NO){
            
        } else {
            tileButton.enabled = NO;
        }
        NSLog(@"tile button: %@", tileButton);
        
        NSInteger tileIndex = [self.tileButtons indexOfObject:tileButton];
        Tile *tile = [self.game tileAtIndex:tileIndex];
        [tileButton setTitle:[NSString stringWithFormat:@"%@", tile] forState:UIControlStateNormal];
        [tileButton setBackgroundColor:[UIColor grayColor]];
        [self.validateLabel setBackgroundImage:[self disableBoardValidateImageForGame] forState:UIControlStateNormal];
        
    }
}
         
- (UIImage *)disableBoardValidateImageForGame {
    return [UIImage imageNamed:@"smiley-face-dead"];
}

- (UIImage *)newBoardValidateImageForGame {
    return [UIImage imageNamed:@"smiley-face-with-mustache"];
}


// Run every move to update the board

- (void)updateUI
{
    for (UIButton *tileButton in self.tileButtons){
        NSInteger tileIndex = [self.tileButtons indexOfObject:tileButton];
        MinesweeperTile *tile = [self.game tileAtIndex:tileIndex];
//        if (tile.disabled){
            [tileButton setBackgroundColor:[self backgroundColorForTile:tile]];
//        }
//        tileButton.enabled = !tile.disabled;
    }
}

- (UIColor *)backgroundColorForTile:(Tile *)tile
{
    // Add additional logic for UIImage later -- see cardGame
    return [UIColor greenColor];
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
