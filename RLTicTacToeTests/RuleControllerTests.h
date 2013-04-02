//
//  RuleControllerTests.h
//  RLTicTacToe
//
//  Created by Ruoli Zhou on 01/04/2013.
//  Copyright (c) 2013 LeeMac. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "GridModel.h"
#import "NPCMaker.h"
@interface RuleControllerTests : SenTestCase
@property(strong,nonatomic)GridModel *gridmodel;
@property(strong,nonatomic)NPCMaker * npc;
@end
