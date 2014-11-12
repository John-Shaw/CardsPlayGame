//
//  SetGame.m
//  CardsPlayGame
//
//  Created by 邵 建勇 on 14-9-12.
//  Copyright (c) 2014年 John Shaw. All rights reserved.
//

#import "SetGame.h"

@interface SetGame ()

@end

@implementation SetGame



//- (void)chooseCardAtIndex:(NSUInteger)index{
//    
//    Card *card = self.cards[index];
//    if (!card.isMatched) {
//        if (card.isChosen) {
//            card.chosen = NO;
//        }else{
//            
//            NSMutableArray *otherCards = [[NSMutableArray alloc] init];
//            for (Card *otherCard in self.cards) {
//                if (otherCard.isChosen && !otherCard.isMatched) {
//                    
//                    [otherCards addObject:otherCard];
//                }
//            }
//
//            card.chosen = YES;
//            if ([otherCards count] == self.matchNumberOfOtherCards) {
//                unsigned long matchScore = [card match:otherCards];
//                if (matchScore) {
//                    self.score += matchScore * 10;
//                    card.matched = YES;
//                    for (Card *otherCard in otherCards) {
//                        otherCard.matched = YES;
//                    }
//
//                }else{
//                    self.score -= 1;
//                    
//                    for (Card *otherCard in otherCards) {
//                        otherCard.chosen = NO;
//                    }
//                    card.chosen = NO;
//                }
//            }
//            
//            self.score -= 1;
//            
//        }
//    }
//
//}


@end
