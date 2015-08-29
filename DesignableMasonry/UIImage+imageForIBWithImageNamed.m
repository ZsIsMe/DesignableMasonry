//
//  UIImageView+zsImageNamed.m
//  
//
//  Created by 136 on 15/8/21.
//
//

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
