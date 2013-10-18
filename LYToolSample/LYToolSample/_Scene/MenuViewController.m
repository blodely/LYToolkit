//
//  MenuViewController.m
//  LYToolSample
//
//  Created by Rick Luo on 10/11/13.
//  Copyright (c) 2013 Luo Yu. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController () <UITableViewDataSource, UITableViewDelegate> {
	
	NSMutableArray *dsMenu;
}

@end

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

- (void)viewDidLoad {
	[super viewDidLoad];
	// DO ANY ADDITIONAL SETUP AFTER LOADING THE VIEW FROM ITS NIB.
	
	self.navigationItem.title = @"LYTOOL SAMPLE MENU";
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
	return nil;
}

#pragma mark | UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)idp {
	
	[tableView deselectRowAtIndexPath:idp animated:YES];
}

#pragma mark - NOTIFICATION

@end
