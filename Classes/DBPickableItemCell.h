//
//  DBPickableItemCell.h
//
//  Created by Daniel Bowden on 26/12/2014.
//
//

#import <UIKit/UIKit.h>

#import "DBPickableItem.h"

@protocol DBPickableItemCellDelegate;

@interface DBPickableItemCell : UITableViewCell

@property (nonatomic, weak) id<DBPickableItemCellDelegate> delegate;

- (void)showPickableItems:(NSArray *)pickableItems currentlySelectedItem:(id<DBPickableItem>)selectedItem;

@end

@protocol DBPickableItemCellDelegate <NSObject>

@required
- (void)DBPickableItemCellDidSelectItem:(id<DBPickableItem>)item;

@end
