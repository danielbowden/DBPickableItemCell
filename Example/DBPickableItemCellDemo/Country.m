//
//  Country.m
//  DBPickableItemCellDemo
//
//  Created by Daniel Bowden on 27/12/2014.
//  Copyright (c) 2014 Daniel Bowden. All rights reserved.
//

#import "Country.h"

@implementation Country

- (BOOL)isEqualToPickableItem:(id<DBPickableItem>)item
{
    if (self == item)
    {
        return YES;
    }
    else if ([item isKindOfClass:[Country class]])
    {
        return [self.countryCode isEqualToString:[(Country *)item countryCode]];
    }
    
    return NO;
}

- (NSString *)displayString
{
    return self.name;
}

@end
