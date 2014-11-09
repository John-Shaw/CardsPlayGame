//
//  Game.m
//  CardsPlayGame
//
//  Created by 邵建勇 on 14/11/6.
//  Copyright (c) 2014年 John Shaw. All rights reserved.
//

#import "Game.h"

@interface Game ()


@end

@implementation Game

- (NSInteger)numberOfDealtCards{
    return [self.cards count];
}

- (NSString *)matchDetail{
    if (!_matchDetail) _matchDetail = [[NSString alloc] init];
    return _matchDetail;
}

- (NSMutableArray *)cards{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (NSUInteger)matchNumberOfOtherCards{
    if (!_matchNumberOfOtherCards) {
        _matchNumberOfOtherCards = 1;
    }
    return _matchNumberOfOtherCards;
}

- (instancetype)initWithCount:(NSUInteger)count usingDeck:(Deck *)deck matchNum:(NSUInteger)matchNumberOfOtherCards{
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
    self.matchNumberOfOtherCards = matchNumberOfOtherCards;
    return self;
}

//safe, but not necesseray,becouse i add cardview as property in card, so i can get card in index of [cardviews index] or
//- (Card *)cardAtIndex:(NSUInteger)index{
//    return (index < [self.cards count]) ? self.cards[index] : nil;
//}


#pragma mark - logic
//宏很不好，不够优雅，换成static variable 感觉更好
#define MISMATCH_PENALTY 2
#define MATCH_BONUS 4
#define COST_TO_CHOOSE 1

//这段逻辑代码写的不够优雅
//我来改写
- (void)chooseCardAtIndex:(NSUInteger)index{
    
    
    //惰性实例化
    Card *card = self.cards[index];
    if (!card.isMatched) {

        if (card.isChosen) {
//            self.matchDetail = [@"lay down " stringByAppendingString:card.contents];
            card.chosen = NO;
            
        }else{
//            self.matchDetail = [@"pick up " stringByAppendingString:card.contents]
            
            //#1
            //search other cards, beacouse now self card not chosen
            NSMutableArray *otherCards = [[NSMutableArray alloc] init];
            for (Card *otherCard in self.cards) {
                
                if (otherCard.isChosen && !otherCard.isMatched) {
                    [otherCards addObject:otherCard];
                    
//                    self.matchDetail = [self.matchDetail stringByAppendingFormat:@"%@ ",otherCard.contents];
                }
            }
            card.chosen = YES;
            
            
            //#2 match cards
            if ([otherCards count] == self.matchNumberOfOtherCards) {
                
                unsigned long matchScore = [card match:otherCards];
                //match succeed
                if (matchScore) {
                    self.score +=matchScore * MATCH_BONUS;
                    card.matched = YES;
                    for (Card *otherCard in otherCards) {
                        otherCard.matched = YES;
                    }
                    
//                    self.matchDetail = [self.matchDetail stringByAppendingFormat:@"for %lu points",matchScore * MATCH_BONUS];
                }else{
                    
                    self.score -= MISMATCH_PENALTY;
                    
                    for (Card *otherCard in otherCards) {
                        otherCard.chosen = NO;
                    }
                    //此处修改，即如果匹配不成功，chosen设为false，牌（如果能）会翻过去
                    card.chosen = NO;
//                    self.matchDetail = [self.matchDetail stringByAppendingFormat:@"don’t match! %d points penalty!",MISMATCH_PENALTY];
                }
            }
            
            self.score -= COST_TO_CHOOSE;
            
        }
    }
}

@end
