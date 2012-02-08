//
//  CustomAppViewController.m
//  emptyExample
//
//  Created by lukasz karluk on 8/02/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "TriangleAppViewController.h"
#import "ofxiPhoneExtras.h"

@implementation TriangleAppViewController

- (id) initWithFrame : (CGRect)frame app:(ofBaseApp*)app
{
    ofxiPhoneGetOFWindow()->setOrientation( OF_ORIENTATION_90_RIGHT );   //-- load app in landscape mode.
    
    self = [ super initWithFrame:frame app:app ];
    
    return self;
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    BOOL bRotate = NO;
    bRotate = bRotate || ( toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft );
    bRotate = bRotate || ( toInterfaceOrientation == UIInterfaceOrientationLandscapeRight );
    
    return bRotate;
}

- (void) willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    CGRect  screen;
    CGFloat rotate;
    CGPoint center;
    
    screen = [[ UIScreen mainScreen ] bounds ];
    center = CGPointMake( screen.size.height * 0.5, screen.size.width * 0.5 );
    rotate = PI * 0.5;
    
    [UIView beginAnimations:@"counter_orientate_glView" context:nil];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    self.glView.transform = CGAffineTransformMakeRotation( rotate );
    self.glView.center = center;
    [UIView commitAnimations];
}

@end
