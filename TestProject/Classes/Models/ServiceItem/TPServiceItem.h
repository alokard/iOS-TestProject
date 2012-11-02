//
//  TPServiceItem.h
//  TestProject
//
//  Created by Zhenia on 11/02/12.
//  Copyright (c) 2012 Tulusha.com. All rights reserved.
//



@interface TPServiceItem : NSObject <NSXMLParserDelegate>

@property(nonatomic, readonly) id itemId;
@property(nonatomic, readonly) id text;

@property(nonatomic, readonly) id date;

- (id)initWithDictionary:(NSDictionary *)aDictionary;

- (CGFloat)textHeightForWidth:(CGFloat)aWidth;

+ (void)loadServiceItemsWithBlock:(void (^)(NSArray *posts, NSError *error))block;

@end
