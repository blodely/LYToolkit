//
//  NSMutableArray+Grouping.h
//  LYToolSample
//
//  Created by Rick Luo on 12/14/13.
//  Copyright (c) 2013 Luo Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (Grouping)

- (void)grouping:(NSString * (^)(id object))block;

@end
