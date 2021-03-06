//
//  CardMatchingGame.h
//  CardsPlayGame
//
//  Created by 邵 建勇 on 14-8-12.
//  Copyright (c) 2014年 John Shaw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

#pragma mark designated initializer
- (instancetype)initWithCount:(NSUInteger)count
                    usingDeck:(Deck *)deck
                   cardNumber:(NSUInteger)matchNumberOfOtherCards;

- (void)chooseCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic,readwrite) NSUInteger score;

@property (nonatomic,strong) NSString *matchDetail;

@property (nonatomic,strong) NSMutableArray *cards;

@property (nonatomic,readwrite) NSUInteger matchNumberOfOtherCards;


@end
