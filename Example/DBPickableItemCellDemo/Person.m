//
//  DemoColours.m
//  DBPickableItemCellDemo
//
//  Created by Daniel Bowden on 26/12/2014.
//  Copyright (c) 2014 Daniel Bowden. All rights reserved.
//

#import "Person.h"

@implementation Person

- (BOOL)isEqual:(id)object
{
    if ([object isKindOfClass:[Person class]])
    {
        return ([self.pID compare:[object pID]] == NSOrderedSame);
    }
    else
    {
        return NO;
    }
}

- (NSString *)displayString
{
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

@end
