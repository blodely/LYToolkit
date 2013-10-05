//
//  LYChat.h
//  LYToolSample
//
//  Created by Rick Luo on 2013-10-01.
//  Copyright (c) 2013 Luo Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	LYChatTypeSelf = 0,
	LYChatTypeOther = 1,
} LYChatType;

@interface LYChat : NSObject <NSCoding>

@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSDate *sentDate;
@property (nonatomic, assign) LYChatType type;

@end
