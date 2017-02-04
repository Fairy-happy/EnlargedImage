//
//  EnlargedImage.h
//  test
//
//  Created by test on 2017/2/4.
//  Copyright © 2017年 test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EnlargedImage : NSObject

/**
 @param oldImageview 原图片
 @param uesTime 放大缩小时间
 */
+ (void)enlargedImage:(UIImageView*)oldImageview enlargedTime:(CGFloat)uesTime;

@end
