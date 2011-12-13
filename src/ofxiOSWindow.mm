//
//  ofxiOSWindow.cpp
//  emptyExample
//
//  Created by lukasz karluk on 13/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ofxiOSWindow.h"
#import "ofxiPhoneExtras.h"

void ofxiOSWindow :: startAppWithDelegate ( string appDelegateClassName )
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    UIApplicationMain( nil, nil, nil, ofxStringToNSString( appDelegateClassName ) );
    [ pool release ];
}

void ofxiOSWindow :: runAppViaInfiniteLoop( ofBaseApp * appPtr )    //-- new app added, reset timer values.
{
    nFrameCount = 0;
    lastFrameTime = 0;
    fps = frameRate = 60.0f;
    timeNow = 0.0;
    timeThen = 0.0;
}

void ofxiOSWindow :: timerLoop() 
{
    ofBaseApp* appPtr = ofGetAppPtr();
    if( !appPtr )
        return;
    
    static ofEventArgs voidEventArgs;
    
    appPtr->update();
    
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
    
    appPtr->draw();
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
