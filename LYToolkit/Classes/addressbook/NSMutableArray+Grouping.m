//
//  NSMutableArray+Grouping.m
//  LYToolSample
//
//  Created by Rick Luo on 12/14/13.
//  Copyright (c) 2013 Luo Yu. All rights reserved.
//

#import "NSMutableArray+Grouping.h"

@implementation NSMutableArray (Grouping)

- (void)grouping:(NSString * (^)(id object))block {
	
	NSMutableDictionary *alphabetical = [NSMutableDictionary dictionaryWithCapacity:1];
	for (id item in self) {
		id key = block(item);
		if (key != nil) {
			NSMutableArray *temArray = [alphabetical objectForKey:key];
			if (temArray == nil) {
				temArray = [NSMutableArray arrayWithObject:item];
				if (temArray != nil) {
					[alphabetical setObject:temArray forKey:key];
				}
			} else {
				[temArray addObject:item];
			}
		}
	}
	
	[self removeAllObjects];
	
	for (int i = 0; i < [[alphabetical allKeys] count]; i++) {
		
		id key = [[alphabetical allKeys] objectAtIndex:i];
		[self addObject:@{@"TITLE": key, @"SUBARRAY": [alphabetical objectForKey:key],}];
	}
	
}

@end
