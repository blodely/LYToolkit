//
//  ContactViewController.m
//  LYToolSample
//
//  Created by Rick Luo on 10/19/13.
//  Copyright (c) 2013 Luo Yu. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController () <UITableViewDelegate, UITableViewDataSource> {
	
	NSMutableArray *dsContact;
}

@end


@implementation ContactViewController

#pragma mark - ACTION

#pragma mark - INIT

- (id)init {
	self = [super initWithNibName:@"ContactViewController" bundle:nil];
	if (self) {
		// CUSTOM INITIALIZATION
		
		dsContact = [NSMutableArray arrayWithCapacity:1];
	}
	return self;
}

#pragma mark | VIEW LIFE CYCLE

- (void)loadView {
	[super loadView];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// DO ANY ADDITIONAL SETUP AFTER LOADING THE VIEW FROM ITS NIB.
	
	self.navigationItem.title = @"CONTACTS";
	
	[self performSelector:@selector(loadAllContacts) withObject:nil afterDelay:0];
}

#pragma mark MEMORY MANAGEMENT

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// DISPOSE OF ANY RESOURCES THAT CAN BE RECREATED.
}

#pragma mark - METHOD

#pragma mark | PRIVATE METHOD

- (void)loadAllContacts {
	
	[dsContact removeAllObjects];
	[dsContact addObjectsFromArray:[LYAddressBook allContacts]];
	[tbContact reloadData];
}

#pragma mark - GETTER AND SETTER

#pragma mark - DELEGATE

#pragma mark | UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return [dsContact count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [dsContact[section][@"SUBARRAY"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)idp {
	
	NSString *ContactCellIdentifier = [NSString stringWithFormat:@"ContactCellIdentifier %d %d", idp.section, idp.row];
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ContactCellIdentifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ContactCellIdentifier];
		LYContact *one = dsContact[idp.section][@"SUBARRAY"][idp.row];
		cell.textLabel.text = one.name;
		cell.detailTextLabel.text = one.number;
	}
	
	return cell;
}

#pragma mark | UITableViewDelegate


@end
