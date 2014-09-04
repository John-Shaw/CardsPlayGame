//
//  ViewController.h
//  CardsPlayGame
//
//  Created by 邵 建勇 on 14-8-11.
//  Copyright (c) 2014年 John Shaw. All rights reserved.
//


// Abstract class. Must implement methods as described below.

#import <UIKit/UIKit.h>
#import "CardMatchingGame.h"

@interface ViewController : UIViewController

- (Deck *)createDeck;  //abstract

@end
