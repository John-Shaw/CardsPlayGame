//
//  CardGameViewController.m
//  CardsPlayGame
//
//  Created by 邵 建勇 on 14-8-11.
//  Copyright (c) 2014年 John Shaw. All rights reserved.
//

#import "GameViewController.h"


@interface GameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *ScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *DetailLabel;


@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@end

@implementation GameViewController



- (CardMatchingGame *)game{
    if (!_game) {
        _game = [self createGame];
    }
    return _game;
}

- (CardMatchingGame *)createGame{
    return nil;
}


- (Deck *)createDeck{   //abstract
    return nil;
}


- (IBAction)touchStartButton:(id)sender {
    
    self.game = nil;
    [self updateUI];
    
}


- (IBAction)touchCardButton:(UIButton *)sender {
    
    unsigned long cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

- (void)updateUI{
    
    for (UIButton *button in self.cardButtons) {
        unsigned long cardIndex = [self.cardButtons indexOfObject:button];
        Card *card = [self.game cardAtIndex:cardIndex];
        
        [button setTitle:[self titleForCard:card]
                forState:UIControlStateNormal];
        [button setBackgroundImage:[self backgroundImageForCard:card]
                          forState:UIControlStateNormal];
        
        button.enabled = !card.isMatched;
        
        [self.DetailLabel setText:self.game.matchDetail];
        [self.ScoreLabel setText:[NSString stringWithFormat:@"Score: %ld", (long)self.game.score]];
        
    }
}

- (NSString *)titleForCard: (Card *) card{

    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard: (Card *) card{
    return [UIImage imageNamed: card.isChosen ? @"CardFront" : @"CardBack"];
}

@end
