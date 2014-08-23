//
//  ViewController.m
//  CardsPlayGame
//
//  Created by 邵 建勇 on 14-8-11.
//  Copyright (c) 2014年 John Shaw. All rights reserved.
//

#import "ViewController.h"
#import "Model/InstanceDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *ScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *DetailLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *MatchSegment;


//@property (nonatomic,strong) Deck *deck;
@property (nonatomic,strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@end

@implementation ViewController

//attributedstring 尝试 结果没效果
//    NSMutableAttributedString *labelText = [self.ScoreLabel.attributedText mutableCopy];
//
//    [labelText setValue:[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline] forKey:NSFontAttributeName];
//    [labelText setValue:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
//    [labelText setValue:[UIColor blackColor] forKey:NSStrokeColorAttributeName];
//    [labelText setValue:@-5 forKey:NSStrokeWidthAttributeName];
//
//    self.ScoreLabel.attributedText = labelText;


- (CardMatchingGame *)game{
    if (!_game) {
        
        _game = [[CardMatchingGame alloc] initWithCount:[self.cardButtons count]
                                              usingDeck: [self createDeck]];
        [self.game setModeWithCardMatchNumber:self.MatchSegment.selectedSegmentIndex + 1];
    }
    return _game;
}

//- (Deck *)deck{
//    if (!_deck) {
//        _deck = [self createDeck];
//    }
//    return _deck;
//}

- (Deck *)createDeck{
    return [[InstanceDeck alloc] init];
}


- (IBAction)touchStartButton:(id)sender {

//    for (UIButton *button in self.cardButtons) {
//        button.enabled = !button.enabled;
//    }
    
    self.game = nil;
    [self updateUI];
    
    self.MatchSegment.enabled = NO;
    //self.MatchSegment.enabled = !self.MatchSegment.enabled;
}


- (IBAction)touchCardButton:(UIButton *)sender {
    //junk, at least it used to be;
//    if ([[sender currentTitle] length]) {
//        [sender setBackgroundImage:
//        [UIImage imageNamed:@"CardBack"]
//                          forState:UIControlStateNormal];
//        [sender setTitle:@""
//                forState:UIControlStateNormal];
//        self.flipCount++;
//    }
//    else{
//        Card *card = [self.deck drawRandomCard];
//        if (card) {
//            [sender setBackgroundImage:
//             [UIImage imageNamed:@"CardFront"]
//                              forState:UIControlStateNormal];
//            [sender setTitle:card.contents
//                    forState:UIControlStateNormal];
//            self.flipCount++;
//        }
//    }
    
    
    //lecture 3 ques 已注解
//    Card *cardA,*cardB,*cardC;
//    cardA = [[Card alloc] init];
//    cardB = [[Card alloc] init];
//    cardC = [[Card alloc] init];
//    cardA.contents = @"A";
//    cardB.contents = @"0";
//    cardC.contents = @"B";
//    cardA.contents = @[cardB.contents,cardC.contents][[cardB match:@[cardC]] ? 1 : 1];
//    NSLog(@"%@", cardA.contents);
    
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
