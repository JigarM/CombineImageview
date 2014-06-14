//
//  UIImage+Prepare.h
//  SLS AMG
//
//  Created by georg on 10/05/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UIImage (Overlay)

- (UIImage*)overlayWith:(UIImage*)overlayImage;
- (UIImage*)overlayWithArtifact:(UIImage*)overlayImage;

- (UIImage*)resize:(CGSize)newSize;
- (UIImage*)mask:(UIImage*)maskImage;

@end
