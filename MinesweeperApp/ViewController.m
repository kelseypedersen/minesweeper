//
//  ViewController.m
//  MinesweeperApp
//
//  Created by Kelsey Pedersen on 8/17/15.
//  Copyright (c) 2015 Kelsey Pedersen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// ** Need to connect to the rest of the buttons!

@property (weak, nonatomic) IBOutlet UIButton *tileButton;

- (IBAction)tilePressed:(UIButton *)sender;

@end

@implementation ViewController

- (IBAction)tilePressed:(UIButton *)sender{
    self.tileButton.backgroundColor = [UIColor yellowColor];
    [self.tileButton setTitle:@"hi" forState:UIControlStateNormal];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
