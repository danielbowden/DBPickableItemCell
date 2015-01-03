//
//  DBPickableItem.h
//
//  Created by Daniel Bowden on 26/12/2014.
//
//

@protocol DBPickableItem <NSObject>

@required
- (BOOL)isEqualToPickableItem:(id<DBPickableItem>)item;

@required
- (NSString *)displayString;

@end