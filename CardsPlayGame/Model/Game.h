//
//  Game.h
//  CardsPlayGame
//
//  Created by 邵建勇 on 14/11/6.
//  Copyright (c) 2014年 John Shaw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface Game : NSObject

#pragma mark designated initializer
- (instancetype)initWithCount:(NSUInteger)count
                    usingDeck:(Deck *)deck
                   matchNum:(NSUInteger)matchNumberOfOtherCards;
- (void)chooseCardAtIndex:(NSUInteger)index;

//safe, but don't necesseray
//- (Card *)cardAtIndex:(NSUInteger)index;

#pragma mark - properties
@property (nonatomic,readwrite) NSUInteger score;

@property (nonatomic,strong) NSMutableArray *cards;
@property (nonatomic) NSInteger numberOfDealtCards;
//TODO 这里可能不需要matchnumber了，直接固定类型
@property (nonatomic,readwrite) NSUInteger matchNumberOfOtherCards;


#pragma mark - enum
typedef NS_ENUM(NSInteger, GameType) {
    GameTypeMatchisom,
    GameTypeSet
};

@end
