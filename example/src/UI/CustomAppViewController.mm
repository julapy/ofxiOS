//
//  CustomAppViewController.m
//  emptyExample
//
//  Created by lukasz karluk on 8/02/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomAppViewController.h"
#import "ofxiPhoneExtras.h"

@implementation CustomAppViewController

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    BOOL bRotate = NO;
    bRotate = bRotate || ( toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft );
    bRotate = bRotate || ( toInterfaceOrientation == UIInterfaceOrientationLandscapeRight );
    bRotate = bRotate || ( toInterfaceOrientation == UIInterfaceOrientationPortrait );
    bRotate = bRotate || ( toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown );
    
    return bRotate;
}

- (void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    CGRect  screen;
    CGFloat rotate;
    CGPoint center;
    
    screen = [[ UIScreen mainScreen ] bounds ];
    center = CGPointMake( screen.size.width * 0.5, screen.size.height * 0.5 );      // default is portrait.
    if( UIInterfaceOrientationIsLandscape( toInterfaceOrientation ) )
        center = CGPointMake( screen.size.height * 0.5, screen.size.width * 0.5 );  // if landscape, flip width and height.
    
    rotate = 0;
    if( toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft )
        rotate = PI * 0.5;
    else if( toInterfaceOrientation == UIInterfaceOrientationLandscapeRight )
        rotate = -PI * 0.5;
    else if( toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown )
        rotate = -PI;
    
    [UIView beginAnimations:@"counter_orientate_glView" context:nil];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    self.glView.transform = CGAffineTransformMakeRotation( rotate );
    self.glView.center = center;
    [UIView commitAnimations];
}

@end
