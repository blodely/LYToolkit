//
//  LYAddressViewController.m
//  LYTOOLS
//
//  CREATED BY LUO YU ON 16/12/2016.
//  COPYRIGHT © 2016 LUO YU. ALL RIGHTS RESERVED.
//

#import "LYAddressViewController.h"
#import <LYTools/LYAddressBook.h>

NSString *const ContactsCellIdentifier = @"ContactsCellIdentifier";

@interface LYAddressViewController () <UITableViewDelegate, UITableViewDataSource> {
	
	__weak IBOutlet UITableView *tbContact;
	
	NSArray *contacts;
}

@end

@implementation LYAddressViewController

#pragma mark - ACTION

#pragma mark - INIT

- (instancetype)init {
	if (self = [super initWithNibName:@"LYAddressViewController" bundle:[NSBundle mainBundle]]) {
	}
	return self;
}

#pragma mark | VIEW LIFE CYCLE

- (void)loadView {
	[super loadView];
	
	[tbContact registerClass:[UITableViewCell class] forCellReuseIdentifier:ContactsCellIdentifier];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// DO ANY ADDITIONAL SETUP AFTER LOADING THE VIEW FROM ITS NIB.
	
	[LYAddressBook askAddressBookPermission];
	
	if (contacts == nil) {
		contacts = [LYAddressBook allContacts];
	}
	[tbContact reloadData];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// DISPOSE OF ANY RESOURCES THAT CAN BE RECREATED.
}

#pragma mark - DELEGATE

#pragma mark | UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)idp {
	[tableView deselectRowAtIndexPath:idp animated:YES];
}

#pragma mark | UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return [contacts count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [contacts[section][@"SUBARRAY"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)idp {
	
	__weak LYContact *contact = contacts[idp.section][@"SUBARRAY"][idp.row];
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ContactsCellIdentifier forIndexPath:idp];
	
	cell.textLabel.text = contact.name;
	
	return cell;
}

@end
