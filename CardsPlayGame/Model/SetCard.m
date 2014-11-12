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
     return @[@"oval", @"squiggle", @"diamond"];
}

+ (NSArray *)validColor{
    return @[@"red", @"green", @"purple"];
}

+ (NSArray *)validShading{
    return @[@"open",@"striped",@"solid"];
}

+ (NSUInteger)maxNumber{
    return 3;
}

//content 应该改为修改相应的信息，如3个红色空心方块等等，但是想想也没必要，因为可以从另外四个property中获取，而绘图交给setcardview
//-(NSString *)contents{
//    NSString *content = [[NSString alloc] init];
//    for (int i = 0; i < self.number; i++) {
//        content = [content stringByAppendingString:self.symbol];
//    }
//    return content;
//}

@synthesize chosen = _chosen;
- (void)setChosen:(BOOL)chosen{
    
    _chosen = chosen;
    if(self.view.chosen != chosen && self.view.chosen == YES){
        [self.view performSelector:@selector(setChosen:) withObject:@0 afterDelay:0.5f];
    }
    else{
        self.view.chosen = chosen;
    }
}

- (SetCardView *)view{
    if (!_view) {
        _view = [SetCardView new];
    }
    return _view;
}

static const int numberOfMatchingCards = 3;

- (NSUInteger)match:(NSArray *)otherCards{
    int score = 0;
    
    if([otherCards count] == 2)
    {
        NSMutableArray *colors = [[NSMutableArray alloc] init];
        NSMutableArray *symbols = [[NSMutableArray alloc] init];
        NSMutableArray *shadings = [[NSMutableArray alloc] init];
        NSMutableArray *numbers = [[NSMutableArray alloc] init];
        [colors addObject:self.color];
        [symbols addObject:self.symbol];
        [shadings addObject:self.shading];
        [numbers addObject:@(self.number)];
        
        for (id otherCard in otherCards) {
            if ([otherCard isKindOfClass:[SetCard class]]) {
                
                SetCard *otherSetCard = (SetCard *)otherCard;
                if (![colors containsObject:otherSetCard.color])
                    [colors addObject:otherSetCard.color];
                if (![symbols containsObject:otherSetCard.symbol])
                    [symbols addObject:otherSetCard.symbol];
                if (![shadings containsObject:otherSetCard.shading])
                    [shadings addObject:otherSetCard.shading];
                if (![numbers containsObject:@(otherSetCard.number)])
                    [numbers addObject:@(otherSetCard.number)];
                if (([colors count] == 1 || [colors count] == numberOfMatchingCards)
                    && ([symbols count] == 1 || [symbols count] == numberOfMatchingCards)
                    && ([shadings count] == 1 || [shadings count] == numberOfMatchingCards)
                    && ([numbers count] == 1 || [numbers count] == numberOfMatchingCards)) {
                    score = 4;
                }
            }
            
        }
    }
    
    return score;
}


@end
