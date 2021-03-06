//
//  IntanceCard.m
//  CardsPlayGame
//
//  Created by 邵 建勇 on 14-8-12.
//  Copyright (c) 2014年 John Shaw. All rights reserved.
//


#import "MatchisomCard.h"

@interface MatchisomCard ()

@end


@implementation MatchisomCard

@synthesize suit=_suit;


#define RANK_MATCH_SCORE 4
#define SUIT_MATCH_SCORE 1

-(NSUInteger)match:(NSArray *)otherCards{
    int score = 0;
    if ([otherCards count] == 1) {
        id card = [otherCards firstObject];
        if([card isKindOfClass:[MatchisomCard class]]){
            MatchisomCard *otherCard = (MatchisomCard *)card;
            if (otherCard.rank == self.rank) {
                score = RANK_MATCH_SCORE;
            }else if([otherCard.suit isEqualToString:self.suit]){
                score = SUIT_MATCH_SCORE;
            }
        }
    } else {
        for (id card in otherCards) {
            if ([card isKindOfClass:[MatchisomCard class]]) {
                MatchisomCard *otherCard = (MatchisomCard *)card;
                if (otherCard.rank == self.rank) {
                    score += RANK_MATCH_SCORE;
                } else if ([otherCard.suit isEqualToString:self.suit]){
                    score += SUIT_MATCH_SCORE;
                }
            }
        }

    }
    return score;
}

-(NSString *)contents{
    
    NSArray *rankStrings = [MatchisomCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
    
}

+ (NSArray *)validSuits{
    return @[@"♥️",@"♦️",@"♣️",@"♠️"];
}

+ (NSArray *)rankStrings{
    return @[@"?",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank{
    return [[self rankStrings] count] -1;
}

- (void)setRank:(NSUInteger)rank{
    if (rank <= [MatchisomCard maxRank]) {
        _rank = rank;
    }
}

- (void)setSuit:(NSString *)suit{
    

    if ( [[MatchisomCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit{
    return _suit ? _suit : @"?";
}



@end
