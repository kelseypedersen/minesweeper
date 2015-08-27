//
//  ViewController.h
//  MinesweeperApp
//
//  Created by Kelsey Pedersen on 8/17/15.
//  Copyright (c) 2015 Kelsey Pedersen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Board.h"


// Add protocol for alert view in viewcontroller.m file
@interface ViewController : UIViewController <UIAlertViewDelegate>

// for subclasses
- (Board *)createBoard; //abstract

@end

