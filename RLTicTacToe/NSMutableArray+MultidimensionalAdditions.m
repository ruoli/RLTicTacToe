//
//  NSMutableArray+MultidimensionalAdditions.m
//  RLTicTacToe
//
//  Created by Ruoli Zhou on 30/03/2013.
//  Copyright (c) 2013 LeeMac. All rights reserved.
//

#import "NSMutableArray+MultidimensionalAdditions.h"

@implementation NSMutableArray (MultidimensionalAdditions)


- (id)initWithX:(NSUInteger)x
              withY:(NSUInteger)y{
    NSUInteger i;
    NSUInteger j;
    NSMutableArray *map;
    if ((self = [self init])) {
        map = [[NSMutableArray alloc] initWithCapacity:x];
        for (i=0; i < x; i++) {
            NSMutableArray *row = [NSMutableArray arrayWithCapacity:y];
            for (j=0; j < y; j++) {
                [row insertObject:@"empty" atIndex:j];
            }
            [map addObject:row];
        }
    }
    
    return map;
}

- (void)setObject:(NSString *)object
      withX:(NSUInteger)x
         withY:(NSUInteger)y{
    [[self objectAtIndex:x] replaceObjectAtIndex:y withObject:object];
    
}

- (void)removeObjectAtX:(NSUInteger)x
                    atY:(NSUInteger)y
{
    [[self objectAtIndex:x] replaceObjectAtIndex:y withObject:@"empty"];
}

- (id)getObjectInX:(NSUInteger)x
             withY:(NSUInteger)y{
    return [[self objectAtIndex:x] objectAtIndex:y];
}

@end
