//
//  TPServiceAPIClient.h
//  TestProject
//
//  Created by Zhenia on 11/02/12.
//  Copyright (c) 2012 Tulusha.com. All rights reserved.
//


#import "AFHTTPClient.h"
#import "TPNetworkingDefines.h"

@interface TPServiceAPIClient : AFHTTPClient

+ (TPServiceAPIClient *)sharedClient;


@end
