//
//  SetViewController.m
//  CardsPlayGame
//
//  Created by 邵 建勇 on 14-9-5.
//  Copyright (c) 2014年 John Shaw. All rights reserved.
//

#import "SetViewController.h"
#import "SetDeck.h"

//for fast test
//@class SetCard;
//#import "DrawSetCard(Attribute).h"
#import "SetGame.h"

@interface SetViewController ()

@property (weak, nonatomic) IBOutlet UILabel *MatchInfo;


@end

@implementation SetViewController


- (Deck *)createDeck{
    return [[SetDeck alloc] init];
}

@synthesize game = _game;
- (Game *)game{
    if (!_game) {
        _game = [[SetGame alloc] initWithCount:self.numberOfCards usingDeck:[self createDeck] matchNum:2];
    }
    return _game;

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

@synthesize cardViews = _cardViews;
- (NSMutableArray *)cardViews
{
    if (!_cardViews) {
        _cardViews = [NSMutableArray arrayWithCapacity:self.numberOfCards];
        for (SetCard *card in self.game.cards) {
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                  action:@selector(selectSetCard:)];
            
            [card.view addGestureRecognizer:tap];
            
            [_cardViews addObject:card.view];
        }
    }
    return _cardViews;
}


- (void)viewDidLoad{
    [super viewDidLoad];

}

- (void)setup{
    self.numberOfCards = 12;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.maxCardSize = CGSizeMake(240.0, 240.0);
    } else {
        self.maxCardSize = CGSizeMake(120.0, 120.0);
    }
}


- (void)selectSetCard:(UITapGestureRecognizer *)gesture{
    NSUInteger index = [self.cardViews indexOfObject:gesture.view];
    [self.game chooseCardAtIndex:index];
    [self updateUI];
}

- (void)updateUI{
    [super updateUI];
 
}



@end
