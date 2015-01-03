//
//  DemoColours.m
//  DBPickableItemCellDemo
//
//  Created by Daniel Bowden on 26/12/2014.
//  Copyright (c) 2014 Daniel Bowden. All rights reserved.
//

#import "Person.h"

@implementation Person

- (BOOL)isEqualToPickableItem:(id<DBPickableItem>)item
{
    if (self == item)
    {
        return YES;
    }
    else if ([item isKindOfClass:[Person class]])
    {
        return ([self.pID compare:[(Person *)item pID]] == NSOrderedSame);
    }

    return NO;
}

- (NSString *)displayString
{
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

@end
