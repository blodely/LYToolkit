//
//  LYChat.m
//  LYToolSample
//
//  Created by Rick Luo on 2013-10-01.
//  Copyright (c) 2013 Luo Yu. All rights reserved.
//

#import "LYChat.h"

@implementation LYChat

#pragma mark - NSCODING

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super init]) {
		_message = [aDecoder decodeObjectForKey:@"ly.chat.message"];
		_sentDate = [aDecoder decodeObjectForKey:@"ly.chat.sent.date"];
	}
	return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
	
	[aCoder encodeObject:self.message forKey:@"ly.chat.message"];
	[aCoder encodeObject:self.sentDate forKey:@"ly.chat.sent.date"];
}

@end
