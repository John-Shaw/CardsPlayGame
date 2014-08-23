//
//  Card.h
//  CardsPlayGame
//
//  Created by 邵 建勇 on 14-8-11.
//  Copyright (c) 2014年 John Shaw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter=isChosen) BOOL chosen;

@property (nonatomic, getter=isMatched) BOOL matched;

- (NSUInteger)match:(NSArray *)otherCards;

@end
