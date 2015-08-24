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

// ** Need to connect to the rest of the buttons!

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *tileButton;


- (IBAction)tilePressed:(UIButton *)sender;


@end

@implementation ViewController



- (IBAction)tilePressed:(UIButton *)sender{
    NSInteger *tileIndex = [self.tileButton indexOfObject:sender];
    
    // Need to update game
    // Need to create chooseTileAtIndex
    [self.game chooseTileAtIndex:tileIndex];
    
    // Need to create update UI method
    [self updateUI];
    
  
}

-

- (void)updateUI{
    
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
