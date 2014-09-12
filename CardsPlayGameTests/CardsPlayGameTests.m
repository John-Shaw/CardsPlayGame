//
//  CardsPlayGameTests.m
//  CardsPlayGameTests
//
//  Created by 邵 建勇 on 14-8-11.
//  Copyright (c) 2014年 John Shaw. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "InstanceDeck.h"

@interface CardsPlayGameTests : XCTestCase

@end

@implementation CardsPlayGameTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    
    InstanceDeck *deck = [[InstanceDeck alloc] init];
    XCTAssertEqual([deck drawRandomCard].class, [Card class] , @"draw a card");
}

@end


