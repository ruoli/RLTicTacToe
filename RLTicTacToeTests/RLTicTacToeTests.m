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
    //[self setItemReadyForTest];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

//- (void)setItemReadyForTest
//{
//    [self.girdmodel setItemOnRow:0 onColumn:0 withItem:@"X"];
//    [self.girdmodel setItemOnRow:0 onColumn:1 withItem:@"O"];
//    [self.girdmodel setItemOnRow:0 onColumn:2 withItem:@"X"];
//    
//    [self.girdmodel setItemOnRow:1 onColumn:0 withItem:@"X"];
//    [self.girdmodel setItemOnRow:1 onColumn:1 withItem:@"X"];
//    [self.girdmodel setItemOnRow:1 onColumn:2 withItem:@"X"];
//    
//    [self.girdmodel setItemOnRow:2 onColumn:0 withItem:@"X"];
//    [self.girdmodel setItemOnRow:2 onColumn:1 withItem:@"X"];
//    [self.girdmodel setItemOnRow:2 onColumn:2 withItem:@"X"];
//    
//}


- (void)testSetItemONGrid
{
    [self.girdmodel setItemOnRow:0 onColumn:0 withItem:@"00"];
    [self.girdmodel setItemOnRow:0 onColumn:1 withItem:@"01"];
    [self.girdmodel setItemOnRow:0 onColumn:2 withItem:@"02"];
    
    [self.girdmodel setItemOnRow:1 onColumn:0 withItem:@"10"];
    [self.girdmodel setItemOnRow:1 onColumn:1 withItem:@"11"];
    [self.girdmodel setItemOnRow:1 onColumn:2 withItem:@"12"];
    
    [self.girdmodel setItemOnRow:2 onColumn:0 withItem:@"20"];
    [self.girdmodel setItemOnRow:2 onColumn:1 withItem:@"21"];
    [self.girdmodel setItemOnRow:2 onColumn:2 withItem:@"22"];
    NSString * setData00 = [self.girdmodel getItemFromMapOnRow:0 onCol:0];
    NSString * setData01 = [self.girdmodel getItemFromMapOnRow:0 onCol:1];
    NSString * setData02 = [self.girdmodel getItemFromMapOnRow:0 onCol:2];
    
    NSString * setData10 = [self.girdmodel getItemFromMapOnRow:1 onCol:0];
    NSString * setData11 = [self.girdmodel getItemFromMapOnRow:1 onCol:1];
    NSString * setData12 = [self.girdmodel getItemFromMapOnRow:1 onCol:2];
    
    NSString * setData20 = [self.girdmodel getItemFromMapOnRow:2 onCol:0];
    NSString * setData21 = [self.girdmodel getItemFromMapOnRow:2 onCol:1];
    NSString * setData22 = [self.girdmodel getItemFromMapOnRow:2 onCol:2];
    
    STAssertEqualObjects(setData00, @"00", @"testing getting item method");
    STAssertEqualObjects(setData01, @"01", @"testing getting item method");
    STAssertEqualObjects(setData02, @"02", @"testing getting item method");
    
    STAssertEqualObjects(setData10, @"10", @"testing getting item method");
    STAssertEqualObjects(setData11, @"11", @"testing getting item method");
    STAssertEqualObjects(setData12, @"12", @"testing getting item method");
    
    STAssertEqualObjects(setData20, @"20", @"testing getting item method");
    STAssertEqualObjects(setData21, @"21", @"testing getting item method");
    STAssertEqualObjects(setData22, @"22", @"testing getting item method");
}

- (void)testRemoveItemOnGrid
{
    [self.girdmodel setItemOnRow:2 onColumn:2 withItem:@"X"];
    [self.girdmodel removeItemOnRow:2 onColumn:2];
    NSString * removedData = [self.girdmodel getItemFromMapOnRow:2 onCol:2];
    STAssertEqualObjects(removedData, @"empty", @"testing remove item method");
}

-(void)testCleanMap
{
    [self.girdmodel setItemOnRow:1 onColumn:2 withItem:@"O"];
    [self.girdmodel cleanMap];
    NSString * cleanedTestData = [self.girdmodel getItemFromMapOnRow:1 onCol:2];
    STAssertEqualObjects(cleanedTestData, @"empty", @"testing remove item method");
}

-(void)testCheckWinnerVerticallyLeft
{
    [self.girdmodel setItemOnRow:0 onColumn:0 withItem:@"X"];
    [self.girdmodel setItemOnRow:1 onColumn:0 withItem:@"X"];
    [self.girdmodel setItemOnRow:2 onColumn:0 withItem:@"X"];
    
    NSString *s1 = [self.girdmodel checkWinner];
    STAssertEqualObjects(s1, @"X is the winner", @"test check winner method");
}

-(void)testCheckWinnerVerticallyMid
{
    [self.girdmodel setItemOnRow:0 onColumn:1 withItem:@"X"];
    [self.girdmodel setItemOnRow:1 onColumn:1 withItem:@"X"];
    [self.girdmodel setItemOnRow:2 onColumn:1 withItem:@"X"];
    NSString *s2 = [self.girdmodel checkWinner];
    STAssertEqualObjects(s2, @"X is the winner", @"test check winner method");
}


-(void)testCheckWinnerVerticallyRight
{
    [self.girdmodel setItemOnRow:0 onColumn:2 withItem:@"X"];
    [self.girdmodel setItemOnRow:1 onColumn:2 withItem:@"X"];
    [self.girdmodel setItemOnRow:2 onColumn:2 withItem:@"X"];
    NSString *s3 = [self.girdmodel checkWinner];
    STAssertEqualObjects(s3, @"X is the winner", @"test check winner method");
}

