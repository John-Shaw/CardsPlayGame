//
//  SetCard.h
//  CardsPlayGame
//
//  Created by 邵 建勇 on 14-9-6.
//  Copyright (c) 2014年 John Shaw. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property (nonatomic) NSUInteger number;
@property (nonatomic,strong) NSString *symbol;
@property (nonatomic,strong) UIColor *color;
@property (nonatomic,strong) NSString *shading;

+ (NSArray *)validSymbol;
+ (NSArray *)validColor;
+ (NSArray *)validShading;
+ (NSArray *)validNumber;

@end
