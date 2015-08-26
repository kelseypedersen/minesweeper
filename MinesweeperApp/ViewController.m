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
#import "MinesweeperTile.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *gameView;
@property (strong, nonatomic) Game *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *tileButtons;

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
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Retile, fo real?"
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
        [tileButton setTitle:nil forState:UIControlStateNormal];
        [tileButton setBackgroundColor:[UIColor grayColor]];
    }
    //    [self updateUI];
}


# pragma mark Tile Pressed

- (IBAction)tilePressed:(UIButton *)sender
{
    NSUInteger tileIndex = [self.tileButtons indexOfObject:sender];
    
    if ([self.game chooseTileAtIndex:tileIndex] == YES){
        [self disableBoard:sender];
    }
    if ([self.game surroundingMines:tileIndex] == 0){
        [self disableMines:sender];
    }
    
    [sender setTitle:[NSString stringWithFormat:@"%d", [self.game surroundingMines:tileIndex]] forState:UIControlStateNormal];
    
    [sender setBackgroundColor:[UIColor grayColor]];
//    [self updateUI];

}


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

- (void)disableBoard:(UIButton *)tile{
    
    for (UIButton *tileButton in self.tileButtons){
        
        if (tileButton.enabled == NO){
            [tileButton setBackgroundColor:[UIColor redColor]];
        } else {
            tileButton.enabled = NO;
        }
        NSLog(@"tile button: %@", tileButton);
        
        NSInteger tileIndex = [self.tileButtons indexOfObject:tileButton];
        Tile *tile = [self.game tileAtIndex:tileIndex];
        [tileButton setTitle:[NSString stringWithFormat:@"%@", tile] forState:UIControlStateNormal];
    }
}


- (void)updateUI
{
    for (UIButton *tileButton in self.tileButtons){
        NSInteger tileIndex = [self.tileButtons indexOfObject:tileButton];
        Tile *tile = [self.game tileAtIndex:tileIndex];
        if (tile.isChosen){
            [tileButton setBackgroundColor:[self backgroundColorForTile:tile]];
//        tileButton.enabled = !tile.isMatched;
        }
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
