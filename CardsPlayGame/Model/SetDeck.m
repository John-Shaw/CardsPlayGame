//
//  SetDeck.m
//  CardsPlayGame
//
//  Created by 邵 建勇 on 14-9-6.
//  Copyright (c) 2014年 John Shaw. All rights reserved.
//

#import "SetDeck.h"

@implementation SetDeck

- (instancetype)init{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    for (NSString *symbol in [SetCard validSymbol]) {
        for (NSString *shading in [SetCard validShading]) {
            for (NSString *color in [SetCard validColor]) {
                for (NSUInteger i = 1; i <= [SetCard maxNumber]; i++) {
                    SetCard *card = [[SetCard alloc] init];
                    
                    //同时初始化card和cardview的属性，我在matchisom中是通过setter方法来同步
                    //相比之下，这种方法代码少点，但是缺点是只能初始化一次，后面card修改属性无法同步，但是这个app不需要同步card和cardview的属性
                    card.symbol = symbol;
                    card.view.symbol = symbol;
                    card.shading = shading;
                    card.view.shading = shading;
                    card.color = color;
                    card.view.color = color;
                    card.number = i;
                    card.view.number = i;
                    [self addCard:card];
                }
            }
        }
    }
    
    
    return self;
}

@end
