//
//  CardGameViewController.h
//  CardsPlayGame
//
//  Created by 邵 建勇 on 14-8-11.
//  Copyright (c) 2014年 John Shaw. All rights reserved.
//


// Abstract class. Must implement methods as described below.

#import <UIKit/UIKit.h>
#import "Game.h"


@interface GameViewController : UIViewController

- (Deck *)createDeck;  //abstract
- (void)updateUI;
- (void)setup;


@property (nonatomic,strong) Game *game;

@property (strong, nonatomic) NSMutableArray *cardViews;
@property (nonatomic) CGSize maxCardSize;
@property (nonatomic) NSUInteger numberOfCards;

@property (weak, nonatomic) IBOutlet UILabel *ScoreLabel;
- (IBAction)touchStartButton:(id)sender;

@end
