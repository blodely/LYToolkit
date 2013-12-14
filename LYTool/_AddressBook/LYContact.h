//
//  LYContact.h
//  LYToolSample
//
//  Created by Rick Luo on 12/10/13.
//  Copyright (c) 2013 Luo Yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LYContact : NSObject <NSCoding>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *number;
@property (nonatomic, strong) NSString *sort;

@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) UIImage *avatar;

@end
