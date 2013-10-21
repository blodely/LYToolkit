//
//  ContactViewController.m
//  LYToolSample
//
//  Created by Rick Luo on 10/19/13.
//  Copyright (c) 2013 Luo Yu. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController ()

@end

@implementation ContactViewController

#pragma mark - ACTION

#pragma mark - INIT

- (id)init {
	self = [super initWithNibName:@"ContactViewController" bundle:nil];
	if (self) {
		// CUSTOM INITIALIZATION
	}
	return self;
}

#pragma mark | VIEW LIFE CYCLE

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


@end
