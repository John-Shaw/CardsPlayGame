//
//  SetDeck.m
//  CardsPlayGame
//
//  Created by 邵 建勇 on 14-9-6.
//  Copyright (c) 2014年 John Shaw. All rights reserved.
//

#import "SetDeck.h"
#import "SetCard.h"

@implementation SetDeck

- (instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    for (NSString *symbol in [SetCard validSymbol]) {
        for (NSString *shading in [SetCard validShading]) {
            for (UIColor *color in [SetCard validColor]) {
                for (NSUInteger i = 1;i <= [[SetCard validNumber] count];i++) {
                    SetCard *card = [[SetCard alloc] init];
                    card.symbol = symbol;
                    card.shading = shading;
                    card.color = color;
                    card.number = i;
                    [self addCard:card];
                }
            }
        }
    }
    
    
    return self;
}

@end
