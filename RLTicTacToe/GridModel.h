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

@property(strong,nonatomic)NSString * foodOfGui;
@property(strong,nonatomic)NSString * foodOfLogic;
@property(assign,nonatomic)BOOL OsTurn;
@property(assign,nonatomic)BOOL gameEnd;

-(void)setItemOnRow:(int)row
                    onColumn:(int)col
                    withItem:(NSString *)item;

-(void)removeItemOnRow:(int)row
                       onColumn:(int)col;

-(NSString *)getItemFromMapOnRow:(int)row
                               onCol:(int)col;

-(void)cleanMap;


-(NSString *)checkWinner;


-(void)addItemToGridOnX:(NSUInteger)x
                    OnY:(NSUInteger)y;


-(void)isGameEndedCleanMapCache;

@end
