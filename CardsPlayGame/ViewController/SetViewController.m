//
//  SetViewController.m
//  CardsPlayGame
//
//  Created by 邵 建勇 on 14-9-5.
//  Copyright (c) 2014年 John Shaw. All rights reserved.
//

#import "SetViewController.h"
#import "SetDeck.h"

//for fast test
#import "SetCard.h"

@interface SetViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation SetViewController


- (Deck *)createDeck{
    return [[SetDeck alloc] init];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)touchCardButton:(id)sender{
    UIButton *button = (UIButton *)sender;
    unsigned long cardIndex = [self.cardButtons indexOfObject:sender];
    Card *card = [self.game cardAtIndex:cardIndex];
    [button setTitle:card.contents forState:UIControlStateNormal];
    SetCard *setcard = (SetCard *)card;
    [button setTitleColor:setcard.color forState:UIControlStateNormal];
}


- (IBAction)touchStartButton:(id)sender{
    NSLog(@"touch start button");
}

- (void)updateUI{
    NSLog(@"update ui");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