-(void)testCheckWinnerDiagonallyRightToLeft
{
    [self.girdmodel setItemOnRow:0 onColumn:2 withItem:@"X"];
    [self.girdmodel setItemOnRow:1 onColumn:1 withItem:@"X"];
    [self.girdmodel setItemOnRow:2 onColumn:0 withItem:@"X"];
    NSString *s = [self.girdmodel checkWinner];
    STAssertEqualObjects(s, @"X is the winner", @"test check winner method");
}

-(void)testCheckWinnerDiagonallyLeftToRight
{
    [self.girdmodel setItemOnRow:0 onColumn:0 withItem:@"X"];
    [self.girdmodel setItemOnRow:1 onColumn:1 withItem:@"X"];
    [self.girdmodel setItemOnRow:2 onColumn:2 withItem:@"X"];
    NSString *s = [self.girdmodel checkWinner];
    STAssertEqualObjects(s, @"X is the winner", @"test check winner method");
}

-(void)testCheckWinnerHorizontallyTop
{
    [self.girdmodel setItemOnRow:0 onColumn:0 withItem:@"O"];
    [self.girdmodel setItemOnRow:0 onColumn:1 withItem:@"O"];
    [self.girdmodel setItemOnRow:0 onColumn:2 withItem:@"O"];
    
    
    
    NSString *s = [self.girdmodel checkWinner];
    STAssertEqualObjects(s, @"O is the winner", @"test check winner method");
}

-(void)testCheckWinnerHorizontallyMid
{
    [self.girdmodel setItemOnRow:1 onColumn:0 withItem:@"O"];
    [self.girdmodel setItemOnRow:1 onColumn:1 withItem:@"O"];
    [self.girdmodel setItemOnRow:1 onColumn:2 withItem:@"O"];
    NSString *s2 = [self.girdmodel checkWinner];
    STAssertEqualObjects(s2, @"O is the winner", @"test check winner method");
}

-(void)testCheckWinnerHorizontallyButtom
{
    
    [self.girdmodel setItemOnRow:2 onColumn:0 withItem:@"O"];
    [self.girdmodel setItemOnRow:2 onColumn:1 withItem:@"O"];
    [self.girdmodel setItemOnRow:2 onColumn:2 withItem:@"O"];
    NSString *s3 = [self.girdmodel checkWinner];
    STAssertEqualObjects(s3, @"O is the winner", @"test check winner method");
}

-(void)testCleanMapCache
{
    [self.girdmodel setItemOnRow:0 onColumn:0 withItem:@"X"];
    [self.girdmodel setItemOnRow:1 onColumn:0 withItem:@"X"];
    [self.girdmodel setItemOnRow:2 onColumn:0 withItem:@"X"];
    [self.girdmodel isGameEndedCleanMapCache];
    
    NSString * setData00 = [self.girdmodel getItemFromMapOnRow:0 onCol:0];
    NSString * setData01 = [self.girdmodel getItemFromMapOnRow:0 onCol:1];
    NSString * setData02 = [self.girdmodel getItemFromMapOnRow:0 onCol:2];
    
    NSString * setData10 = [self.girdmodel getItemFromMapOnRow:1 onCol:0];
    NSString * setData11 = [self.girdmodel getItemFromMapOnRow:1 onCol:1];
    NSString * setData12 = [self.girdmodel getItemFromMapOnRow:1 onCol:2];
    
    NSString * setData20 = [self.girdmodel getItemFromMapOnRow:2 onCol:0];
    NSString * setData21 = [self.girdmodel getItemFromMapOnRow:2 onCol:1];
    NSString * setData22 = [self.girdmodel getItemFromMapOnRow:2 onCol:2];
    
    STAssertEqualObjects(setData00, @"GameOver", @"Test clean cache method");
    STAssertEqualObjects(setData01, @"GameOver", @"Test clean cache method");
    STAssertEqualObjects(setData02, @"GameOver", @"Test clean cache method");
    
    STAssertEqualObjects(setData10, @"GameOver", @"Test clean cache method");
    STAssertEqualObjects(setData11, @"GameOver", @"Test clean cache method");
    STAssertEqualObjects(setData12, @"GameOver", @"Test clean cache method");
    
    STAssertEqualObjects(setData20, @"GameOver", @"Test clean cache method");
    STAssertEqualObjects(setData21, @"GameOver", @"Test clean cache method");
    STAssertEqualObjects(setData22, @"GameOver", @"Test clean cache method");
}

-(void)testDrawGame
{
    [self.girdmodel setItemOnRow:0 onColumn:0 withItem:@"00"];
    [self.girdmodel setItemOnRow:0 onColumn:1 withItem:@"01"];
    [self.girdmodel setItemOnRow:0 onColumn:2 withItem:@"02"];
    
    [self.girdmodel setItemOnRow:1 onColumn:0 withItem:@"10"];
    [self.girdmodel setItemOnRow:1 onColumn:1 withItem:@"11"];
    [self.girdmodel setItemOnRow:1 onColumn:2 withItem:@"12"];
    
    [self.girdmodel setItemOnRow:2 onColumn:0 withItem:@"20"];
    [self.girdmodel setItemOnRow:2 onColumn:1 withItem:@"21"];
    [self.girdmodel setItemOnRow:2 onColumn:2 withItem:@"22"];
    
    NSString * s = [self.girdmodel checkWinner];
    STAssertEqualObjects(s, @"Draw Game", @"draw game test");
}
@end
