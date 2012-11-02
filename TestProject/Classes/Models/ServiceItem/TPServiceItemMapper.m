//
//  TPServiceItemMapper.m
//  TestProject
//
//  Created by Zhenia on 11/02/12.
//  Copyright (c) 2012 Tulusha.com. All rights reserved.
//

#import "TPServiceItemMapper.h"

@implementation TPServiceItemMapper {
    NSMutableDictionary *_currentDictionary;
    NSMutableString *_itemText;
}
@synthesize itemsArray = _itemsArray;

- (void)dealloc {
    [_itemsArray release], _itemsArray = nil;
    [_currentDictionary release], _currentDictionary = nil;
    [_itemText release], _itemText = nil;
    [super dealloc];
}

#pragma mark - XML Parser

- (void)parser:(NSXMLParser *)parser foundCDATA:(NSData *)CDATABlock {
    if (_itemText) {
        NSString *cdataString = [[[NSString alloc] initWithData:CDATABlock
                                                       encoding:NSUTF8StringEncoding] autorelease];
        [_itemText appendString:cdataString];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (_itemText) {
        [_itemText appendString:string];
    }
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
    if ([elementName isEqualToString:@"quotes"]) {
        _itemsArray = [NSMutableArray new];
    }
    else if ([elementName isEqualToString:@"quote"]) {
        _currentDictionary = [NSMutableDictionary new];
    }
    else if (([elementName isEqualToString:@"id"])
            || ([elementName isEqualToString:@"date"])
            || ([elementName isEqualToString:@"text"])) {
        _itemText = [NSMutableString new];
    }
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    if ([elementName isEqualToString:@"quote"]) {
        [_itemsArray addObject:_currentDictionary];
        [_currentDictionary release], _currentDictionary = nil;
    }
    else if (_itemText) {
        [_currentDictionary setObject:_itemText forKey:elementName];
    }
}


@end
