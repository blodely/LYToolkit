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

static NSString *ContactCellIdentifier = @"ContactCellIdentifier";

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
	
	[tbContact registerClass:[UITableViewCell class] forCellReuseIdentifier:ContactCellIdentifier];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// DO ANY ADDITIONAL SETUP AFTER LOADING THE VIEW FROM ITS NIB.
	
	self.navigationItem.title = @"CONTACTS";
}

#pragma mark MEMORY MANAGEMENT

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// DISPOSE OF ANY RESOURCES THAT CAN BE RECREATED.
}

#pragma mark - METHOD

#pragma mark | PRIVATE METHOD

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
	
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ContactCellIdentifier forIndexPath:idp];
	
	return cell;
}

#pragma mark | UITableViewDelegate


@end
