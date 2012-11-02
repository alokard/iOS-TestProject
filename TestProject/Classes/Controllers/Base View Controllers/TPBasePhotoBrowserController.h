//
//  TPBasePhotoBrowserController.h
//  TestProject
//
//  Created by Zhenia on 11/01/12.
//  Copyright (c) 2012 Tulusha.com. All rights reserved.
//

#import "MWPhotoBrowser.h"

@class TPBasePhotoBrowserController;
@protocol TPBasePhotoBrowserDelegate <NSObject>

- (NSUInteger)numberOfPhotosInPhotoBrowser:(TPBasePhotoBrowserController *)photoBrowser;
- (id<MWPhoto>)photoBrowser:(TPBasePhotoBrowserController *)photoBrowser photoAtIndex:(NSUInteger)index;
@optional
- (void)currentPageUpdatedInPhotoBrowser:(TPBasePhotoBrowserController *)photoBrowser;

@end

@interface TPBasePhotoBrowserController : UIViewController <UIScrollViewDelegate, UIActionSheetDelegate, MFMailComposeViewControllerDelegate>

- (id)initWithDelegate:(id <TPBasePhotoBrowserDelegate>)delegate;

- (void)reloadData;

// Navigation
- (void)showPreviousPage;
- (void)showNextPage;
- (NSInteger)currentPageIndex;


@end
