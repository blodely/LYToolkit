//
//  LYContact.m
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

#pragma mark - NSString Phone

@implementation NSString (Phone)

- (NSString *)phoneNumber {
	return [[self componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"/.,()-+  "]] componentsJoinedByString:@""];
}

@end

#pragma mark - NSString Letter

@implementation NSString (Letter)

- (NSString *)firstLetterUppercase {
	NSMutableString *mutStr = [[NSMutableString alloc] initWithString:self];
	CFStringTransform((CFMutableStringRef)mutStr, NULL, kCFStringTransformMandarinLatin, NO);
	CFStringTransform((CFMutableStringRef)mutStr, NULL, kCFStringTransformStripDiacritics, NO);
	return [[mutStr uppercaseString] substringToIndex:1];
}

@end
