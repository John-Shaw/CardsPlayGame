//
//  IntanceCard.h
//  CardsPlayGame
//
//  Created by 邵 建勇 on 14-8-12.
//  Copyright (c) 2014年 John Shaw. All rights reserved.
//

#import "Card.h"
#import "PlayingCardView.h"

@interface MatchisomCard : Card

@property (strong,nonatomic) NSString *suit;
@property (nonatomic)NSUInteger rank;
@property (strong, nonatomic) PlayingCardView *view;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
