//
//  UIImageView+AsyncLoader.m
//  ARC Support
//
//  Created by Truman, Christopher on 5/4/12.
//

#import "UIImageView+AsyncLoader.h"

@implementation UIImageView (AsyncLoader)

-(void)loadImageFromURL:(NSString *)url{
  UIImageFromURL( [NSURL URLWithString:url], ^(UIImage * image)
                 {
                   [self setImage:image];
                 }, ^(void){
                   NSLog (@"error! could not load url: %@", url);
                 });
}

-(void)loadImageFromURL:(NSString *)url withActivityIndicator:(BOOL)activityIndicator style:(UIActivityIndicatorViewStyle)style{
  UIActivityIndicatorView * view = nil;
  if (activityIndicator) {
    view = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:style];
    view.frame = self.frame;
    [self addSubview:view];
    [view startAnimating];
  }
  UIImageFromURL( [NSURL URLWithString:url], ^(UIImage * image)
                 {
                   [self setImage:image];
                   if (view != nil) {
                     [view stopAnimating];
                     [view removeFromSuperview];
                   }
                 }, ^(void){
                   NSLog (@"error! could not load url: %@", url);
                   if (view != nil) {
                     [view stopAnimating];
                     [view removeFromSuperview];
                   }
                 });
}

void UIImageFromURL( NSURL * URL, void (^imageBlock)(UIImage * image), void (^errorBlock)(void) )
{
  dispatch_async( dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0 ), ^(void)
                 {
                   NSData * data = [[NSData alloc] initWithContentsOfURL:URL];
                   UIImage * image = [[UIImage alloc] initWithData:data];
                   dispatch_async (dispatch_get_main_queue (), ^(void){
                     if( image != nil )
                     {
                       imageBlock (image);
                     } else {
                       errorBlock ();
                     }
                   });
                 });
}

@end
