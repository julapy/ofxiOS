//
//  EAGLViewController.h
//  emptyExample
//
//  Created by lukasz karluk on 12/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EAGLView.h"

@interface ofxiOSViewController : UIViewController
{
    //
}

@property (nonatomic, retain) EAGLView* glView;
@property (nonatomic, retain) NSLock*   glLock;
@property (nonatomic, retain) NSTimer*  animTimer;
@property (nonatomic, assign) float		animFrameInterval;
@property (nonatomic, assign) BOOL		animating;
@property (nonatomic, assign) BOOL		displayLinkSupported;
@property (nonatomic, assign) id		displayLink;


- (id) initWithFrame : (CGRect) frame 
                 app : (ofBaseApp*) app;

- (void) lockGL;
- (void) unlockGL;

- (void) stopAnimation;
- (void) startAnimation;

- (void) setAnimationFrameInterval:(float)frameInterval;
- (void) setFrameRate:(float)frameRate;

@end
