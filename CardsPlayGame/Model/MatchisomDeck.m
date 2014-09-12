//
//  IntanceDeck.m
//  CardsPlayGame
//
//  Created by 邵 建勇 on 14-8-12.
//  Copyright (c) 2014年 John Shaw. All rights reserved.
//

#import "MatchisomDeck.h"
#import "MatchisomCard.h"

@implementation MatchisomDeck

- (instancetype)init{
    
    self = [super init];
    if(!self)
        return nil;
    
    for (NSString *suit in [MatchisomCard validSuits]) {
        for(NSUInteger rank = 1; rank <=[MatchisomCard maxRank];rank++){
            MatchisomCard *card = [[MatchisomCard alloc] init];
            card.rank = rank;
            card.suit = suit;
            [self addCard:card];
        }
    }
    
    return self;
}

@end
