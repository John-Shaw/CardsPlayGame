//
//  CardMatchingGame.m
//  CardsPlayGame
//
//  Created by 邵 建勇 on 14-8-12.
//  Copyright (c) 2014年 John Shaw. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame ()

@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic,strong) NSMutableArray *cards;
@property (nonatomic,readwrite) NSUInteger matchNumber;


@end

@implementation CardMatchingGame

- (NSString *)matchDetail{
    if (!_matchDetail) _matchDetail = [[NSString alloc] init];
    return _matchDetail;
}

- (NSMutableArray *)cards{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (NSUInteger)matchNumber{
    if (!_matchNumber) {
        _matchNumber = 1;
    }
    return _matchNumber;
}

- (instancetype)initWithCount:(NSUInteger)count usingDeck:(Deck *)deck{
    self = [super init];
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            }
            else{

                self = nil;
                break;
            }
        }
    }
    
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}


- (void)setModeWithCardMatchNumber:(NSUInteger)number{
    self.matchNumber = number;
}

#define MISMATCH_PENALTY 2
#define MATCH_BONUS 4
#define COST_TO_CHOOSE 1


- (void)chooseCardAtIndex:(NSUInteger)index{
    Card *card = [self cardAtIndex:index];
    NSMutableArray *otherCards = [[NSMutableArray alloc] init];
    
    self.matchDetail = @"";
    if (!card.isMatched) {
        if (card.isChosen) {
            self.matchDetail = @"";
            card.chosen = NO;
        }else{
            
            self.matchDetail = [self.matchDetail stringByAppendingFormat:@"%@ ",card.contents];
            
            int i = 0;
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    
                    [otherCards addObject:otherCard];
                    self.matchDetail = [self.matchDetail stringByAppendingFormat:@"%@ ",otherCard.contents];
                    
                    i++;
                    if (i >= self.matchNumber) {
                        break;
                    }
                }
            }
            if ([otherCards count] == self.matchNumber) {
                unsigned long matchScore = [card match:otherCards];
                if (matchScore) {
                    self.score +=matchScore * MATCH_BONUS;
                    card.matched = YES;
                    for (Card *otherCard in otherCards) {
                        otherCard.matched = YES;
                    }
                    
                    self.matchDetail = [self.matchDetail stringByAppendingFormat:@"for %lu points",matchScore * MATCH_BONUS];
                }else{
                    self.score -= MISMATCH_PENALTY;
                    
                    for (Card *otherCard in otherCards) {
                        otherCard.chosen = NO;
                    }
                    
                    self.matchDetail = [self.matchDetail stringByAppendingFormat:@"don’t match! %d points penalty!",MISMATCH_PENALTY];
                }
            }
            

            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

@end