#include "TriangleApp.h"

TriangleApp :: TriangleApp ()
{
    cout << "creating TriangleApp" << endl;
}

TriangleApp :: ~TriangleApp ()
{
    cout << "destroying TriangleApp" << endl;
}

//--------------------------------------------------------------
void TriangleApp::setup(){	
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
void TriangleApp::update(){

}

//--------------------------------------------------------------
void TriangleApp::draw()
{
    int a = 100;
    int b = sqrt( a * a + a * a );
    int x = ofGetWidth()  * 0.5;
    int y = ofGetHeight() * 0.5 - 50;
    
	ofSetColor( ofColor :: red );
    ofTriangle( x, y - a, x + b, y + b, x - b, y + b );
    
    x = 20;
    y = 0;
    
    ofSetColor( ofColor :: white );
    ofDrawBitmapString( "frame num      = " + ofToString( ofGetFrameNum() ),    x, y+=20 );
    ofDrawBitmapString( "frame rate     = " + ofToString( ofGetFrameRate() ),   x, y+=20 );
    ofDrawBitmapString( "screen width   = " + ofToString( ofGetWidth() ),       x, y+=20 );
    ofDrawBitmapString( "screen height  = " + ofToString( ofGetHeight() ),      x, y+=20 );
}

//--------------------------------------------------------------
void TriangleApp::exit()
{
    ofUnregisterTouchEvents( this );
    ofxiPhoneAlerts.removeListener( this );
}

//--------------------------------------------------------------
void TriangleApp::touchDown(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void TriangleApp::touchMoved(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void TriangleApp::touchUp(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void TriangleApp::touchDoubleTap(ofTouchEventArgs &touch){

}

//--------------------------------------------------------------
void TriangleApp::lostFocus(){

}

//--------------------------------------------------------------
void TriangleApp::gotFocus(){

}

//--------------------------------------------------------------
void TriangleApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void TriangleApp::deviceOrientationChanged(int newOrientation){

}


//--------------------------------------------------------------
void TriangleApp::touchCancelled(ofTouchEventArgs& args){

}

