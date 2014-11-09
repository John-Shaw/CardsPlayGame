//
//  PlayingCardView.h
//  superCard
//
//  Created by 邵 建勇 on 14-9-22.
//  Copyright (c) 2014年 John Shaw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView

@property (nonatomic) NSUInteger rank;
@property (nonatomic, strong) NSString *suit;
@property (nonatomic) BOOL faceUP;

- (void)flipCardAnimation;
//- (void)pinch:(UIPinchGestureRecognizer *)gesture;

@end
