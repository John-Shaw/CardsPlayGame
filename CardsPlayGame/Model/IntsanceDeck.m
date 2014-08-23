//
//  IntanceDeck.m
//  CardsPlayGame
//
//  Created by 邵 建勇 on 14-8-12.
//  Copyright (c) 2014年 John Shaw. All rights reserved.
//

#import "InstanceDeck.h"
#import "InstanceCard.h"

@implementation InstanceDeck

- (instancetype)init{
    
    self = [super init];
    if(!self)
        return nil;
    
    for (NSString *suit in [InstanceCard validSuits]) {
        for(NSUInteger rank = 1; rank <=[InstanceCard maxRank];rank++){
            InstanceCard *card = [[InstanceCard alloc] init];
            card.rank = rank;
            card.suit = suit;
            [self addCard:card];
        }
    }
    
    return self;
}

@end
