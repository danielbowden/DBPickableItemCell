//
//  DBPickableItemCell.h
//
//  Created by Daniel Bowden on 26/12/2014.
//
//

#import <UIKit/UIKit.h>

#import "DBPickableItem.h"

@interface DBPickableItemCell : UITableViewCell

typedef void (^DBPickableItemSelectionBlock)(id<DBPickableItem> item);

- (void)showPickableItems:(NSArray *)pickableItems currentlySelectedItem:(id<DBPickableItem>)selectedItem selectionBlock:(DBPickableItemSelectionBlock)selectionBlock;

@end