# DBPickableItemCell

A UITableViewCell subclass that presents a UIPickerView for selection from multiple objects. Support for both iPhone (via inputView) and iPad (via UIPopoverController). Any object that conforms to the DBPickableItem protocol can be offered as an option in the pickerview.

This can simplify the selection from a list of items in a form or menu.

There is an example project included. Clone the repo and open `DBPickableItemCellDemo.xcworkspace`.

## Usage

Either create a subclass of `DBPickableItemCell` or use it directly in your UITableView like in the example project (ViewController.h/m).

Any objects that you would like to offer in a selectable list must conform to the `DBPickableItem` protocol. To do so the following methods are required to be implemented:

```objc
- (BOOL)isEqualToPickableItem:(id<DBPickableItem>)item;
- (NSString *)displayString;
```

For example a Person object would be as follows:

```objc
//Person.h
@interface Person : NSObject <DBPickableItem>
```

The `-displayString` method is used to return what should be displayed for an individual pickable item in the list.

```objc
//Person.m
- (NSString *)displayString
{
  return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}
```

The `-isEqualToPickableItem:` method is used to ensure the currently selected item can be highlighted when the list is presented. This method is required, though you are free to determine what makes two items equal. For example this could be matching userIDs, a name, etc. As demonstrated in the example project with Person.m, and Country.m

### Presenting Pickable List

To present the pickable list from your tableview you can call the `-showPickableItems:currentlySelectedItem:selectionBlock:` method from within `-tableView:didSelectRowAtIndexPath:`

```objc
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  DBPickableItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DBPickableItemCellIdentifier" forIndexPath:indexPath];

  __weak typeof(self)weakSelf = self;

  [cell showPickableItems:self.people currentlySelectedItem:self.currentPerson selectionBlock:^(id<DBPickableItem> item) {
    weakSelf.currentPerson = item;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [tableView reloadData];
  }];
}
```
**iPhone**

[![iPhone](/Example/Screenshots/DBPickableItemCell-iPhone-small.png?raw=true)](/Example/Screenshots/DBPickableItemCell-iPhone.png?raw=true)


**iPad**

[![iPad](/Example/Screenshots/DBPickableItemCell-iPad-small.png?raw=true)](/Example/Screenshots/DBPickableItemCell-iPad.png?raw=true)

## Installation

DBPickableItemCell is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

pod "DBPickableItemCell"

## Author

Daniel Bowden

[github.com/danielbowden](https://github.com/danielbowden)

[twitter.com/danielgbowden](https://twitter.com/danielgbowden)

## License

DBPickableItemCell is available under the MIT license. See the LICENSE file for more info.
