//
//  MatchisomViewController.m
//  CardsPlayGame
//
//  Created by 邵 建勇 on 14-8-23.
//  Copyright (c) 2014年 John Shaw. All rights reserved.
//

#import "MatchisomViewController.h"
#import "MatchisomDeck.h"

@interface MatchisomViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation MatchisomViewController

- (Deck *)createDeck{
    return [[MatchisomDeck alloc] init];
}

- (CardMatchingGame *)createGame{
    return [[CardMatchingGame alloc] initWithCount:[self.cardButtons count]
                                         usingDeck:[self createDeck]
                                        cardNumber:1];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
