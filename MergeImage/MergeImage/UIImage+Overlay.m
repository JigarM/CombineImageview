//
//  UIImage+Prepare.m
//  SLS AMG
//
//  Created by georg on 10/05/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "UIImage+Overlay.h"


@implementation UIImage (Overlay)


- (UIImage*)overlayWith:(UIImage*)overlayImage {
	
	UIGraphicsBeginImageContext(self.size);

	[self drawAtPoint:CGPointZero];
	
	CGRect imageRect = CGRectMake(0, 0, self.size.width, self.size.height);
	[overlayImage drawInRect:imageRect blendMode:kCGBlendModeNormal alpha:0.9999999];

	UIImage *combinedImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return combinedImage;
}


- (UIImage*)overlayWithArtifact:(UIImage*)overlayImage {
	
	UIGraphicsBeginImageContext(self.size);
	
	[self drawAtPoint:CGPointZero];
	
	CGRect imageRect = CGRectMake(0, 0, self.size.width, self.size.height);
	[overlayImage drawInRect:imageRect blendMode:kCGBlendModeNormal alpha:1.0];
	
	UIImage *combinedImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return combinedImage;
}




- (UIImage*)resize:(CGSize)newSize {
	
	UIGraphicsBeginImageContext(newSize);
	
	[self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
	
	UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
	
	UIGraphicsEndImageContext();
	
	
	return scaledImage;
}


- (UIImage*)mask:(UIImage*)maskImage {
	
	CGImageRef maskRef = maskImage.CGImage;
	
	CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskRef),
										CGImageGetHeight(maskRef),
										CGImageGetBitsPerComponent(maskRef),
										CGImageGetBitsPerPixel(maskRef),
										CGImageGetBytesPerRow(maskRef),
										CGImageGetDataProvider(maskRef), NULL, false);

	CGImageRef masked = CGImageCreateWithMask(self.CGImage, mask);

	UIImage *returnImage = [UIImage imageWithCGImage:masked];
	
	CGImageRelease(mask);
	CGImageRelease(masked);
	
	return returnImage;
	
}



@end
