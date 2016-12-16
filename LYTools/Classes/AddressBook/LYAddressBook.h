//
//  LYAddressBook.h
//  LYToolSample
//
//  Created by Rick Luo on 12/10/13.
//  Copyright (c) 2013 Luo Yu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <LYTools/LYContact.h>

@interface LYAddressBook : NSObject

#pragma mark - REQUEST ACCESS

+ (void)askAddressBookPermission;

#pragma mark - QUERY

#pragma mark | - ALL

+ (NSArray *)allContacts;

+ (NSArray *)contactsAfter:(NSDate *)after; // NOT GROUPED COLLECTION

@end
