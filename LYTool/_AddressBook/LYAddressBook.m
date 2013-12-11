//
//  LYAddressBook.m
//  LYToolSample
//
//  Created by Rick Luo on 12/10/13.
//  Copyright (c) 2013 Luo Yu. All rights reserved.
//

#import "LYAddressBook.h"
#import <AddressBook/AddressBook.h>
#import "LYContact.h"

@implementation LYAddressBook

+ (NSArray *)allContacts {
	
	NSMutableArray *contacts = [NSMutableArray arrayWithCapacity:1];
	
	CFErrorRef *error = nil;
	ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error);
	
	
	NSArray *allContacts = (__bridge_transfer NSArray *)ABAddressBookCopyArrayOfAllPeople(addressBook);
	
	for (id one in allContacts) {
		
		LYContact *aContact = [[LYContact alloc] init];
		
		NSString *firstName = (__bridge_transfer NSString *)ABRecordCopyValue((__bridge ABRecordRef)(one), kABPersonFirstNameProperty);
		NSString *lastName = (__bridge_transfer NSString *)ABRecordCopyValue((__bridge ABRecordRef)(one), kABPersonLastNameProperty);
		
		aContact.name = !firstName && !lastName ? [NSString stringWithFormat:@"%@ %@", firstName, lastName] : (!firstName ? firstName : (!lastName ? lastName : @" " ));
		aContact.number;
		
		[contacts addObject:aContact];
	}
	
	return nil;
}

@end
