//
//  LBImagePreviewCollectionCell.m
//  LBImagePreviewBrowser
//
//  Created by 李冰 on 2015/12/13.
//  Copyright © 2015年 李冰. All rights reserved.
//

#import "LBImagePreviewCollectionCell.h"
#import <Photos/Photos.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface LBImagePreviewCollectionCell()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *imageContainer;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation LBImagePreviewCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame])
    {
        [self _initializeItems];
    }
    
    return self;
}

- (void) _initializeItems {
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 0, CGRectGetWidth(self.frame) - 20, CGRectGetHeight(self.frame))];
    _scrollView.maximumZoomScale = 2.5;
    _scrollView.minimumZoomScale = 1.0;
    _scrollView.delegate = self;
    _scrollView.scrollsToTop = NO;
    _scrollView.bouncesZoom = YES;
    _scrollView.delaysContentTouches = NO;
    _scrollView.alwaysBounceVertical = NO;
    _scrollView.multipleTouchEnabled = YES;
    _scrollView.canCancelContentTouches = YES;
    _scrollView.showsVerticalScrollIndicator = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    _imageContainer = [[UIView alloc] initWithFrame:_scrollView.bounds];
    _imageContainer.contentMode = UIViewContentModeScaleAspectFit;
    
    _imageView = [[UIImageView alloc] initWithFrame:_imageContainer.bounds];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapAction:)];
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapAction:)];
    doubleTap.numberOfTapsRequired = 2;
    [singleTap requireGestureRecognizerToFail:doubleTap];
    
    [_imageContainer addGestureRecognizer:singleTap];
    [_imageContainer addGestureRecognizer:doubleTap];
    
    [self.contentView addSubview:_scrollView];
    [_scrollView addSubview:_imageContainer];
    [_imageContainer addSubview:_imageView];
}

- (void)setAsset:(id)asset {
    
    _asset = asset;
    
//    [_scrollView setZoomScale:1.0 animated:NO];
    
    if ([_asset isKindOfClass:[UIImage class]])
    {
        UIImage *image = (UIImage *)_asset;
        _imageView.image = image;
        
        CGFloat scrollWidth = CGRectGetWidth(_scrollView.frame);
        CGFloat scrollHeight = CGRectGetHeight(_scrollView.frame);
        
        CGFloat imageContainerWidth = CGRectGetWidth(_scrollView.frame);
        CGFloat imageContainerHeight = CGRectGetHeight(_scrollView.frame);
        CGFloat imageContainerX = 0;
        CGFloat imageContainerY = 0;
        
        if (image.size.width / image.size.height > scrollWidth / scrollHeight)
        {
            imageContainerHeight = imageContainerWidth * (image.size.height / image.size.width);
            imageContainerY = (scrollHeight - imageContainerHeight) / 2.0f;
        }
        else
        {
            imageContainerHeight = imageContainerWidth * (image.size.height / image.size.width);
            imageContainerY = 0;
        }
        
        _imageContainer.frame = CGRectMake(imageContainerX, imageContainerY, imageContainerWidth, imageContainerHeight);
        
        _scrollView.contentSize = _imageContainer.frame.size;
        _imageView.frame = _imageContainer.bounds;
        
        NSLog(@"%@", NSStringFromCGRect(_imageView.frame));
    }
//    PHAsset
//    ALAsset;
}

- (void)doubleTapAction:(UITapGestureRecognizer *)tap {
    
    if (_scrollView.zoomScale > 1.0)
    {
        [_scrollView setZoomScale:1.0 animated:YES];
    }
    else
    {
        CGPoint touchPoint = [tap locationInView:self.imageView];
        CGFloat scale = _scrollView.maximumZoomScale;
        CGFloat scaleWidth = self.frame.size.width / scale;
        CGFloat scaleHeight = self.frame.size.height / scale;
        [_scrollView zoomToRect:CGRectMake(touchPoint.x - scaleWidth / 2, touchPoint.y - scaleHeight / 2, scaleWidth, scaleHeight) animated:YES];
    }
}

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return _imageContainer;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    [self refreshImageContainerViewCenter];
}


- (void)singleTapAction:(UITapGestureRecognizer *)tap {
//    if (self.singleTapGestureBlock) {
//        self.singleTapGestureBlock();
//    }
}

- (void)refreshImageContainerViewCenter {
    
    CGFloat scrollWidth = CGRectGetWidth(_scrollView.frame);
    CGFloat scrollHeight = CGRectGetHeight(_scrollView.frame);
    CGFloat scrollContentWidth = _scrollView.contentSize.width;
    CGFloat scrollContentHeight = _scrollView.contentSize.height;
    
    CGFloat offsetX = (scrollWidth > scrollContentWidth) ? ((scrollWidth - scrollContentWidth) * 0.5) : 0.0;
    CGFloat offsetY = (scrollHeight > scrollContentHeight) ? ((scrollHeight - scrollContentHeight) * 0.5) : 0.0;
    
    self.imageContainer.center = CGPointMake(scrollContentWidth * 0.5 + offsetX, scrollContentHeight * 0.5 + offsetY);
}

@end
