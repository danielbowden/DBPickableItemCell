//
//  DemoColours.h
//  DBPickableItemCellDemo
//
//  Created by Daniel Bowden on 26/12/2014.
//  Copyright (c) 2014 Daniel Bowden. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DBPickableItem.h"

@interface Person : NSObject <DBPickableItem>

@property (nonatomic, strong) NSNumber *pID;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, strong) NSString *email;

@end
