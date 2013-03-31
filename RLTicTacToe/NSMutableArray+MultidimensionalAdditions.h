//
//  NSMutableArray+MultidimensionalAdditions.h
//  RLTicTacToe
//
//  Created by Ruoli Zhou on 30/03/2013.
//  Copyright (c) 2013 LeeMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (MultidimensionalAdditions)



- (id)initWithCols:(NSUInteger)intCols
              withRows:(NSUInteger)intRow;

- (void)setObject:(NSString *)object
      withCols:(NSUInteger)intCol
         withRows:(NSUInteger)intRow;

- (void)removeObjectAtCols:(NSUInteger)intCol
                    atRows:(NSUInteger)intRow;

- (id)getObjectInCols:(NSUInteger)intCol
             withRows:(NSUInteger)intRow;

+ (id)sectionArrayWithCols:(NSUInteger)intCols
                  withRows:(NSUInteger)intRow;
@end