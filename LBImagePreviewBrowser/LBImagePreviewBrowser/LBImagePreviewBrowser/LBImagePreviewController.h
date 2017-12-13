//
//  LBImagePreviewController.h
//  LBImagePreviewBrowser
//
//  Created by 李冰 on 2015/12/13.
//  Copyright © 2015年 李冰. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LBImagePreviewController : UIViewController

/**
 *  The array of assets.
 */
@property (nonatomic, copy, nullable) NSArray *assetsArray;

/**
 Create a new instance with the specified asset array.

 @param assetsArray The array of assets, It may be PHAsset, ALAsset, NSURL, UIImage, a combination of one or more of them.
 @return A new view controller object.
 */
- (instancetype) initWithAssetArray:(nullable NSArray *) assetsArray;


// called when an image will be displayed
- (void) willDisplayImage:(nullable UIImage *) image asset:(id) asset forItemAtIndex:(NSUInteger) index;

//- (void) displayImage:(nullable UIImage *) image asset:(id) asset forItemAtIndex:(NSUInteger) index;

// called when the user taps on an item
- (void) didClickImage:(nullable UIImage *) image asset:(id) asset forItemAtIndex:(NSUInteger) index;
// called when the user press an item long time
- (void) didLongPressImage:(nullable UIImage *) image asset:(id) asset forItemAtIndex:(NSUInteger) index;

@end

NS_ASSUME_NONNULL_END
