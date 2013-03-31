//
//  RLTicTacToeTests.m
//  RLTicTacToeTests
//
//  Created by Ruoli Zhou on 29/03/2013.
//  Copyright (c) 2013 LeeMac. All rights reserved.
//

#import "RLTicTacToeTests.h"

@implementation RLTicTacToeTests

- (void)setUp
{
    [super setUp];
    
    self.girdmodel = [[GridModel  alloc] init];
    [self setItemReadyForTest];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)setItemReadyForTest
{
    [self.girdmodel setItemOnRow:0 onColumn:2 withItem:@"X"];
    [self.girdmodel setItemOnRow:1 onColumn:2 withItem:@"O"];
    [self.girdmodel setItemOnRow:2 onColumn:2 withItem:@"X"];
    
    [self.girdmodel setItemOnRow:0 onColumn:1 withItem:@"X"];
    [self.girdmodel setItemOnRow:1 onColumn:1 withItem:@"X"];
    [self.girdmodel setItemOnRow:2 onColumn:1 withItem:@"X"];
    
    [self.girdmodel setItemOnRow:0 onColumn:0 withItem:@"X"];
    [self.girdmodel setItemOnRow:1 onColumn:0 withItem:@"O"];
    [self.girdmodel setItemOnRow:2 onColumn:0 withItem:@"X"];
    
}


- (void)testSetItemONGrid
{
    NSString * setData = [self.girdmodel getItemFromMapOnRow:2 onCol:2];
    STAssertEqualObjects(setData, @"X", @"testing getting item method");
}

- (void)testRemoveItemOnGrid
{
    [self.girdmodel removeItemOnRow:2 onColumn:2];
    NSString * removedData = [self.girdmodel getItemFromMapOnRow:2 onCol:2];
    STAssertEqualObjects(removedData, @"empty", @"testing remove item method");
}

-(void)testCleanMap
{
    [self.girdmodel cleanMap];
    NSString * cleanedTestData = [self.girdmodel getItemFromMapOnRow:1 onCol:2];
    STAssertEqualObjects(cleanedTestData, @"empty", @"testing remove item method");
}

-(void)testCheckWinner
{
    
    NSString *s = [self.girdmodel checkWinner];
    STAssertEqualObjects(s, @"OOO", @"test check winner method");
}

@end
