//
//  LYContact.m
//  LYToolSample
//
//  Created by Rick Luo on 12/10/13.
//  Copyright (c) 2013 Luo Yu. All rights reserved.
//

#import "LYContact.h"

@implementation LYContact

@synthesize name = _name;
@synthesize number = _number;
@synthesize sort = _sort;
@synthesize lastSave = _lastSave;
@synthesize uid = _uid;
@synthesize avatar = _avatar;

#pragma mark - NSCODING

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		
		_name = [aDecoder decodeObjectForKey:@"lycontact.name"];
		_number = [aDecoder decodeObjectForKey:@"lycontact.number"];
		_sort = [aDecoder decodeObjectForKey:@"lycontact.sort"];
		_lastSave = [aDecoder decodeObjectForKey:@"lycontact.last.save"];
		_uid = [aDecoder decodeObjectForKey:@"lycontact.uid"];
		_avatar = [aDecoder decodeObjectForKey:@"lycontact.avatar"];
	}
	return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
	
	[aCoder encodeObject:self.name forKey:@"lycontact.name"];
	[aCoder encodeObject:self.number forKey:@"lycontact.number"];
	[aCoder encodeObject:self.sort forKey:@"lycontact.sort"];
	[aCoder encodeObject:self.lastSave forKey:@"lycontact.last.save"];
	[aCoder encodeObject:self.uid forKey:@"lycontact.uid"];
	[aCoder encodeObject:self.avatar forKey:@"lycontact.avatar"];
	
}

@end

@implementation NSString (Phone)

- (NSString *)phoneNumber {
	return [[self componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"/.,()-+  "]] componentsJoinedByString:@""];
}

@end
