//
//  ViewController.m
//  DBPickableItemCellDemo
//
//  Created by Daniel Bowden on 26/12/2014.
//  Copyright (c) 2014 Daniel Bowden. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

#import "DBPickableItemCell.h"
#import "Country.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, DBPickableItemCellDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *tableContent;
@property (nonatomic, strong) NSArray *people;
@property (nonatomic, strong) NSArray *countries;
@property (nonatomic, strong) Person *currentPerson;
@property (nonatomic, strong) Country *currentCountry;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    Person *person1 = [[Person alloc] init];
    person1.pID = @1;
    person1.firstName = @"Daniel";
    person1.lastName = @"Bowden";
    person1.email = @"daniel@bowden.in";
    
    Person *person2 = [[Person alloc] init];
    person2.pID = @2;
    person2.firstName = @"John";
    person2.lastName = @"Smith";
    person2.email = @"john@smith.com";
    
    Person *person3 = [[Person alloc] init];
    person3.pID = @3;
    person3.firstName = @"Jane";
    person3.lastName = @"Doe";
    person3.email = @"jane@doe.com";
    
    Person *person4 = [[Person alloc] init];
    person4.pID = @4;
    person4.firstName = @"Tim";
    person4.lastName = @"Jones";
    person4.email = @"tim@jones.com";
    
    self.people = @[person1, person2, person3, person4];
    self.currentPerson = [self.people firstObject];
    
    Country *country1 = [[Country alloc] init];
    country1.countryCode = @"AUS";
    country1.name = @"Australia";
    country1.currency = @"AUD";
    
    Country *country2 = [[Country alloc] init];
    country2.countryCode = @"USA";
    country2.name = @"United States";
    country2.currency = @"USD";
    
    Country *country3 = [[Country alloc] init];
    country3.countryCode = @"NZ";
    country3.name = @"New Zealand";
    country3.currency = @"NZD";
    
    self.countries = @[country1, country2, country3];
    self.currentCountry = [self.countries firstObject];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (!self.tableView)
    {
        self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.view addSubview:self.tableView];
    }
    
    [self.tableView registerClass:[DBPickableItemCell class] forCellReuseIdentifier:@"DBPickableItemCellIdentifier"];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section)
    {
        case 0:
            return @"Select a person";
            break;
        case 1:
            return @"Select a country";
            break;
        default:
            return @"";
            break;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DBPickableItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DBPickableItemCellIdentifier" forIndexPath:indexPath];
    
    switch (indexPath.section)
    {
        case 0:
            cell.textLabel.text = [self.currentPerson displayString];
            break;
        case 1:
            cell.textLabel.text = [self.currentCountry displayString];
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DBPickableItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DBPickableItemCellIdentifier" forIndexPath:indexPath];
    
    switch (indexPath.section)
    {
        case 0:
        {
            __weak typeof(self)weakSelf = self;
            [cell showPickableItems:self.people currentlySelectedItem:self.currentPerson selectionBlock:^(id<DBPickableItem> item) {
                
                weakSelf.currentPerson = item;
                [weakSelf.tableView deselectRowAtIndexPath:indexPath animated:YES];
                [weakSelf.tableView reloadData];
            }];

            break;
        }
        case 1:
        {
            __weak typeof(self)weakSelf = self;
            [cell showPickableItems:self.countries currentlySelectedItem:self.currentCountry selectionBlock:^(id<DBPickableItem> item) {
                
                weakSelf.currentCountry = item;
                [weakSelf.tableView deselectRowAtIndexPath:indexPath animated:YES];
                [weakSelf.tableView reloadData];
            }];

            break;
        }
    }
}


#pragma mark - DBPickableItemCellDelegate

- (void)DBPickableItemCellDidSelectItem:(id<DBPickableItem>)item
{
    if ([item isMemberOfClass:[Person class]])
    {
        self.currentPerson = item;
    }
//    else if ([object isMemberOfClass:[ServiceInterval class]])
//    {
//        self.selectedService.selectedServiceInterval = object;
//    }
    
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
