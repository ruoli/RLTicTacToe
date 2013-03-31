//
//  GridModel.h
//  RLTicTacToe
//
//  Created by Ruoli Zhou on 29/03/2013.
//  Copyright (c) 2013 LeeMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSMutableArray+MultidimensionalAdditions.h"

@interface GridModel : NSObject

@property(strong,nonatomic)NSMutableArray *gridMap;

-(void)setItemOnRow:(int)row
                    onColumn:(int)col
                    withItem:(NSString *)item;

-(void)removeItemOnRow:(int)row
                       onColumn:(int)col;

-(NSString *)getItemFromMapOnRow:(int)row
                               onCol:(int)col;

-(void)cleanMap;


-(NSString *)checkWinner;

-(void)isGameEndedCleanMapCache;

@end
