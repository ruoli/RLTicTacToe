//
//  RuleControllerTests.m
//  RLTicTacToe
//
//  Created by Ruoli Zhou on 01/04/2013.
//  Copyright (c) 2013 LeeMac. All rights reserved.
//

#import "RuleControllerTests.h"

@implementation RuleControllerTests

- (void)setUp
{
    [super setUp];
    
    self.gridmodel = [[GridModel alloc] init];
    self.npc = [[NPCMaker alloc] init];
}

//-(void)testInitStateCheckRdyToPlay
//{
//    [self.gridmodel setItemOnRow:2 onColumn:2 withItem:@"X"];
//    STAssertFalse([self.gridmodel checkFirstMover], @"test");
//}

-(void)testAddItemToGridOnX
{
    [self.gridmodel addItemToGridOnX:0 OnY:0];
    [self.gridmodel addItemToGridOnX:0 OnY:1];
    [self.gridmodel addItemToGridOnX:2 OnY:0];
    
    NSString * s1=[self.gridmodel getItemFromMapOnRow:0 onCol:0];
    NSString * s2=[self.gridmodel getItemFromMapOnRow:0 onCol:1];
    NSString * s3=[self.gridmodel getItemFromMapOnRow:2 onCol:0];
    
    STAssertEqualObjects(s1, @"O", @"test move logic");
    STAssertEqualObjects(s2, @"X", @"test move logic");
    STAssertEqualObjects(s3, @"O", @"test move logic");
    
}

//-(void)testNPCgenerator
//{
//    NSUInteger x =[self.npc npcOnX];
//    NSUInteger y = [self.npc npcOnY];
//    STAssertTrue(x == 0, @"test on x");
//    STAssertTrue(y == 0, @"test on y");
//}
@end
