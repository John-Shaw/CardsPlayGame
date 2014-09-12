//
//  SetCard.m
//  CardsPlayGame
//
//  Created by 邵 建勇 on 14-9-6.
//  Copyright (c) 2014年 John Shaw. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

+ (NSArray *)validSymbol{
    return @[@"♦︎",@"■",@"●"];
}

+ (NSArray *)validColor{
    return @[[UIColor redColor],[UIColor greenColor],[UIColor purpleColor]];
}

+ (NSArray *)validShading{
    return @[@"open",@"striped",@"solid"];
}

+ (NSArray *)validNumber{
    return @[@1,@2,@3];
}

-(NSString *)contents{
    NSString *content = [[NSString alloc] init];
    for (int i = 0; i < self.number; i++) {
        content = [content stringByAppendingString:self.symbol];
    }
    return content;
}


@end
