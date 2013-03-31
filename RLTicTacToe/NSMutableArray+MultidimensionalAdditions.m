//
//  NSMutableArray+MultidimensionalAdditions.m
//  RLTicTacToe
//
//  Created by Ruoli Zhou on 30/03/2013.
//  Copyright (c) 2013 LeeMac. All rights reserved.
//

#import "NSMutableArray+MultidimensionalAdditions.h"

@implementation NSMutableArray (MultidimensionalAdditions)


- (id)initWithCols:(NSUInteger)intCols
              withRows:(NSUInteger)intRow{
    NSUInteger i;
    NSUInteger j;
    NSMutableArray *map;
    if ((self = [self init])) {
        map = [[NSMutableArray alloc] initWithCapacity:intCols];
        for (i=0; i < intCols; i++) {
            NSMutableArray *row = [NSMutableArray arrayWithCapacity:intRow];
            for (j=0; j < intRow; j++) {
                [row insertObject:@"empty" atIndex:j];
            }
            [map addObject:row];
        }
    }
    
    return map;
}

- (void)setObject:(NSString *)object
      withCols:(NSUInteger)intCol
         withRows:(NSUInteger)intRow{
    [[self objectAtIndex:intCol] replaceObjectAtIndex:intRow withObject:object];
    
    //debug output
    NSLog(@"something in here?: %@", self);
}

- (void)removeObjectAtCols:(NSUInteger)intCol
                    atRows:(NSUInteger)intRow
{
    [[self objectAtIndex:intCol] replaceObjectAtIndex:intRow withObject:@"empty"];
    //debug output
    NSLog(@"something in here?: %@", self);
}

- (id)getObjectInCols:(NSUInteger)intCol
             withRows:(NSUInteger)intRow{
    return [[self objectAtIndex:intCol] objectAtIndex:intRow];
}

+ (id)sectionArrayWithCols:(NSUInteger)intCols
                      withRows:(NSUInteger)intRow{
    return [[self alloc] initWithCols:intCols withRows:intRow] ;
}

@end
