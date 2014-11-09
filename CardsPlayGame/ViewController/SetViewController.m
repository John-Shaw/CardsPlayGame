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
@class SetCard;
#import "DrawSetCard(Attribute).h"
#import "SetGame.h"

@interface SetViewController ()

@property (weak, nonatomic) IBOutlet UILabel *MatchInfo;


@end

@implementation SetViewController


- (Deck *)createDeck{
    return [[SetDeck alloc] init];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
//    for (UIButton *button in self.cardButtons) {
//        unsigned long cardIndex = [self.cardButtons indexOfObject:button];
//        SetCard *card = (SetCard *)[self.game cardAtIndex:cardIndex];
//        [button setAttributedTitle:[DrawSetCard_Attribute_ setCardContent:card] forState:UIControlStateNormal];
//    }
}

- (void)setup{
    
}

- (IBAction)touchStartButton:(id)sender{

}

- (void)updateUI{
//    for (UIButton *button in self.cardButtons) {
//        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:button]];
//        if(card.isChosen)
//        {
//            [button setBackgroundColor:[UIColor lightGrayColor]];
//        }
//        else{
//            [button setBackgroundColor:[UIColor whiteColor]];
//        }
//    }
//    [self.MatchInfo setText:[NSString stringWithFormat:@"%@", self.game.matchDetail]];
//    
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
