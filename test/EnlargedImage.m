//
//  EnlargedImage.m
//  test
//
//  Created by test on 2017/2/4.
//  Copyright © 2017年 test. All rights reserved.
//

#import "EnlargedImage.h"

@implementation EnlargedImage

static CGRect oldRect;
static id tempImageView;
static CGFloat enlargedTime;

+ (void)enlargedImage:(UIImageView*)oldImageview enlargedTime:(CGFloat)uesTime{
    oldImageview.alpha = 0;
    enlargedTime = uesTime;
    tempImageView = oldImageview;
    
    UIImage *image = oldImageview.image;
    CGRect rect = [UIScreen mainScreen].bounds;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    oldRect= [oldImageview convertRect:oldImageview.bounds toView:window];
    
    UIView *backView = [[UIView alloc]initWithFrame:window.bounds];
    backView.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:0.5];
    backView.alpha=1;
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:oldRect];
    imageView.image = image;
    imageView.tag = 1;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    [backView addSubview:imageView];
    [window addSubview:backView];
    
    float scaleHeight = rect.size.width/oldImageview.image.size.width * oldImageview.image.size.height;
    
    [UIView animateWithDuration:enlargedTime animations:^(){
        imageView.frame = CGRectMake(0, (rect.size.height - scaleHeight)/2 ,rect.size.width,scaleHeight);
        backView.alpha = 1;
    } completion:^(BOOL flished){
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideImage:)];
        [backView addGestureRecognizer: tap];
    }];
}

+ (void)hideImage:(UITapGestureRecognizer*)sender{
    UIView *backgroundView=sender.view;
    backgroundView.userInteractionEnabled = NO;
    UIImageView *imageView=(UIImageView*)[backgroundView viewWithTag:1];
    UIImageView *oldImage = tempImageView;
    
    [UIView animateWithDuration:enlargedTime animations:^(){
        imageView.frame = oldRect;
    } completion:^(BOOL finished){
        [backgroundView removeGestureRecognizer:backgroundView.gestureRecognizers[0]];
        oldImage.alpha = 1;
        [backgroundView removeFromSuperview];
    }];
}

@end
