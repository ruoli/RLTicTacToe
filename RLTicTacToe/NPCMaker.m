//
//  NPCMaker.m
//  RLTicTacToe
//
//  Created by Ruoli Zhou on 02/04/2013.
//  Copyright (c) 2013 LeeMac. All rights reserved.
//

#import "NPCMaker.h"

@implementation NPCMaker
-(id)init
{
    return [super init];
}

-(NSUInteger)npcOnX
{
    return arc4random() % 3;
}

-(NSUInteger)npcOnY
{
    return arc4random() % 3;
}

@end
