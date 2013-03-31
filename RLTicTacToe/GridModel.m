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
        self.gridMap = [[NSMutableArray alloc] initWithCols:3 withRows:3];
    }
    return self;
}

-(void)setItemOnRow:(int)row
                        onColumn:(int)col
                          withItem:(NSString *)item
{
    [self.gridMap setObject:item withCols:col withRows:row];
}

-(void)removeItemOnRow:(int)row
                    onColumn:(int)col
{
    [self.gridMap removeObjectAtCols:col atRows:row];
}

-(NSString *)getItemFromMapOnRow:(int)row
                               onCol:(int)col
{
    return [self.gridMap getObjectInCols:row withRows:col];
}

-(void)cleanMap
{
    for (int i=0; i<3; i++) {
        for (int j =0; j<3; j++) {
            [self.gridMap setObject:@"empty" withCols:i withRows:j];
        }
    }
}

-(NSString *)getHorizontal:(NSUInteger)row
{
    NSString *itemOne = [self.gridMap getObjectInCols:0 withRows:row];
    NSString *itemTwo = [self.gridMap getObjectInCols:1 withRows:row];
    NSString *itemThree = [self.gridMap getObjectInCols:2 withRows:row];
    
    NSString *line = [NSString stringWithFormat:@"%@%@%@",itemOne,itemTwo,itemThree];
    return line;
}

-(NSString *)getVertical:(NSUInteger)col
{
    NSString *itemOne = [self.gridMap getObjectInCols:col withRows:0];
    NSString *itemTwo = [self.gridMap getObjectInCols:col withRows:1];
    NSString *itemThree = [self.gridMap getObjectInCols:col withRows:2];
    
    NSString *line = [NSString stringWithFormat:@"%@%@%@",itemOne,itemTwo,itemThree];
    return line;
}

-(NSString *)getDiagonal:(NSUInteger)dia
{
    NSString *itemOne;
    NSString *itemTwo;
    NSString *itemThree;
    if (dia < 1) {
        itemOne = [self.gridMap getObjectInCols:0 withRows:0];
        itemTwo = [self.gridMap getObjectInCols:1 withRows:1];
        itemThree = [self.gridMap getObjectInCols:2 withRows:2];
    } else {
        itemOne = [self.gridMap getObjectInCols:2 withRows:0];
        itemTwo = [self.gridMap getObjectInCols:1 withRows:1];
        itemThree = [self.gridMap getObjectInCols:2 withRows:0];
    }
    NSString *line = [NSString stringWithFormat:@"%@%@%@",itemOne,itemTwo,itemThree];
    return line;
}

-(NSString *)checkWinner
{
    //test git
    return [self getDiagonal:0];
}

@end
