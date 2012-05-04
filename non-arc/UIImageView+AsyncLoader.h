//
//  UIImageView+AsyncLoader.h
//  Pre-ARC Support
//
//  Created by Truman, Christopher on 5/4/12.
//

#import <UIKit/UIKit.h>

@interface UIImageView (AsyncLoader)

-(void)loadImageFromURL:(NSString*)url;
-(void)loadImageFromURL:(NSString *)url withActivityIndicator:(BOOL)activityIndicator style:(UIActivityIndicatorViewStyle)style;

@end
