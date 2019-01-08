//
//  LYAddressBook.m
//  LYToolkit
//
//  CREATED BY LUO YU ON 2013-10-12.
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

#import "LYAddressBook.h"
#import <AddressBook/AddressBook.h>
#import <LYToolkit/LYContact.h>
#import <LYToolkit/NSMutableArray+Grouping.h>


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
			
			if (![firstName isEqualToString:@""]) {
				
				if (![lastName isEqualToString:@""]) {
					aContact.name = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
				} else {
					aContact.name = firstName;
				}
			} else {
				if (![lastName isEqualToString:@""]) {
					aContact.name = lastName;
				} else {
					aContact.name = @"";
				}
			}
//			aContact.name = !firstName && !lastName ? [NSString stringWithFormat:@"%@ %@", firstName, lastName] : (!firstName ? firstName : (!lastName ? lastName : @"#" ));
			if (aContact.name != nil && ![aContact.name isEqualToString:@""] && ![aContact.name isEqualToString:@" "]) {
				aContact.sort = [aContact.name firstLetterUppercase];
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
					aContact.sort = [aContact.name firstLetterUppercase];
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
