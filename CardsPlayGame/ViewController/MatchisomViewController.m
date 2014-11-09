//
//  MatchisomViewController.m
//  CardsPlayGame
//
//  Created by 邵 建勇 on 14-8-23.
//  Copyright (c) 2014年 John Shaw. All rights reserved.
//

#import "MatchisomViewController.h"
#import "MatchisomDeck.h"
#import "PlayingCardView.h"


@interface MatchisomViewController ()

@end

@implementation MatchisomViewController


#pragma mark - initailizetion - setters and getters

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //测试下card view
    //    for(int i=1;i<4;i++){
    //    MatchisomDeck *deck = [[MatchisomDeck alloc] init];
    //    MatchisomCard *card = (MatchisomCard *)[deck drawRandomCard];
    //
    //    PlayingCardView *cardTest = card.view;
    //
    //    cardTest.frame = CGRectMake(70*(i-1) + 20, 50, 60, 90);
    //    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:cardTest action:@selector(flipCard:)];
    //    [swipe setDirection:UISwipeGestureRecognizerDirectionRight];
    //
    //    [cardTest addGestureRecognizer:swipe];
    //
    //    [self.view addSubview:cardTest];
    //    }
    
}

- (Deck *)createDeck{
    return [[MatchisomDeck alloc] init];
}

@synthesize cardViews = _cardViews;
- (NSMutableArray *)cardViews
{
    if (!_cardViews) {
        _cardViews = [NSMutableArray arrayWithCapacity:self.numberOfCards];
        for (MatchisomCard *card in self.game.cards) {
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                  action:@selector(flipCard:)];
            [card.view addGestureRecognizer:tap];
            
            [_cardViews addObject:card.view];
        }
    }
    return _cardViews;
}



#pragma mark - gesture callbacks and animations
- (void)flipCard:(UITapGestureRecognizer *)gesture{
    
    PlayingCardView *cardView = (PlayingCardView *)gesture.view;
    [cardView flipCardAnimation];
    
    [self.game chooseCardAtIndex:[self.cardViews indexOfObject:cardView]];
    [self updateUI];
}




- (void)updateUI{
    [super updateUI];
    for (MatchisomCard *card in self.game.cards) {
        if (card.matched) {
            [card.view removeGestureRecognizer:card.view.gestureRecognizers.firstObject];
            [UIView animateWithDuration:0.5
                                  delay:0.5
                                options:UIViewAnimationOptionBeginFromCurrentState
                             animations:^{
                                 card.view.alpha = 0.5;
                             }completion:NULL];
            
            
        }
//        if (card) {
//
//        }
    }
}


@end
