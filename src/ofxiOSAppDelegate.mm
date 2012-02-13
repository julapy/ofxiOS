//
//  ofxiOSAppDelegate.m
//  emptyExample
//
//  Created by lukasz karluk on 13/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ofxiOSAppDelegate.h"
#import "ofMain.h"
#import "ofxiPhone.h"
#import "ofxiPhoneExtras.h"

@implementation ofxiOSAppDelegate

@synthesize window;
@synthesize externalWindow;
@synthesize glViewController;

-(void) applicationDidFinishLaunching:(UIApplication *)application 
{    
	self.window = [ [ [ UIWindow alloc ] initWithFrame: [ [ UIScreen mainScreen ] bounds ] ] autorelease ];
	[ self.window makeKeyAndVisible ];
    
    self.externalWindow = [ [ [ UIWindow alloc ] initWithFrame: CGRectMake( 0, 0, 1024, 768 ) ] autorelease ];
    self.externalWindow.hidden = YES;
    
	if( [ [ UIScreen screens ] count ] > 1 )    // Check for external screen.
    {
        UIScreen *externalScreen;
		externalScreen = [ [ UIScreen screens ] objectAtIndex : 1 ];
		
		UIAlertView *alert = [[[UIAlertView alloc] initWithTitle : @"External Display Size" 
														 message : @"Choose a size for the external display." 
														delegate : self 
											   cancelButtonTitle : nil 
											   otherButtonTitles : nil] autorelease];

		for( UIScreenMode *mode in externalScreen.availableModes )
        {
			CGSize modeScreenSize = mode.size;
			[alert addButtonWithTitle:[NSString stringWithFormat:@"%.0f x %.0f pixels", modeScreenSize.width, modeScreenSize.height]];
		}
        
		[ alert show ];
	} 
    else 
    {
		self.externalWindow = nil;
	}
	
	//----- DAMIAN
	// set data path root for ofToDataPath()
	// path on iPhone will be ~/Applications/{application GUID}/openFrameworks.app/data
	// get the resource path for the bundle (ie '~/Applications/{application GUID}/openFrameworks.app')
	NSString *bundle_path_ns = [[NSBundle mainBundle] resourcePath];
	// convert to UTF8 STL string
	string path = [bundle_path_ns UTF8String];
	// append data
	//path.append( "/data/" ); // ZACH
	path.append( "/" ); // ZACH
	ofLog(OF_LOG_VERBOSE, "setting data path root to " + path);
	ofSetDataPathRoot( path );
	//-----
	
	iPhoneSetOrientation(OFXIPHONE_ORIENTATION_PORTRAIT);
	
	// show or hide status bar depending on OF_WINDOW or OF_FULLSCREEN
	[[UIApplication sharedApplication] setStatusBarHidden:(iPhoneGetOFWindow()->windowMode == OF_FULLSCREEN) animated:YES];
	
    // Listen to did rotate event
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver: self 
                                             selector: @selector(receivedRotate:) 
                                                 name: UIDeviceOrientationDidChangeNotification 
                                               object: nil];  
}

-(void) dealloc 
{
    self.window = nil;
    self.externalWindow = nil;
    
    [ super dealloc ];
}

-(void) applicationWillResignActive:(UIApplication *)application 
{
	ofxiPhoneAlerts.lostFocus();
}

-(void) applicationDidBecomeActive:(UIApplication *)application 
{
	ofxiPhoneAlerts.gotFocus();
}

-(void) applicationWillTerminate:(UIApplication *)application 
{
    [[NSNotificationCenter defaultCenter] removeObserver: self];
    [[UIDevice currentDevice] endGeneratingDeviceOrientationNotifications];
}

-(void) applicationDidReceiveMemoryWarning:(UIApplication *)application 
{
	ofxiPhoneAlerts.gotMemoryWarning();
}

////////////////////////////////////////////////////////
//  OVERRIDING BASE CLASS METHOD.
////////////////////////////////////////////////////////

- (void) setFrameRate : (float)frameRate 
{
    [ glViewController setFrameRate: frameRate ];
}

- (EAGLView*) getGLView 
{ 
    return glViewController.glView;
}

- (void) lockGL 
{
    [ glViewController lockGL ];
}

- (void) unlockGL 
{
    [ glViewController unlockGL ];
}

////////////////////////////////////////////////////////
//  OVERRIDING BASE CLASS METHOD.
////////////////////////////////////////////////////////

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIScreen *externalScreen;
    externalScreen = [ [ UIScreen screens ] objectAtIndex : 1 ];
    
    UIScreenMode *screenMode;
    screenMode = [ externalScreen.availableModes objectAtIndex: buttonIndex ];;
    externalScreen.currentMode = screenMode;
    
	self.externalWindow.screen = externalScreen;
	
	CGRect rect = CGRectZero;
	rect.size = screenMode.size;
	self.externalWindow.frame = rect;
	self.externalWindow.clipsToBounds = YES;
	
	self.externalWindow.hidden = NO;
	[ self.externalWindow makeKeyAndVisible ];
}

@end
