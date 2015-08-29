//
//  LGRelativePostionHelper.h
//  laiguo-ll-ios-therapist
//
//  Created by ZS on 15/8/21.
//  Copyright (c) 2015年 laiguo. All rights reserved.
//
//


//
//
//     这个宏目的是直接将设计稿上的位置，大小传进来，返回设备对应的位置和大小，不需要做相应的换算
//
//
//

#ifndef laiguo_ll_ios_therapist_LGRelativePostionHelper_h
#define laiguo_ll_ios_therapist_LGRelativePostionHelper_h
//设计稿上的标准尺寸
#define DesignX (750)
#define DesignY (1134)

//像素/点的数值
#define PixelToPoint (1.0/2.0)

/**
 *  Relative-X 将设计稿上的位置X传进来 ，换算设备上的真实位置X
 *
 *  @param X 设计稿上的位置X
 *
 *  @return 真实的位置X
 */
#define RELATIVE_X(X)   ((X)*CGRectGetWidth([UIScreen mainScreen].bounds)/PixelToPoint)/(DesignX)*PixelToPoint

/**
 *  Relative-Y 将设计稿上的位置Y传进来 ，换算设备上的真实位置Y
 *
 *  @param Y 设计稿上的位置Y
 *
 *  @return 真实的位置Y
 */
#define RELATIVE_Y(Y)   (Y)*PixelToPoint
/**
 *  Relative-Width 将设计稿上的宽度传进来 ，换算设备上的真实宽度
 *
 *  @param Width 设计稿上的宽度
 *
 *  @return 真实的宽度
 */
#define RELATIVE_WIDTH(Width)  (Width)*PixelToPoint
/**
 *  Relative-Height  将设计稿上的高度传进来 ，换算设备上的真实高度
 *
 *  @param Height 设计稿上的高度
 *
 *  @return 真实的高度
 */
#define RELATIVE_HEIGHT(Height)  (Height)*PixelToPoint
#endif
