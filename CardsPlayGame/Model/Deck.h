//
//  Deck.h
//  CardsPlayGame
//
//  Created by 邵 建勇 on 14-8-12.
//  Copyright (c) 2014年 John Shaw. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard : (Card *)card atTop:(BOOL)atTop;
- (void)addCard : (Card *)card;

- (Card *)drawRandomCard;

@end
