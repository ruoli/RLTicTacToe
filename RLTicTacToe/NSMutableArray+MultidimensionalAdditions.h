//
//  NSMutableArray+MultidimensionalAdditions.h
//  RLTicTacToe
//
//  Created by Ruoli Zhou on 30/03/2013.
//  Copyright (c) 2013 LeeMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (MultidimensionalAdditions)



- (id)initWithX:(NSUInteger)x
              withY:(NSUInteger)y;

- (void)setObject:(id)object
      withX:(NSUInteger)x
         withY:(NSUInteger)y;

- (void)removeObjectAtX:(NSUInteger)intCol
                    atY:(NSUInteger)intRow;

- (id)getObjectInX:(NSUInteger)x
             withY:(NSUInteger)y;

@end