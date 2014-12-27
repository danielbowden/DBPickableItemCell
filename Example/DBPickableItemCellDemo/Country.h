//
//  Country.h
//  DBPickableItemCellDemo
//
//  Created by Daniel Bowden on 27/12/2014.
//  Copyright (c) 2014 Daniel Bowden. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBPickableItem.h"

@interface Country : NSObject <DBPickableItem>

@property (nonatomic, copy) NSString *countryCode;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *currency;

@end
