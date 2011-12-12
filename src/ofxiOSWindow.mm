/***********************************************************************
 
 Copyright (c) 2008, 2009, Memo Akten, www.memo.tv
 *** The Mega Super Awesome Visuals Company ***
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *     * Neither the name of MSA Visuals nor the names of its contributors 
 *       may be used to endorse or promote products derived from this software
 *       without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, 
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS 
 * OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE 
 * OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE. 
 *
 * ***********************************************************************/ 


#import "ofMain.h"

#import "ofxiOSWindow.h"
#import "ofxiPhoneExtras.h"



// use for checking if stuff has been initialized
#define NOT_INITIALIZED			-1000000

static ofxiOSWindow *_instance = NULL;

ofxiOSWindow* ofxiOSWindow::getInstance() {
	return _instance;
}


/******** Constructor ************/

ofxiOSWindow::ofxiOSWindow() {
	ofLog(OF_LOG_VERBOSE, "ofAppiPhoneWindow::ofAppiPhoneWindow()");
	if(_instance == NULL) _instance = this;
	else ofLog(OF_LOG_ERROR, "Instanciating ofAppiPhoneWindow more than once! how come?");
	nFrameCount = 0;
	lastFrameTime = 0;
	fps = frameRate = 60.0f;
	timeNow = 0.0;
	timeThen = 0.0;
	bEnableSetupScreen = true;
	
	windowPos.set(NOT_INITIALIZED, NOT_INITIALIZED);
	windowSize.set(NOT_INITIALIZED, NOT_INITIALIZED);
	screenSize.set(NOT_INITIALIZED, NOT_INITIALIZED);
	
	depthEnabled=false;
	antiAliasingEnabled=false;
	retinaEnabled=false;
}

/******** Initialization methods ************/

void ofxiOSWindow::setupOpenGL(int w, int h, int screenMode) {
	ofLog(OF_LOG_VERBOSE, "ofAppiPhoneWindow::setupOpenGL()");
	
	windowMode = screenMode;	// use this as flag for displaying status bar or not

	ofDisableTextureEdgeHack();
	
	
	// w & h are ignored, currently Apple don't allow windows which aren't fullscreen
	// DO NOTHING ELSE, opengl will be setup by the app which creates an opengl view
}


void ofxiOSWindow::initializeWindow() {
	ofLog(OF_LOG_VERBOSE, "ofAppiPhoneWindow::initializeWindow()");
	// DO NOTHING, window will be created when the app is launched
}


void  ofxiOSWindow::runAppViaInfiniteLoop(ofBaseApp * appPtr) {
	ofLog(OF_LOG_VERBOSE, "ofAppiPhoneWindow::runAppViaInfiniteLoop()");
	
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	UIApplicationMain(nil, nil, nil, @"ofxiPhoneAppDelegate");		// this will run the infinite loop checking all events
	[pool release];	
}

/******** Get Window/Screen properties ************/

// return cached pos, read if nessecary
ofPoint	ofxiOSWindow::getWindowPosition() {
	if(windowPos.x == NOT_INITIALIZED) {
		CGPoint p = [[[UIApplication sharedApplication] keyWindow] bounds].origin;
		windowPos.set(p.x, p.y, 0);
	}
	return windowPos;
}


// return cached size, read if nessecary
ofPoint	ofxiOSWindow::getWindowSize() {
	if(windowSize.x == NOT_INITIALIZED) {
		CGSize s = [[[UIApplication sharedApplication] keyWindow] bounds].size;
		windowSize.set(s.width, s.height, 0);

		if(retinaEnabled)
			if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
				windowSize*=[[UIScreen mainScreen] scale];
	}

	return windowSize;
}


// return cached size, read if nessecary
ofPoint	ofxiOSWindow::getScreenSize() {
	if(screenSize.x == NOT_INITIALIZED) {
		CGSize s = [[UIScreen mainScreen] bounds].size;
		screenSize.set(s.width, s.height, 0);
		
		if(retinaEnabled)
			if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
				screenSize*=[[UIScreen mainScreen] scale];
	}
	return screenSize;
}

int ofxiOSWindow::getWidth(){
	if( orientation == OF_ORIENTATION_DEFAULT || orientation == OF_ORIENTATION_180 ){
		return (int)getScreenSize().x;
	}
	
	return (int)getScreenSize().y;
}

int ofxiOSWindow::getHeight(){
	if( orientation == OF_ORIENTATION_DEFAULT || orientation == OF_ORIENTATION_180 ){
		return (int)getScreenSize().y;
	}
	
	return (int)getScreenSize().x;
}

int	ofxiOSWindow::getWindowMode() {
	return windowMode;
}

float ofxiOSWindow::getFrameRate() {
	return frameRate;
}

/******** Other stuff ************/
void ofxiOSWindow::setFrameRate(float targetRate) {
	[ofxiPhoneGetAppDelegate() setFrameRate:targetRate];
}

int	ofxiOSWindow::getFrameNum() {
	return nFrameCount;
}

double ofxiOSWindow::getLastFrameTime() {
	return lastFrameTime;
}

