//
//  TPServiceItemMapper.h
//  TestProject
//
//  Created by Zhenia on 11/02/12.
//  Copyright (c) 2012 Tulusha.com. All rights reserved.
//



@interface TPServiceItemMapper : NSObject <NSXMLParserDelegate> {
    NSMutableArray *_itemsArray;
}
@property(nonatomic, retain) NSMutableArray *itemsArray;


@end
