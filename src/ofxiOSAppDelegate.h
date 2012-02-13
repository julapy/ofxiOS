//
//  ofxiOSAppDelegate.h
//  emptyExample
//
//  Created by lukasz karluk on 13/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ofxiPhoneAppDelegate.h"
#import "ofxiOSViewController.h"

@interface ofxiOSAppDelegate : ofxiPhoneAppDelegate <UIAlertViewDelegate>

@property (nonatomic, retain) UIWindow              *window;
@property (nonatomic, retain) UIWindow              *externalWindow;
@property (nonatomic, retain) ofxiOSViewController  *glViewController;

- (EAGLView*) getGLView;
- (void) lockGL;
- (void) unlockGL;
- (void) setFrameRate : (float)frameRate;

@end
