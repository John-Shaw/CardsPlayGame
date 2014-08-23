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
                    usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;

- (void)setModeWithCardMatchNumber:(NSUInteger)number;

- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic,readonly) NSInteger score;
@property (nonatomic,strong) NSString *matchDetail;



@end
