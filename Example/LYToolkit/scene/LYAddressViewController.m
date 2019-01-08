//
//  LYAddressViewController.m
//  LYToolkit
//
//  CREATED BY LUO YU ON 2016-12-16.
//	EMAIL: indie.luo@gmail.com
//
//	The MIT License (MIT)
//
//	COPYRIGHT (C) 2016 骆昱(LUO YU). ALL RIGHTS RESERVED.
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy of
//	this software and associated documentation files (the "Software"), to deal in
//	the Software without restriction, including without limitation the rights to
//	use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//	the Software, and to permit persons to whom the Software is furnished to do so,
//	subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in all
//	copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//	FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//	COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//	IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//	CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "LYAddressViewController.h"
#import <LYToolkit/LYAddressBook.h>


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
