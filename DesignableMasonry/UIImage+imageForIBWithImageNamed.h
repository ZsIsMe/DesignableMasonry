//
//  UIImageView+zsImageNamed.h
//  
//
//  Created by 136 on 15/8/21.
//
//

#import <UIKit/UIKit.h>
/**
 *  UIimage的扩展，为在使用 IB_DESIGNABLE 的时候可以在IB上看到图片，需要把IB_DESIGNABLE所在类当参数传给NSBundle
 *  不能简单使用[UIImage imageWithNamed]来给图片赋值，因为在IB渲染和运行时的NSBundle是不一样的，
 
     NSBundle *bundle;
     bundle= [NSBundle bundleForClass: [YouView class]];//YouView指的是对应视图的类名
     UIImage *image = [UIImage imageNamed:imageNamed inBundle:bundle compatibleWithTraitCollection:nil];使用图片，
    这里，我写了一个扩展，
 
 
 #import "UIImage+imageForIBWithImageNamed.h"
 
 @implementation UIImage (imageForIBWithImageNamed)
 +(UIImage*)imageForIBWithImageNamed:(NSString*)imageNamed classForBundle:(Class)clas
 {
 NSBundle *bundle;
 #if TARGET_INTERFACE_BUILDER
 bundle= [NSBundle bundleForClass: clas];
 #else
 bundle= [NSBundle mainBundle];
 #endif
 return   [UIImage imageNamed:imageNamed inBundle:bundle compatibleWithTraitCollection:nil];
 }
 @end
   使用方法：
   imageView.image = [UIImage imageForIBWithImageNamed:@"bg_transparent_gallerynormal" classForBundle:[self class]];
   这样就在IB和运行时就会使用不同的bundle，不用图片的问题就解决了
 */
@interface UIImage (imageForIBWithImageNamed)
+(UIImage*)imageForIBWithImageNamed:(NSString*)imageNamed classForBundle:(Class)clas;
@end
