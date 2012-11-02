//
//  TPServiceAPIClient.m
//  TestProject
//
//  Created by Zhenia on 11/02/12.
//  Copyright (c) 2012 Tulusha.com. All rights reserved.
//

#import "TPServiceAPIClient.h"
#import "AFXMLRequestOperation.h"


@implementation TPServiceAPIClient

+ (TPServiceAPIClient *)sharedClient {
    static TPServiceAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[TPServiceAPIClient alloc] initWithBaseURL:[NSURL URLWithString:kBaseURLString]];
    });

    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }

    [self registerHTTPOperationClass:[AFXMLRequestOperation class]];

    [self setDefaultHeader:@"Accept" value:@"application/xml"];

    return self;
}

@end