void ofxiOSWindow::setWindowTitle(string title) {
}


void ofxiOSWindow::setFullscreen(bool fullscreen) {
	[[UIApplication sharedApplication] setStatusBarHidden:fullscreen animated:YES];
	
	if(fullscreen) windowMode		= OF_FULLSCREEN;
	else windowMode					= OF_WINDOW;
}

void ofxiOSWindow::toggleFullscreen() {
	if(windowMode == OF_FULLSCREEN) setFullscreen(false);
	else setFullscreen(true);
}


void ofxiOSWindow::enableSetupScreen(){
	bEnableSetupScreen = true;
};

void ofxiOSWindow::disableSetupScreen(){
	bEnableSetupScreen = false;
};

void ofxiOSWindow::setOrientation(ofOrientation orientation) {

	ofLog(OF_LOG_VERBOSE, "ofAppiPhoneWindow::setOrientation: " + ofToString(orientation));
	switch (orientation) {
		case OF_ORIENTATION_DEFAULT:
			[[UIApplication sharedApplication] setStatusBarOrientation: UIInterfaceOrientationPortrait];
			break;
		case OF_ORIENTATION_180:
			[[UIApplication sharedApplication] setStatusBarOrientation: UIInterfaceOrientationPortraitUpsideDown];
			break;
		case OF_ORIENTATION_90_RIGHT:
			[[UIApplication sharedApplication] setStatusBarOrientation: UIInterfaceOrientationLandscapeLeft];
			break;
		case OF_ORIENTATION_90_LEFT:
			[[UIApplication sharedApplication] setStatusBarOrientation: UIInterfaceOrientationLandscapeRight];			break;
			
		default:
			break;
	}
	
	this->orientation = orientation;
	windowSize.x = NOT_INITIALIZED;
	screenSize.x = NOT_INITIALIZED;
	getScreenSize();
	getWindowSize();
}


ofOrientation ofxiOSWindow::getOrientation() {
	return orientation;
}

void ofxiOSWindow::rotateXY(float &x, float &y) {
	float savedX;
	switch(orientation) {
		case OFXIPHONE_ORIENTATION_UPSIDEDOWN:
			x = getWidth() - x;
			y = getHeight() - y;
			break;
			
		case OFXIPHONE_ORIENTATION_LANDSCAPE_LEFT:
			savedX = x;
			x = y;
			y = getHeight() - savedX;
			break;
			
		case OFXIPHONE_ORIENTATION_LANDSCAPE_RIGHT:
			savedX = x;
			x = getWidth() - y;
			y = savedX;
			break;
			
		case OFXIPHONE_ORIENTATION_PORTRAIT:
		default:
			break;
			
	}
}

void ofxiOSWindow::enableRetinaSupport()
{
	retinaEnabled = true;
}

void ofxiOSWindow::enableDepthBuffer()
{
	depthEnabled = true;
}

void ofxiOSWindow::enableAntiAliasing(int samples)
{
	antiAliasingEnabled = true;
	antiAliasingSamples = samples;
}

bool ofxiOSWindow::isDepthEnabled()
{
	return depthEnabled;
}

bool ofxiOSWindow::isAntiAliasingEnabled()
{
	return antiAliasingEnabled;
}

int ofxiOSWindow::getAntiAliasingSampleCount()
{
	return antiAliasingSamples;
}

bool ofxiOSWindow::isRetinaSupported()
{
	return retinaEnabled;
}

void ofxiOSWindow::timerLoop() {
	static ofEventArgs voidEventArgs;
	
	ofGetAppPtr()->update();
		
	#ifdef OF_USING_POCO
		ofNotifyEvent( ofEvents.update, voidEventArgs);
	#endif
	
	[ofxiPhoneGetAppDelegate() lockGL];

	[ofxiPhoneGetGLView() startRender];

	//we do this as ofGetWidth() now accounts for rotation 
	//so we just make our viewport across the whole screen
	glViewport( 0, 0, getScreenSize().x, getScreenSize().y );

	float * bgPtr = ofBgColorPtr();
	bool bClearAuto = ofbClearBg();
	if ( bClearAuto == true){
		glClearColor(bgPtr[0],bgPtr[1],bgPtr[2], bgPtr[3]);
		glClear( GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	}
	
	if(bEnableSetupScreen) {
		ofSetupScreen();
	}
	
	ofGetAppPtr()->draw();
	#ifdef OF_USING_POCO
		ofNotifyEvent( ofEvents.draw, voidEventArgs );
	#endif
	
	[ofxiPhoneGetGLView() finishRender];
	
	[ofxiPhoneGetAppDelegate() unlockGL];

	
	
	
	timeNow = ofGetElapsedTimef();
	double diff = timeNow-timeThen;
	if( diff  > 0.00001 ){
		fps			= 1.0 / diff;
		frameRate	*= 0.9f;
		frameRate	+= 0.1f*fps;
	 }
	 lastFrameTime	= diff;
	 timeThen		= timeNow;
  	// --------------
	
	nFrameCount++;		// increase the overall frame count
}
