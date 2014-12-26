//
//  DBPickableItemCell.m
//
//  Created by Daniel Bowden on 26/12/2014.
//
//

#import "DBPickableItemCell.h"

#define DBPICKABLEITEMCELL_IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

@interface DBPickableItemCell () <UIPickerViewDataSource, UIPickerViewDelegate, UIPopoverControllerDelegate>

@property (nonatomic, strong) UIPickerView *itemPicker;
@property (nonatomic, strong) UITextField *hiddenTextField;
@property (nonatomic, strong) id<DBPickableItem> currentlySelectedItem;
@property (nonatomic, strong) NSArray *pickableItems;
@property (nonatomic, strong) UIPopoverController *itemPopover;

- (void)dismissPicker;

@end

@implementation DBPickableItemCell

- (void)dismissPicker
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(DBPickableItemCellDidSelectItem:)])
    {
        [self.delegate DBPickableItemCellDidSelectItem:self.currentlySelectedItem];
    }
}

- (void)showPickableItems:(NSArray *)pickableItems currentlySelectedItem:(id<DBPickableItem>)selectedItem
{
    self.pickableItems = pickableItems;
    self.currentlySelectedItem = selectedItem;
    
    if (self.pickableItems.count > 1)
    {
        if (!self.itemPicker)
        {
            self.itemPicker = [[UIPickerView alloc] init];
        }
        
        self.itemPicker.dataSource = self;
        self.itemPicker.delegate = self;
        
        __weak typeof(self)weakSelf = self;
        
        NSInteger indexOfCurrentSelectedItem = [self.pickableItems indexOfObjectPassingTest:^BOOL(id<DBPickableItem> obj, NSUInteger idx, BOOL *stop) {
            
            return [obj isEqual:weakSelf.currentlySelectedItem];
        }];
        
        if (indexOfCurrentSelectedItem != NSNotFound)
        {
            [self.itemPicker selectRow:indexOfCurrentSelectedItem inComponent:0 animated:NO];
        }
        
        if (DBPICKABLEITEMCELL_IS_IPAD)
        {
            if (!self.itemPopover)
            {
                UIViewController *content = [[UIViewController alloc] init];
                content.view = self.itemPicker;
                content.preferredContentSize = content.view.frame.size;
                self.itemPopover = [[UIPopoverController alloc] initWithContentViewController:content];
                self.itemPopover.delegate = self;
            }
            [self.itemPopover presentPopoverFromRect:self.contentView.frame inView:self permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        }
        else
        {
            if (!self.hiddenTextField)
            {
                UIToolbar *keyboardToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0, 0.0, CGRectGetWidth(self.frame), 50.0)];
                keyboardToolbar.barStyle = UIBarStyleDefault;
                UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(dismissPicker)];
                UIBarButtonItem *flexibleSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
                keyboardToolbar.items = @[flexibleSpace, doneButton];
                [keyboardToolbar sizeToFit];
                
                self.hiddenTextField = [[UITextField alloc] init];
                self.hiddenTextField.hidden = YES;
                self.hiddenTextField.inputView = self.itemPicker;
                self.hiddenTextField.inputAccessoryView = keyboardToolbar;
                [self.contentView addSubview:self.hiddenTextField];
            }
            
            [self.hiddenTextField becomeFirstResponder];
        }
    }
}

#pragma mark - UIPickerView DataSource & Delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.pickableItems.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    id<DBPickableItem> item = self.pickableItems[row];
    
    return [item displayString];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.currentlySelectedItem = self.pickableItems[row];
}

#pragma mark - UIPopoverControllerDelegate

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    [self dismissPicker];
}

@end
