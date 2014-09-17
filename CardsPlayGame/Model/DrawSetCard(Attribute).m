//
//  DrawSetCard(Attribute).m
//  CardsPlayGame
//
//  Created by 邵 建勇 on 14-9-12.
//  Copyright (c) 2014年 John Shaw. All rights reserved.
//

#import "DrawSetCard(Attribute).h"

@implementation DrawSetCard_Attribute_

+ (NSAttributedString *)setCardContent:(SetCard *)setcard{
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc] initWithString:setcard.contents];
    NSDictionary *attributeName = [[NSDictionary alloc] init];
    if ([setcard.shading isEqualToString:@"open"]) {
        attributeName = @{NSStrokeWidthAttributeName: @3,
                          NSStrokeColorAttributeName: setcard.color};
    }
    if ([setcard.shading isEqualToString:@"striped"]) {
        attributeName = @{NSStrokeWidthAttributeName: @15,
                          NSStrokeColorAttributeName: setcard.color};

    }
    if ([setcard.shading isEqualToString:@"solid"]) {
        attributeName = @{NSStrokeWidthAttributeName: @-3,
                          NSStrokeColorAttributeName: setcard.color,
                          NSForegroundColorAttributeName: setcard.color};
    }
    [content setAttributes:attributeName range:NSMakeRange(0, content.length)];
    return content;
}

@end
