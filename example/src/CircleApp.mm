#include "CircleApp.h"

CircleApp :: CircleApp ()
{
    cout << "creating CircleApp" << endl;
}

CircleApp :: ~CircleApp ()
{
    cout << "destroying CircleApp" << endl;
}

//--------------------------------------------------------------
void CircleApp::setup(){	
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
void CircleApp::update(){

}

//--------------------------------------------------------------
void CircleApp::draw()
{
    int x = ofGetWidth()  * 0.5;
    int y = ofGetHeight() * 0.5;
    
	ofSetColor( ofColor :: red );
    ofCircle( x, y, 100 );
    
    x = 20;
    y = 0;
    
    ofSetColor( ofColor :: white );
    ofDrawBitmapString( "frame num      = " + ofToString( ofGetFrameNum() ),    x, y+=20 );
    ofDrawBitmapString( "frame rate     = " + ofToString( ofGetFrameRate() ),   x, y+=20 );
    ofDrawBitmapString( "screen width   = " + ofToString( ofGetWidth() ),       x, y+=20 );
    ofDrawBitmapString( "screen height  = " + ofToString( ofGetHeight() ),      x, y+=20 );
}

//--------------------------------------------------------------
void CircleApp::exit()
{
    ofUnregisterTouchEvents( this );
    ofxiPhoneAlerts.removeListener( this );
}

//--------------------------------------------------------------
void CircleApp::touchDown(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void CircleApp::touchMoved(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void CircleApp::touchUp(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void CircleApp::touchDoubleTap(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void CircleApp::lostFocus(){

}

//--------------------------------------------------------------
void CircleApp::gotFocus(){

}

//--------------------------------------------------------------
void CircleApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void CircleApp::deviceOrientationChanged(int newOrientation){

}


//--------------------------------------------------------------
void CircleApp::touchCancelled(ofTouchEventArgs& args){

}

