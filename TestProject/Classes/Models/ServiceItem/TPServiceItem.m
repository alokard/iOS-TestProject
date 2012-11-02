//
//  TPServiceItem.m
//  TestProject
//
//  Created by Zhenia on 11/01/12.
//  Copyright (c) 2012 Tulusha.com. All rights reserved.
//

#import "TPServiceItem.h"
#import "TPServiceAPIClient.h"
#import "TPServiceItemMapper.h"

@interface TPServiceItem ()

@end

@implementation TPServiceItem {
@private
    NSString *_itemId;
    NSString *_text;
    id _date;
}

@synthesize itemId = _itemId;
@synthesize text = _text;
@synthesize date = _date;


#pragma mark - items loader

+ (void)loadServiceItemsWithBlock:(void (^)(NSArray *posts, NSError *error))block {
    [[TPServiceAPIClient sharedClient] getPath:@"ru/get.php?type=last" parameters:nil success:^(AFHTTPRequestOperation *operation, id XML) {

        NSError *error = nil;
        NSXMLParser *xmlParser = XML;
        TPServiceItemMapper *mapper = [[TPServiceItemMapper alloc] init];
        [xmlParser setDelegate:mapper];
        NSMutableArray *mutablePosts = nil;
        if ([xmlParser parse])
        {
            mutablePosts = [NSMutableArray arrayWithCapacity:[mapper.itemsArray count]];
            for (NSDictionary *itemDictionary in mapper.itemsArray) {
                TPServiceItem *item = [[TPServiceItem alloc] initWithDictionary:itemDictionary];
                [mutablePosts addObject:item];
                [item release];
            }
        }
        else {
            NSMutableDictionary* details = [NSMutableDictionary dictionary];
            [details setValue:NSLocalizedString(@"Wrong server response", @"Wrong server response") forKey:NSLocalizedDescriptionKey];
            error = [NSError errorWithDomain:@"com.tulusha.testproject" code:500 userInfo:details];

        }
        [mapper release];

        if (block) {
            block([NSArray arrayWithArray:mutablePosts], error);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (block) {
            block([NSArray array], error);
        }
    }];
}

#pragma mark - Dealloc and Initializations

- (void)dealloc {
    [_itemId release], _itemId = nil;
    [_text release], _text = nil;
    [_date release], _date = nil;
    [super dealloc];
}

- (id)initWithDictionary:(NSDictionary *)aDictionary {
    self = [super init];
    if (self) {
        _itemId = [[aDictionary objectForKey:kID] retain];
         _text = [[aDictionary objectForKey:kText] retain];
        _date = [[aDictionary objectForKey:kDate] retain];
    }
    
    return self;
}

#pragma mark - Helper methods

- (CGFloat)textHeightForWidth:(CGFloat)aWidth {
    UIFont *font = [UIFont fontWithName:@"Avenir-Medium" size:17];
    CGSize size = CGSizeMake(aWidth, MAXFLOAT);
    size = [_text sizeWithFont:font constrainedToSize:size lineBreakMode:UILineBreakModeWordWrap];

    return size.height;
}

@end
