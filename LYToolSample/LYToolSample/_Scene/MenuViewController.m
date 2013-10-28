//
//  MenuViewController.m
//  LYToolSample
//
//  Created by Rick Luo on 10/11/13.
//  Copyright (c) 2013 Luo Yu. All rights reserved.
//

#import "MenuViewController.h"
#import "ContactViewController.h"

@interface MenuViewController () <UITableViewDataSource, UITableViewDelegate> {
	
	NSMutableArray *dsMenu;
}

@end


static NSString *MenuCellIdentifier = @"MenuCellIdentifier";

@implementation MenuViewController

#pragma mark - ACTION

#pragma mark - INIT

- (id)init {
	self = [super initWithNibName:@"MenuViewController" bundle:nil];
	if (self) {
		// CUSTOM INITIALIZATION
		
		dsMenu = [NSMutableArray arrayWithCapacity:1];
	}
	return self;
}

#pragma mark | VIEW LIFE CYCLE

- (void)loadView {
	[super loadView];
	
	[tbMenu registerClass:[UITableViewCell class] forCellReuseIdentifier:MenuCellIdentifier];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// DO ANY ADDITIONAL SETUP AFTER LOADING THE VIEW FROM ITS NIB.
	
	self.navigationItem.title = @"LYTOOL SAMPLE MENU";
	
	[dsMenu addObjectsFromArray:@[@"Contact",]];
	[tbMenu reloadData];
	
	[LYAddressBook askAddressBookPermission];
}

#pragma mark | MEMORY MANAGEMENT

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// DISPOSE OF ANY RESOURCES THAT CAN BE RECREATED.
}

#pragma mark - METHOD

#pragma mark | PRIVATE METHOD

#pragma mark - GETTER AND SETTER

#pragma mark - DELEGATE

#pragma mark | UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [dsMenu count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)idp {
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MenuCellIdentifier forIndexPath:idp];
	cell.textLabel.text = dsMenu[idp.row];
	return cell;
}

#pragma mark | UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)idp {
	
	switch (idp.row) {
		case 0: {
			[self.navigationController pushViewController:[[ContactViewController alloc] init] animated:YES];
		} break;
			
		default:
			break;
	}
	[tableView deselectRowAtIndexPath:idp animated:YES];
}

#pragma mark - NOTIFICATION

@end
