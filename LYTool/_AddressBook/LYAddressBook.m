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
#import "NSMutableArray+Grouping.h"
#import "pinyin.h"

@implementation LYAddressBook

#pragma mark - REQUEST ACCESS

+ (void)askAddressBookPermission {
	
	CFErrorRef *error = nil;
	ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error);
	ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
		
	});
}

#pragma mark - QUERY

#pragma mark | - ALL

+ (NSArray *)allContacts {
	
	NSMutableArray *contacts = [NSMutableArray arrayWithCapacity:1];
	
	CFErrorRef *error = nil;
	ABAddressBookRef addressBook = ABAddressBookCreateWithOptions(NULL, error);
	
	// READ OUT ALL CONTACTS
	NSArray *allContacts = (__bridge_transfer NSArray *)ABAddressBookCopyArrayOfAllPeople(addressBook);
	
	for (int i = 0; i < [allContacts count]; i++) {
		
		// GET ONE RECORD
		ABRecordRef one = (__bridge ABRecordRef)allContacts[i];
		
		ABMultiValueRef numbers = ABRecordCopyValue(one, kABPersonPhoneProperty);
		
		// SPLIT BY NUMBER
		for (int j = 0; j < ABMultiValueGetCount(numbers); j++) {
			
			LYContact *aContact = [[LYContact alloc] init];
			
			NSString *firstName = (__bridge_transfer NSString *)ABRecordCopyValue(one, kABPersonFirstNameProperty);
			NSString *lastName = (__bridge_transfer NSString *)ABRecordCopyValue(one, kABPersonLastNameProperty);
			
			aContact.name = !firstName && !lastName ? [NSString stringWithFormat:@"%@ %@", firstName, lastName] : (!firstName ? firstName : (!lastName ? lastName : @" " ));
			if (aContact.name != nil && ![aContact.name isEqualToString:@""] && ![aContact.name isEqualToString:@" "]) {
				aContact.sort = [[NSString stringWithFormat:@"%c", pinyinFirstLetter([aContact.name characterAtIndex:0])] uppercaseString];
			} else {
				aContact.sort = @"#";
			}
			aContact.number = [(__bridge_transfer NSString *)ABMultiValueCopyValueAtIndex(numbers, j) phoneNumber];
			aContact.lastSave = (__bridge_transfer NSDate *)ABRecordCopyValue(one, kABPersonModificationDateProperty);
			
			[contacts addObject:aContact];
			
			aContact = nil;
		}
		
		CFRelease(numbers);
	}
	
	// SORT RECORD
	[contacts sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES selector:@selector(caseInsensitiveCompare:)], ]];
	
	// GROUPING
	[contacts grouping:^NSString *(id object) {
		return [object valueForKey:@"sort"];
	}];
	
	// SORT GROUP
	[contacts sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"TITLE" ascending:YES selector:@selector(caseInsensitiveCompare:)], ]];
	
	CFRelease(addressBook);
	
	return [NSArray arrayWithArray:contacts];
}

#pragma mark -

+ (NSArray *)contactsAfter:(NSDate *)after {
	
	NSMutableArray *contacts = [NSMutableArray arrayWithCapacity:1];
	double intervalAfter = [after timeIntervalSince1970];
	
	CFErrorRef *error = nil;
	ABAddressBookRef addressbook = ABAddressBookCreateWithOptions(NULL, error);
	
	// READ ALL
	NSArray *allContacts = (__bridge_transfer NSArray *)ABAddressBookCopyArrayOfAllPeople(addressbook);
	
	CFRelease(addressbook);
	
	for (int i = 0; i < [allContacts count]; i++) {
		
		ABRecordRef one = (__bridge ABRecordRef)allContacts[i];
		
		if ([(__bridge_transfer NSDate *)ABRecordCopyValue(one, kABPersonModificationDateProperty) timeIntervalSince1970] > intervalAfter) {
			// MODIFY DATE
			
			ABMultiValueRef numbers = ABRecordCopyValue(one, kABPersonPhoneProperty);
			
			// SPLIT BY NUMBER
			for (int j = 0; j < ABMultiValueGetCount(numbers); j++) {
				
				LYContact *aContact = [[LYContact alloc] init];
				
				NSString *firstName = (__bridge_transfer NSString *)ABRecordCopyValue(one, kABPersonFirstNameProperty);
				NSString *lastName = (__bridge_transfer NSString *)ABRecordCopyValue(one, kABPersonLastNameProperty);
				
				aContact.name = !firstName && !lastName ? [NSString stringWithFormat:@"%@ %@", firstName, lastName] : (!firstName ? firstName : (!lastName ? lastName : @" " ));
				if (aContact.name != nil && ![aContact.name isEqualToString:@""] && ![aContact.name isEqualToString:@" "]) {
					aContact.sort = [[NSString stringWithFormat:@"%c", pinyinFirstLetter([aContact.name characterAtIndex:0])] uppercaseString];
				} else {
					aContact.sort = @"#";
				}
				aContact.number = [(__bridge_transfer NSString *)ABMultiValueCopyValueAtIndex(numbers, j) phoneNumber];
				aContact.lastSave = (__bridge_transfer NSDate *)ABRecordCopyValue(one, kABPersonModificationDateProperty);
				
				[contacts addObject:aContact];
				
				aContact = nil;
			}
			
		}
		
		CFRelease(one);
	}
	
	// SORT RECORD
	[contacts sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES selector:@selector(caseInsensitiveCompare:)], ]];
	
	// NOT GROUPED COLLECTION !!!
	return [NSArray arrayWithArray:contacts];
}

@end
