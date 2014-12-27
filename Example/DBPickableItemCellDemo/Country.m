//
//  Country.m
//  DBPickableItemCellDemo
//
//  Created by Daniel Bowden on 27/12/2014.
//  Copyright (c) 2014 Daniel Bowden. All rights reserved.
//

#import "Country.h"

@implementation Country

- (BOOL)isEqual:(id)object
{
    if ([object isKindOfClass:[Country class]])
    {
        return [self.countryCode isEqualToString:[object countryCode]];
    }
    else
    {
        return NO;
    }
}

- (NSString *)displayString
{
    return self.name;
}

@end
