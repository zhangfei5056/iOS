//
//  SDImageView.m
//  BanmaUtilityPro
//
//  Created by Yan FENG on 10/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "SDImageView.h"

#define kTagMKImageViewIndicator  100

@implementation SDImageView
@synthesize delegate = _delegate;
@synthesize urlPath = _urlPath;

- (void)dealloc {
    _delegate = nil;
    [_urlPath release];
    
    [super dealloc];
}

- (void)setImageWithURL:(NSURL *)url
{
    [self setImageWithURL:url placeholderImage:nil];
}

- (void)setImageWithURL:(NSURL *)url delegate:(id)delegate
{
    [self setImageWithURL:url placeholderImage:nil animation:NO delegate:delegate];
}

- (void)setImageWithURL:(NSURL *)url animation:(BOOL)animationIndicator
{
    [self setImageWithURL:url placeholderImage:nil animation:animationIndicator delegate:nil];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder
{
    [self setImageWithURL:url placeholderImage:placeholder animation:NO delegate:nil];
}

- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder animation:(BOOL)animationIndicator delegate:(id)delegate
{
    //同一url的图片正在下载或者已经下载完毕，则不再下载
    if (self.urlPath && [self.urlPath isEqualToString:[url absoluteString]]) {
        return;
    }
    
    if ([url absoluteString]) {
        self.urlPath = [NSString stringWithString:[url absoluteString]];
    }
    
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    
    // Remove in progress downloader from queue
    [manager cancelForDelegate:self];
    
    self.image = placeholder;
    
    if (!url) {
        return;
    }
    
    UIActivityIndicatorView *view = (UIActivityIndicatorView *)[self viewWithTag:kTagMKImageViewIndicator];
    if (view) {
        [view stopAnimating];
        [view removeFromSuperview];
    }
    
    if (animationIndicator)
    {
        UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:
                                              UIActivityIndicatorViewStyleGray];
        indicator.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleBottomMargin;
        indicator.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        indicator.tag = kTagMKImageViewIndicator;
        [indicator startAnimating];
        [self addSubview:indicator];
        [indicator release];
    }
    
    [manager downloadWithURL:url delegate:self];
    
    _delegate = delegate;
}

- (void)cancelCurrentImageLoad
{
    [[SDWebImageManager sharedManager] cancelForDelegate:self];
}

#pragma mark SDWebImageManagerDelegate

- (void)webImageManager:(SDWebImageManager *)imageManager didFinishWithImage:(UIImage *)image
{
    self.image = image;
    
    UIActivityIndicatorView *indicatorView = (UIActivityIndicatorView *)[self viewWithTag:kTagMKImageViewIndicator];
    if (indicatorView)
    {
        [indicatorView stopAnimating];
        [indicatorView removeFromSuperview];
    }
    self.urlPath = nil;
    
    if ([_delegate respondsToSelector: @selector(sdImageViewdidFinishLoad:)])
    {
        [_delegate performSelector:@selector(sdImageViewdidFinishLoad:) withObject:self];
    }
}

- (void)webImageManager:(SDWebImageManager *)imageManager didFailWithError:(NSError *)error
{
    UIActivityIndicatorView *indicatorView = (UIActivityIndicatorView *)[self viewWithTag:kTagMKImageViewIndicator];
    if (indicatorView)
    {
        [indicatorView stopAnimating];
        [indicatorView removeFromSuperview];
    }
    
    if ([_delegate respondsToSelector: @selector(sdImageView:didFailWithError:)])
    {
        [_delegate performSelector:@selector(sdImageView:didFailWithError:) withObject:self withObject:error];
    }
}

- (void)resetImage {
    _delegate = nil;
    self.image = nil;
    self.urlPath = nil;
}

@end
