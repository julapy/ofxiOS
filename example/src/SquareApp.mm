#include "SquareApp.h"

SquareApp :: SquareApp ()
{
    cout << "creating SquareApp" << endl;
}

SquareApp :: ~SquareApp ()
{
    cout << "destroying SquareApp" << endl;
}

//--------------------------------------------------------------
void SquareApp::setup(){	
	// register touch events
	ofRegisterTouchEvents(this);
	
	// initialize the accelerometer
	ofxAccelerometer.setup();
	
	//iPhoneAlerts will be sent to this.
	ofxiPhoneAlerts.addListener(this);
	
	//If you want a landscape oreintation 
	//iPhoneSetOrientation(OFXIPHONE_ORIENTATION_LANDSCAPE_RIGHT);
	
	ofBackground(127,127,127);
}

//--------------------------------------------------------------
void SquareApp::update(){

}

//--------------------------------------------------------------
void SquareApp::draw()
{
    ofEnableAlphaBlending();
    
    int w = 200;
    int h = 200;
    int x = ( ofGetWidth()  - w ) * 0.5;
    int y = ( ofGetHeight() - h ) * 0.5;
    
	ofSetColor( ofColor :: red );
    ofRect( x, y, w, h );
    
    x = 20;
    y = 0;
    
    ofSetColor( ofColor :: white );
    ofDrawBitmapString( "frame num      = " + ofToString( ofGetFrameNum() ),    x, y+=20 );
    ofDrawBitmapString( "frame rate     = " + ofToString( ofGetFrameRate() ),   x, y+=20 );
    ofDrawBitmapString( "screen width   = " + ofToString( ofGetWidth() ),       x, y+=20 );
    ofDrawBitmapString( "screen height  = " + ofToString( ofGetHeight() ),      x, y+=20 );
}

//--------------------------------------------------------------
void SquareApp::exit()
{
    ofUnregisterTouchEvents( this );
    ofxiPhoneAlerts.removeListener( this );
}

//--------------------------------------------------------------
void SquareApp::touchDown(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void SquareApp::touchMoved(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void SquareApp::touchUp(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void SquareApp::touchDoubleTap(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void SquareApp::lostFocus(){

}

//--------------------------------------------------------------
void SquareApp::gotFocus(){

}

//--------------------------------------------------------------
void SquareApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void SquareApp::deviceOrientationChanged(int newOrientation){

}


//--------------------------------------------------------------
void SquareApp::touchCancelled(ofTouchEventArgs& args){

}

