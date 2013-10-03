//
//  LYChat.h
//  LYToolSample
//
//  Created by Rick Luo on 2013-10-01.
//  Copyright (c) 2013 Luo Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYChat : NSObject <NSCoding>

@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSDate *sentDate;

@end
