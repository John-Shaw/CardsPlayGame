//
//  SetCard.h
//  CardsPlayGame
//
//  Created by 邵 建勇 on 14-9-6.
//  Copyright (c) 2014年 John Shaw. All rights reserved.
//

#import "Card.h"
#import "SetCardView.h"

@interface SetCard : Card

@property (nonatomic) NSUInteger number;
@property (nonatomic,strong) NSString *symbol;
@property (nonatomic,strong) NSString *color;
@property (nonatomic,strong) NSString *shading;

@property (nonatomic,strong) SetCardView *view;

+ (NSArray *)validSymbol;
+ (NSArray *)validColor;
+ (NSArray *)validShading;
+ (NSUInteger)maxNumber;

@end
