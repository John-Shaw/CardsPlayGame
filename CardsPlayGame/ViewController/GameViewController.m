//
//  CardGameViewController.m
//  CardsPlayGame
//
//  Created by 邵 建勇 on 14-8-11.
//  Copyright (c) 2014年 John Shaw. All rights reserved.
//

#import "GameViewController.h"
#import "Grid.h"

@interface GameViewController ()


@property (strong, nonatomic) UIDynamicAnimator *pileAnimator;
@property (strong, nonatomic) Grid *grid;

@property (weak, nonatomic) IBOutlet UIView *gridView;


@end

@implementation GameViewController




- (Grid *)grid{
    if (!_grid) {
        _grid = [[Grid alloc] init];
        _grid.cellAspectRatio = self.maxCardSize.width / self.maxCardSize.height;
        _grid.minimumNumberOfCells = self.numberOfCards;
        _grid.maxCellWidth = self.maxCardSize.width;
        _grid.maxCellHeight = self.maxCardSize.height;
        _grid.size = self.gridView.frame.size;
    }
    return _grid;
}


- (Game *)game{
    if (!_game) {
        _game = [[Game alloc] initWithCount:self.numberOfCards usingDeck:[self createDeck] matchNum:1];
    }
    return _game;
}


- (Deck *)createDeck{   //abstract
    return nil;
}


- (IBAction)touchStartButton:(id)sender {
    self.game = nil;
    if (self.gridView.subviews.firstObject) {
        [self shuffleCards];
    }
    
    self.cardViews = nil;
    self.grid = nil;
    
    [self dealCards];
    [self updateUI];
}

- (void)shuffleCards{
    for (UIView *subView in self.cardViews) {
        [UIView animateWithDuration:0.5
                         animations:^{
                             subView.frame = CGRectMake(0.0,
                                                        self.gridView.bounds.size.height,
                                                        self.grid.cellSize.width,
                                                        self.grid.cellSize.height);
                         } completion:^(BOOL finished) {
                             [subView removeFromSuperview];
                         }];
    }

}

#define CARDSPACINGINPERCENT 0.08
- (void)dealCards{
    NSUInteger viewIndex = 0;
    NSUInteger changedViews = 0;
    
    for (UIView *cardView in self.cardViews) {
        
        //起始Frame
        cardView.frame = CGRectMake(self.gridView.bounds.size.width,
                                    self.gridView.bounds.size.height,
                                    self.grid.cellSize.width,
                                    self.grid.cellSize.height);
        
        //获取view的Index
        viewIndex = [self.cardViews indexOfObject:cardView];
        [self.gridView addSubview:cardView];
        
        //
        CGRect frame = [self.grid frameOfCellAtRow:viewIndex / self.grid.columnCount
                                          inColumn:viewIndex % self.grid.columnCount];
        frame = CGRectInset(frame, frame.size.width * CARDSPACINGINPERCENT, frame.size.height * CARDSPACINGINPERCENT);
        UIView *cardView = (UIView *)self.cardViews[viewIndex];
        
        [UIView animateWithDuration:0.5
                      delay:1.5 * changedViews++ / [self.cardViews count]
                    options:UIViewAnimationOptionCurveEaseInOut
                 animations:^{
                     cardView.frame = frame;
                 }
                 completion:NULL];
        
    }
}

- (void)updateUI{
    
//    self.grid.minimumNumberOfCells = [self.cardViews count];
     self.ScoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)(self.game.score)];
}

- (void)setup{
    //do the initializetion
    self.numberOfCards = 24;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.maxCardSize = CGSizeMake(160.0, 240.0);
    } else {
        self.maxCardSize = CGSizeMake(80.0, 120.0);
    }
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self setup];
    //[self dealCards];
}

//- (IBAction)touchCardButton:(UIButton *)sender {
//    
//    unsigned long cardIndex = [self.cardButtons indexOfObject:sender];
//    [self.game chooseCardAtIndex:cardIndex];
//    [self updateUI];
//}
//
//- (void)updateUI{
//    
//    for (UIButton *button in self.cardButtons) {
//        unsigned long cardIndex = [self.cardButtons indexOfObject:button];
//        Card *card = [self.game cardAtIndex:cardIndex];
//        
//        [button setTitle:[self titleForCard:card]
//                forState:UIControlStateNormal];
//        [button setBackgroundImage:[self backgroundImageForCard:card]
//                          forState:UIControlStateNormal];
//        
//        button.enabled = !card.isMatched;
//        
//        [self.DetailLabel setText:self.game.matchDetail];
//        [self.ScoreLabel setText:[NSString stringWithFormat:@"Score: %ld", (long)self.game.score]];
//        
//    }
//}

//- (NSString *)titleForCard: (Card *) card{
//
//    return card.isChosen ? card.contents : @"";
//}
//
//- (UIImage *)backgroundImageForCard: (Card *) card{
//    return [UIImage imageNamed: card.isChosen ? @"CardFront" : @"CardBack"];
//}

@end
