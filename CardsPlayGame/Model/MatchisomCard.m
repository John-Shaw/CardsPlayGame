//
//  IntanceCard.m
//  CardsPlayGame
//
//  Created by 邵 建勇 on 14-8-12.
//  Copyright (c) 2014年 John Shaw. All rights reserved.
//


#import "MatchisomCard.h"

@interface MatchisomCard ()

@end


@implementation MatchisomCard

@synthesize suit = _suit;
@synthesize chosen = _chosen;

#define RANK_MATCH_SCORE 4
#define SUIT_MATCH_SCORE 1

/** 卡牌匹配算法
 * @param otherCards 其他卡牌的集合
 */
-(NSUInteger)match:(NSArray *)otherCards{
    int score = 0;
    if ([otherCards count] == 1) {
        id card = [otherCards firstObject];
        if([card isKindOfClass:[MatchisomCard class]]){
            MatchisomCard *otherCard = (MatchisomCard *)card;
            if (otherCard.rank == self.rank) {
                score = RANK_MATCH_SCORE;
            }else if([otherCard.suit isEqualToString:self.suit]){
                score = SUIT_MATCH_SCORE;
            }
        }
    } else {
        for (id card in otherCards) {
            if ([card isKindOfClass:[MatchisomCard class]]) {
                MatchisomCard *otherCard = (MatchisomCard *)card;
                if (otherCard.rank == self.rank) {
                    score += RANK_MATCH_SCORE;
                } else if ([otherCard.suit isEqualToString:self.suit]){
                    score += SUIT_MATCH_SCORE;
                }
            }
        }

    }
    return score;
}

#pragma mark - for security
-(NSString *)contents{
    
    NSArray *rankStrings = [MatchisomCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
    
}

+ (NSArray *)validSuits{
    return @[@"♥️",@"♦️",@"♣️",@"♠️"];
}

+ (NSArray *)rankStrings{
    return @[@"?",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank{
    return [[self rankStrings] count] -1;
}


#pragma mark - getter setter
- (void)setRank:(NSUInteger)rank{
    if (rank <= [MatchisomCard maxRank]) {
        _rank = rank;
        
        //我懂了，我是从_view而不是self.view中获取属性，_view此时尚未alloc init，self.view是调用getter方法
        
        //我本想在setter中同时设置view的rank等属性，但现实是这些属性为nil，当然这些操作放到deck中即可正常运转，但不够优雅，待debug
        self.view.rank = rank;
    }
}

- (void)setSuit:(NSString *)suit{
    if ( [[MatchisomCard validSuits] containsObject:suit]) {
        _suit = suit;
        self.view.suit = suit;
    }
}

- (NSString *)suit{
    return _suit ? _suit : @"?";
}

- (void)setChosen:(BOOL)chosen{
    _chosen = chosen;
    
    if (self.view.faceUP != chosen && self.view.faceUP == YES) {
//        [self.view flipCardAnimation];
        [self.view performSelector:@selector(flipCardAnimation) withObject:nil afterDelay:1.0];
    }
}

- (PlayingCardView *)view{
    if (!_view) {
        _view = [[PlayingCardView alloc] init];
    }
    return _view;
}

@end
