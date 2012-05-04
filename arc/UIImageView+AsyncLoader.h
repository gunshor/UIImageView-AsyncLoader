//
//  UIImageView+AsyncLoader.h
//  ARC Support
//
//  Created by Truman, Christopher on 5/4/12.
//

#import <UIKit/UIKit.h>

@interface UIImageView (AsyncLoader)

-(void)loadImageFromURL:(NSString *)url withActivityIndicator:(BOOL)activityIndicator style:(UIActivityIndicatorViewStyle)style;
-(void)loadImageFromURL:(NSString*)url;

@end
