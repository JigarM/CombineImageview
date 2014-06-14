//
//  ViewController.m
//  MergeImage
//
//  Created by Mobmaxime on 09/06/14.
//  Copyright (c) 2014 jigar. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Overlay.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize theImageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.theImageView.image = [self mergingImage];
}

-(UIImage *)mergingImage {
    //UIImage *pubImage = [UIImage imageNamed:@"ProfileBackground.png"];
    //UIImage *textWithPublicImage = [pubImage overlayWith:[UIImage imageNamed:@"profile_text_bg.png"]];
    
    UIImage *background = [UIImage imageNamed:@"background.png"];
    UIImage *audiImage = [UIImage imageNamed:@"audi.png"];
    UIImage *combineImage = [background overlayWith:audiImage];
    
    return combineImage;
}

@end
