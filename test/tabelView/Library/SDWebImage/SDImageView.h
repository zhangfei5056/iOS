//
//  SDImageView.h
//  BanmaUtilityPro
//
//  Created by Yan FENG on 10/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDWebImageManagerDelegate.h"
#import "SDWebImageManager.h"

@class SDImageView;

@protocol SDImageViewDelegate <NSObject>

@optional
- (void)sdImageViewdidFinishLoad:(SDImageView *)imageView;
- (void)sdImageView:(SDImageView *)imageView didFailWithError:(NSError *)error;
@end

@interface SDImageView : UIImageView <SDWebImageManagerDelegate>{
    
    id <SDImageViewDelegate> _delegate;
    NSString                 *_urlPath;
    
}
- (void)setImageWithURL:(NSURL *)url;
- (void)setImageWithURL:(NSURL *)url delegate:(id)delegate;
- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;
- (void)setImageWithURL:(NSURL *)url animation:(BOOL)animationIndicator;
- (void)setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder animation:(BOOL)animationIndicator delegate:(id)delegate;
- (void)cancelCurrentImageLoad;
/*
 * 清除当前delegate,image和urlPath
 */
- (void)resetImage;

@property (nonatomic,assign) id<SDImageViewDelegate> delegate;
@property (nonatomic,retain) NSString                *urlPath;
@end
