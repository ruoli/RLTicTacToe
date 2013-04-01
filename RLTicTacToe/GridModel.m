//
//  GridModel.m
//  RLTicTacToe
//
//  Created by Ruoli Zhou on 29/03/2013.
//  Copyright (c) 2013 LeeMac. All rights reserved.
//

#import "GridModel.h"
@interface GridModel()

@end

@implementation GridModel

-(id)init
{
    if(self = [super init])
    {
        self.gridMap = [[NSMutableArray alloc] initWithX:3 withY:3];
    }
    return self;
}

-(void)setItemOnRow:(int)row
                        onColumn:(int)col
                          withItem:(NSString *)item
{
    [self.gridMap setObject:item withX:col withY:row];
}

-(void)removeItemOnRow:(int)row
                    onColumn:(int)col
{
    [self.gridMap removeObjectAtX:col atY:row];
}

-(NSString *)getItemFromMapOnRow:(int)row
                               onCol:(int)col
{
    return [self.gridMap getObjectInX:row withY:col];
}

-(void)cleanMap
{
    for (int i=0; i<3; i++) {
        for (int j =0; j<3; j++) {
            [self.gridMap setObject:@"empty" withX:i withY:j];
        }
    }
}

-(NSString *)getHorizontal:(NSUInteger)row
{
    NSString *itemOne = [self.gridMap getObjectInX:row withY:0];
    NSString *itemTwo = [self.gridMap getObjectInX:row withY:1];
    NSString *itemThree = [self.gridMap getObjectInX:row withY:2];
    
    NSString *line = [NSString stringWithFormat:@"%@%@%@",itemOne,itemTwo,itemThree];
    return line;
}

-(NSString *)getVertical:(NSUInteger)col
{
    NSString *itemOne = [self.gridMap getObjectInX:0 withY:col];
    NSString *itemTwo = [self.gridMap getObjectInX:1 withY:col];
    NSString *itemThree = [self.gridMap getObjectInX:2 withY:col];
    
    NSString *line = [NSString stringWithFormat:@"%@%@%@",itemOne,itemTwo,itemThree];
    return line;
}

-(NSString *)getDiagonal:(NSUInteger)dia
{
    NSString *itemOne;
    NSString *itemTwo;
    NSString *itemThree;
    if (dia < 1) {
        itemOne = [self.gridMap getObjectInX:0 withY:0];
        itemTwo = [self.gridMap getObjectInX:1 withY:1];
        itemThree = [self.gridMap getObjectInX:2 withY:2];
    } else {
        itemOne = [self.gridMap getObjectInX:2 withY:0];
        itemTwo = [self.gridMap getObjectInX:1 withY:1];
        itemThree = [self.gridMap getObjectInX:2 withY:2];
    }
    NSString *line = [NSString stringWithFormat:@"%@%@%@",itemOne,itemTwo,itemThree];
    return line;
}

-(NSString *)checkWinner
{
    for (int i=0; i<[self.gridMap count]; i++) {
        if ([self isOTheWinner:i]) {
            return @"O is the winner";
        }else if ([self isXTheWinner:i]){
            return @"X is the winner";
        }else if ([self isMapFilledAndDrawGame:i]){
            return @"draw game";
        }
    }
    return @"No Winner";
}

-(BOOL)isOTheWinner:(NSUInteger)item
{
    return [[self getHorizontal:item] isEqual:@"OOO"] ||
            [[self getVertical:item] isEqual:@"OOO"] ||
    [[self getDiagonal:item] isEqual:@"OOO"];
}

-(BOOL)isXTheWinner:(NSUInteger)item
{
    return [[self getHorizontal:item] isEqual:@"XXX"] ||
    [[self getVertical:item] isEqual:@"XXX"] ||
    [[self getDiagonal:item] isEqual:@"XXX"];
}

-(BOOL)isMapFilledAndDrawGame:(NSUInteger)item
{
    BOOL isMapFull = YES;
    for (int i=0; i<[self.gridMap count]; i++) {
        for (int j=0; j<[self.gridMap count]; j++) {
            if ([[self.gridMap getObjectInX:i withY:j] isEqual:@"empty"]) {
                isMapFull = false;
                break;
            }
        }
    }
    if (isMapFull) {
        return true;
    }else{
        return false;
    }
}


-(void)isGameEndedCleanMapCache
{
    if ([[self checkWinner] isEqual:@"O is the winner"] ||
        [[self checkWinner] isEqual:@"X is the winner"]) {
        [self cleanMapCache];
    }
}

-(void) cleanMapCache
{
    for (int i=0; i<[self.gridMap count]; i++) {
        for (int j=0; j<[self.gridMap count]; j++) {
            if ([[self.gridMap getObjectInX:i withY:j] isEqual:@"empty"]) {
                [self.gridMap setObject:@"GameOver" withX:i withY:j];
            }
        }
    }
}

@end
